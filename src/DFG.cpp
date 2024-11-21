/*
 * ======================================================================
 * DFG.cpp
 * ======================================================================
 * DFG implementation.
 *
 * Author : Cheng Tan
 *   Date : July 16, 2019
 */

#include <fstream>
#include "DFG.h"

DFG::DFG(Function &t_F, list<Loop *> *t_loops, bool t_targetFunction,
         bool t_precisionAware, bool t_heterogeneity,
         map<string, int> *t_execLatency, list<string> *t_pipelinedOpt)
{
  m_num = 0;
  m_nodeCount = 0;
  m_targetFunction = t_targetFunction;
  m_targetLoops = t_loops;
  m_orderedNodes = NULL;
  m_CDFGFused = false;
  m_cycleNodeLists = new list<list<DFGNode *> *>();
  m_precisionAware = t_precisionAware;

  construct(t_F);
  //  tuneForBranch();
  //  tuneForBitcast();
  //  tuneForLoad();
  if (t_heterogeneity)
  {
    calculateCycles();
    //    combine("phi", "add");
    combine("and", "xor");
    //    combine("br", "phi");
    //    combine("add", "icmp");
    //    combine("xor", "add");
    combineCmpBranch();
    combine("icmp", "br");
    combine("getelementptr", "load");
    tuneForPattern();

    //    calculateCycles();
    ////    combine("icmp", "br");
    //    combine("xor", "add");
    //    tuneForPattern();
  }
  //  trimForStandalone();
  initExecLatency(t_execLatency);
  initPipelinedOpt(t_pipelinedOpt);
}

DFG::DFG(list<Loop *> *t_loops, bool t_targetFunction,
         bool t_precisionAware, bool t_heterogeneity,
         map<string, int> *t_execLatency, list<string> *t_pipelinedOpt, bool t_isSupportMemory)
{
  m_num = 0;
  m_targetFunction = t_targetFunction;
  m_targetLoops = t_loops;
  m_orderedNodes = NULL;
  this->m_CDFGFused = false;
  m_cycleNodeLists = new list<list<DFGNode *> *>();
  m_precisionAware = t_precisionAware;
  this->m_DFGEdges.clear();
  this->nodes.clear();
  this->dataNodes.clear();
  this->m_ctrlEdges.clear();
  m_nodeCount = 0;
  m_dataNodeCount = 0;
  m_ctrledgeCount = 0;
  m_dfgedgeCount = 0;
  for (Loop *loop : *t_loops)
  {
    DFGLoops.push_back(loop);
    if (t_isSupportMemory)
    {
      this->constructWithDataMem(loop);
    }
    else
    {
      this->construct(loop);
    }
    cout << "==================================\n";
  }
  this->connectDFGNodes();
  this->calculateCycles();
  cout << "==================================\n";
  this->reorderInLongest();
  cout << "==================================\n";
  cout << "[Show cycle Lists]\n";
  for (auto cyclelist : *m_cycleNodeLists)
  {
    for (auto node : *cyclelist)
    {
      cout << node->getID() << " ";
    }
    cout << endl;
  }
  cout << "==================================\n";
  errs() << "Nodes Count: " << this->getNodeCount() << "\n";
  errs() << "Fu Nodes Count: " << this->getFuNodeCount() << "\n";
  errs() << "Data Nodes Count: " << this->getDataNodeCount() << "\n";
  for (DataNode *dataNodes : this->dataNodes)
  {
    errs() << "Data Node: " << dataNodes->getID() << "\n";
  }
}

// FIXME: only combine operations of mul+alu and alu+cmp for now,
//        since these two are the most common patterns across all
//        the kernels.
void DFG::tuneForPattern()
{

  // reconstruct connected DFG by modifying m_DFGEdge
  list<DFGNode *> *removeNodes = new list<DFGNode *>();
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->hasCombined())
    {
      if (dfgNode->isPatternRoot())
      {
        for (DFGNode *patternNode : *(dfgNode->getPatternNodes()))
        {
          if (hasDFGEdge(dfgNode, patternNode))
            m_DFGEdges.remove(getDFGEdge(dfgNode, patternNode));
          for (DFGNode *predNode : *(patternNode->getPredNodes()))
          {
            if (predNode == dfgNode or
                predNode->isOneOfThem(dfgNode->getPatternNodes()))
            {
              deleteDFGEdge(predNode, patternNode);
              continue;
            }
            DFGNode *newPredNode = NULL;
            if (predNode->hasCombined())
              newPredNode = predNode->getPatternRoot();
            else
              newPredNode = predNode;
            replaceDFGEdge(predNode, patternNode, newPredNode, dfgNode);
          }
          for (DFGNode *succNode : *(patternNode->getSuccNodes()))
          {
            if (succNode == dfgNode or
                succNode->isOneOfThem(dfgNode->getPatternNodes()))
            {
              deleteDFGEdge(patternNode, succNode);
              continue;
            }
            DFGNode *newSuccNode = NULL;
            if (succNode->hasCombined())
              newSuccNode = succNode->getPatternRoot();
            else
              newSuccNode = succNode;
            replaceDFGEdge(patternNode, succNode, dfgNode, newSuccNode);
          }
        }
      }
      else
      {
        removeNodes->push_back(dfgNode);
      }
    }
  }
  for (DFGNode *dfgNode : *removeNodes)
  {
    nodes.remove(dfgNode);
  }
}

void DFG::combineCmpBranch()
{
  // detect patterns (e.g., cmp+branch)
  DFGNode *addNode = NULL;
  DFGNode *cmpNode = NULL;
  DFGNode *brhNode = NULL;
  bool found = false;
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isAdd() and !dfgNode->hasCombined())
    {
      found = false;
      for (DFGNode *succNode : *(dfgNode->getSuccNodes()))
      {
        if (succNode->isCmp() and !succNode->hasCombined())
        {
          for (DFGNode *succSuccNode : *(succNode->getSuccNodes()))
          {
            if (succSuccNode->isBranch() and !succSuccNode->hasCombined() and
                succSuccNode->isSuccessorOf(dfgNode))
            {
              addNode = dfgNode;
              addNode->setCombine();
              cmpNode = succNode;
              addNode->addPatternPartner(cmpNode);
              cmpNode->setCombine();
              brhNode = succSuccNode;
              addNode->addPatternPartner(brhNode);
              brhNode->setCombine();
              found = true;
              break;
            }
          }
        }
        if (found)
          break;
      }
    }
  }
}

void DFG::combineMulAdd()
{
  // detect patterns (e.g., mul+alu)
  DFGNode *mulNode = NULL;
  DFGNode *addNode = NULL;
  bool found = false;
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isMul() and !dfgNode->hasCombined())
    {
      for (DFGNode *succNode : *(dfgNode->getSuccNodes()))
      {
        if (succNode->isAdd() and !succNode->hasCombined())
        {
          mulNode = dfgNode;
          mulNode->setCombine();
          addNode = succNode;
          mulNode->addPatternPartner(addNode);
          addNode->setCombine();
          break;
        }
      }
    }
  }
}

void DFG::combine(string t_opt0, string t_opt1)
{
  DFGNode *opt0Node = NULL;
  DFGNode *opt1Node = NULL;
  bool found = false;
  for (DFGNode *dfgNode : nodes)
  {
    //    if (dfgNode->isOpt(t_opt0) and dfgNode->isCritical() and !dfgNode->hasCombined()) {
    if (dfgNode->isOpt(t_opt0) and !dfgNode->hasCombined())
    {
      for (DFGNode *succNode : *(dfgNode->getSuccNodes()))
      {
        if (succNode->isOpt(t_opt1) and !succNode->hasCombined())
        {
          opt0Node = dfgNode;
          opt0Node->setCombine();
          opt1Node = succNode;
          opt0Node->addPatternPartner(opt1Node);
          opt1Node->setCombine();
          break;
        }
      }
    }
  }
}

// Combines patterns provided by users which should be a cycle, otherwise, the fusion won't be performed.
void DFG::combineForIter(list<string> *t_targetPattern)
{
  int patternSize = t_targetPattern->size();
  string headOpt = string(t_targetPattern->front());
  list<string>::iterator currentFunc = t_targetPattern->begin();
  currentFunc++;
  // toBeMatchedDFGNodes is to store the DFG nodes that match the pattern
  list<DFGNode *> *toBeMatchedDFGNodes = new list<DFGNode *>[patternSize];
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isOpt(headOpt) and !dfgNode->hasCombined())
    {
      toBeMatchedDFGNodes->push_back(dfgNode);
      // the for loop below is to find the target pattern under specific dfgNode
      for (int i = 1; i < patternSize; i++, currentFunc++)
      {
        string t_opt = *currentFunc;
        DFGNode *tailNode = toBeMatchedDFGNodes->back();
        for (DFGNode *succNode : *(tailNode->getSuccNodes()))
        {
          if (succNode->isOpt(t_opt) and !succNode->hasCombined())
          {
            // Indicate the pattern is finally found and matched
            if (i == (patternSize - 1) and dfgNode->isSuccessorOf(succNode))
            {
              toBeMatchedDFGNodes->push_back(succNode);
              for (DFGNode *optNode : *toBeMatchedDFGNodes)
              {
                if (optNode != dfgNode)
                {
                  dfgNode->addPatternPartner(optNode);
                }
                optNode->setCombine();
              }
              break;
            }
            else if (i == (patternSize - 1) and !dfgNode->isSuccessorOf(succNode))
            {
              continue;
            }
            else
            {
              toBeMatchedDFGNodes->push_back(succNode);
              break;
            }
          }
        }
      }
      toBeMatchedDFGNodes->clear();
      currentFunc = t_targetPattern->begin();
      currentFunc++;
    }
  }
}

// combineForUnroll is used to reconstruct "phi-add-add-..." alike patterns with a limited length.
void DFG::combineForUnroll(list<string> *t_targetPattern)
{
  int patternSize = t_targetPattern->size();
  if (patternSize > 4)
  {
    std::cout << "[ERROR] we currently only support pattern with length less than 5." << std::endl;
    // the longest length can be combined is 4
    return;
  }
  string headOpt = string(t_targetPattern->front());
  list<string>::iterator currentFunc = t_targetPattern->begin();
  currentFunc++;
  // toBeMatchedDFGNodes is to store the DFG nodes that match the pattern
  list<DFGNode *> *toBeMatchedDFGNodes = new list<DFGNode *>[patternSize];
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isOpt(headOpt) and !dfgNode->hasCombined() and dfgNode->getID() != 1)
    {
      toBeMatchedDFGNodes->push_back(dfgNode);
      // the for loop below is to find the target pattern under specific dfgNode
      for (int i = 1; i < patternSize; i++, currentFunc++)
      {
        string t_opt = *currentFunc;
        DFGNode *tailNode = toBeMatchedDFGNodes->back();
        for (DFGNode *succNode : *(tailNode->getSuccNodes()))
        {
          if (succNode->isOpt(t_opt) and !succNode->hasCombined())
          {
            if (i == (patternSize - 1))
            {
              toBeMatchedDFGNodes->push_back(succNode);
              for (DFGNode *optNode : *toBeMatchedDFGNodes)
              {
                if (optNode != dfgNode)
                {
                  dfgNode->addPatternPartner(optNode);
                }
                optNode->setCombine();
              }
              break;
            }
            else
            {
              toBeMatchedDFGNodes->push_back(succNode);
              break;
            }
          }
        }
      }
      toBeMatchedDFGNodes->clear();
      currentFunc = t_targetPattern->begin();
      currentFunc++;
    }
  }
}

bool DFG::shouldIgnore(Instruction *t_inst)
{
  if (m_targetFunction)
  {
    return false;
  }
  if (m_targetLoops->size() == 0)
    return false;
  for (Loop *current_loop : *m_targetLoops)
  {
    if (current_loop->contains(t_inst))
    {
      return false;
    }
  }
  return true;
}

list<DFGNode *> *DFG::getDFSOrderedNodes()
{
  if (m_orderedNodes != NULL)
    return m_orderedNodes;
  m_orderedNodes = new list<DFGNode *>();
  list<DFGNode *> tempNodes;
  while (m_orderedNodes->size() < nodes.size())
  {
    DFGNode *startNode = NULL;
    int curWithMaxSucc = 0;
    for (DFGNode *dfgNode : nodes)
    {
      if (find(m_orderedNodes->begin(), m_orderedNodes->end(), dfgNode) ==
          m_orderedNodes->end())
      {
        if (dfgNode->getSuccNodes()->size() > curWithMaxSucc)
        {
          curWithMaxSucc = dfgNode->getSuccNodes()->size();
          startNode = dfgNode;
        }
      }
    }
    if (startNode != NULL)
    {
      assert(find(m_orderedNodes->begin(), m_orderedNodes->end(), startNode) ==
             m_orderedNodes->end());
      tempNodes.push_back(startNode);
      m_orderedNodes->push_back(startNode);
    }
    //    for (DFGNode* dfgNode: nodes) {
    //      if (find(m_orderedNodes->begin(), m_orderedNodes->end(), dfgNode) ==
    //          m_orderedNodes->end()) {
    //        tempNodes.push_back(dfgNode);
    //        m_orderedNodes->push_back(dfgNode);
    //        break;
    //      }
    //    }
    DFGNode *currentNode;
    while (tempNodes.size() != 0)
    {
      currentNode = tempNodes.back();
      list<DFGNode *> *succNodes = currentNode->getSuccNodes();
      bool canPop = true;
      for (DFGNode *succNode : *succNodes)
      {
        if (find(m_orderedNodes->begin(), m_orderedNodes->end(), succNode) ==
            m_orderedNodes->end())
        {
          tempNodes.push_back(succNode);
          canPop = false;
          m_orderedNodes->push_back(succNode);
          break;
        }
      }
      if (canPop)
      {
        tempNodes.pop_back();
      }
    }
  }
  cout << "\nordered nodes: \n";
  for (DFGNode *dfgNode : *m_orderedNodes)
  {
    cout << dfgNode->getID() << "  ";
  }
  cout << "\n";
  assert(m_orderedNodes->size() == nodes.size());
  return m_orderedNodes;
}

list<DFGNode *> *DFG::getBFSOrderedNodes()
{
  if (m_orderedNodes != NULL)
    return m_orderedNodes;
  m_orderedNodes = new list<DFGNode *>();
  list<DFGNode *> tempNodes;
  while (m_orderedNodes->size() < nodes.size())
  {
    for (DFGNode *dfgNode : nodes)
    {
      if (find(m_orderedNodes->begin(), m_orderedNodes->end(), dfgNode) ==
          m_orderedNodes->end())
      {
        tempNodes.push_back(dfgNode);
        m_orderedNodes->push_back(dfgNode);
        break;
      }
    }
    DFGNode *currentNode;
    while (tempNodes.size() != 0)
    {
      currentNode = tempNodes.front();
      tempNodes.pop_front();
      for (DFGNode *succNode : *currentNode->getSuccNodes())
      {
        if (find(m_orderedNodes->begin(), m_orderedNodes->end(), succNode) ==
            m_orderedNodes->end())
        {
          tempNodes.push_back(succNode);
          m_orderedNodes->push_back(succNode);
        }
      }
    }
  }
  cout << "\nordered nodes: \n";
  for (DFGNode *dfgNode : *m_orderedNodes)
  {
    cout << dfgNode->getID() << "  ";
  }
  cout << "\n";
  assert(m_orderedNodes->size() == nodes.size());
  return m_orderedNodes;
}

// extract DFG with data accessing info
bool DFG::constructWithDataMem(Loop *L)
{
  if (!L->getSubLoops().empty())
  {
    errs() << "Nested Loop not Supported: " << L->getName() << "\n";
    return false;
  }

  errs() << "Loop Detected: " << L->getName() << "\n";
  errs() << "Loop Header: " << L->getHeader()->getName() << "\n";
  errs() << "Blocks Detected: \n";

  for (BasicBlock *BB : L->getBlocks())
  {
    errs() << "BB: " << BB->getName() << "\n";
    LoopBBs[L].push_back(BB);
    for (Instruction &I : *BB)
    {
      Instruction *ptrI = &I;
      errs() << "  " << I << "\n";
      BBInsts[BB].push_back(ptrI);
    }
  }

  // Construct DFG nodes.
  for (BasicBlock *BB : L->getBlocks())
  {
    BasicBlock *curBB = BB;
    errs() << "*** current basic block: " << *curBB->begin() << "\n";
    for (BasicBlock *sucBB : successors(curBB))
    {
      errs() << "   ****** succ bb: " << *sucBB->begin() << "\n";
    }

    for (BasicBlock::iterator II = curBB->begin(), IEnd = curBB->end(); II != IEnd; ++II)
    {

      Instruction *curII = &*II;
      errs() << *curII << "\n";

      // Make nodes for each instruction in the basic block.
      DFGNode *dfgNode;
      if (this->hasNode(curII))
      {
        dfgNode = this->getNode(curII);
      }
      else
      {
        dfgNode = new DFGNode(this->m_nodeCount++, m_precisionAware, curII, getValueName(curII));
        this->nodes.push_back(dfgNode);
        this->allNodes.push_back(dfgNode);
        cout << " (ID: " << dfgNode->getID() << ")\n";
      }

      // Handle Load/Store instructions and Out-of-BB instructions.
      if (curII->getOpcode() == Instruction::Load || curII->getOpcode() == Instruction::Store || this->isLiveInBasicBlock(curBB, curII))
      {
        if (curII->getOpcode() == Instruction::Load)
        {
          LoadInst *loadInst = dyn_cast<LoadInst>(curII);
          if (loadInst)
          {
            DFGNode *loadNode = this->getNode(loadInst);
            DataNode *dataNode; // Use this node to store the array data
            errs() << "\t[Memory Node] LoadInst Operand: " << *loadInst->getOperand(0) << "\n";
            Instruction *gepInst = getParentGEP(loadInst);
            if (gepInst)
            {
              errs() << "\t[Memory Node] Parent GEP: " << *gepInst << "\n";
              DFGNode *gepNode;
              if (!this->hasNode(gepInst))
              {
                errs() << *gepInst << "\n";
                gepNode = new DFGNode(this->m_nodeCount++, m_precisionAware, gepInst, this->getValueName(gepInst));
                this->nodes.push_back(gepNode);
                this->allNodes.push_back(gepNode);
                cout << " (ID: " << dfgNode->getID() << ")\n";
              }
              else
              {
                gepNode = this->getNode(gepInst);
              }

              Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              int datasize = DL.getTypeAllocSize(pointertype);
              errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              dataNode = new DataNode(this->m_dataNodeCount++, m_precisionAware, gepInst->getOperand(0), gepInst->getOperand(0)->getName(), datasize, pointertype);
              this->dataNodes.push_back(dataNode);
              this->allNodes.push_back(dataNode);
              dataNode->setParentNode(loadNode);
              loadNode->sethasMemory(true);
              errs() << dataNode->getOpcodeName() << "[size = " << dataNode->getSize() << "]" << ": " << dataNode->getValue()->getName() << " ";
              cout << " (ID: " << dataNode->getID() << ")\n";
            }
            else
            {
              errs() << " gepInst is NULL\n";
              return false;
              // Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              // errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              // DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              // Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              // errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              // int datasize = DL.getTypeAllocSize(pointertype);
              // errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              // dataNode = new DataNode(dataNodeID++, m_precisionAware, loadInst->getOperand(0), loadInst->getOperand(0)->getName(), datasize, );
              // this->dataNodes.push_back(dataNode);
              // this->allNodes.push_back(dataNode);
              // errs() << dataNode->getOpcodeName() << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }

            // DFGEdge *dataEdge; // Create data edge dataNode -> loadNode
            // if (this->hasDFGEdge(dataNode, loadNode))
            // {
            //   dataEdge = this->getDFGEdge(dataNode, loadNode);
            // }
            // else
            // {
            //   dataEdge = new DFGEdge(this->m_dfgedgeCount++, dataNode, loadNode);
            //   this->m_DFGEdges.push_back(dataEdge);
            // }
            continue;
          }
          else
          {
            errs() << "[ERROR] loadInst is NULL\n";
            return false;
          }
        }
        else if (curII->getOpcode() == Instruction::Store)
        {
          StoreInst *storeInst = dyn_cast<StoreInst>(curII);
          if (storeInst)
          {
            DFGNode *storeNode = this->getNode(storeInst);
            DataNode *dataNode; // Use this node to store the array data
            Instruction *gepInst = getParentGEP(storeInst);
            if (gepInst)
            {
              errs() << "\t[Memory Node] Parent GEP: " << *gepInst << "\n";
              DFGNode *gepNode;
              if (!this->hasNode(gepInst))
              {
                errs() << *gepInst << "\n";
                gepNode = new DFGNode(m_nodeCount++, m_precisionAware, gepInst, this->getValueName(gepInst));
                this->nodes.push_back(gepNode);
                cout << " (ID: " << dfgNode->getID() << ")\n";
              }
              else
              {
                gepNode = this->getNode(gepInst);
              }

              Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              int datasize = DL.getTypeAllocSize(pointertype);
              errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              dataNode = new DataNode(m_dataNodeCount++, m_precisionAware, gepInst->getOperand(0), gepInst->getOperand(0)->getName(), datasize, pointertype);
              this->dataNodes.push_back(dataNode);
              dataNode->setParentNode(storeNode);
              storeNode->sethasMemory(true);
              errs() << dataNode->getOpcodeName() << "[size = " << dataNode->getSize() << "]" << ": " << dataNode->getValue()->getName() << " ";
              cout << " (ID: " << dataNode->getID() << ")\n";
            }
            else
            {
              errs() << "[ERROR] 1 storeInst is NULL\n";
              return false;
              // dataNode = new DataMemNode(m_nodeCount++, m_precisionAware, storeInst->getOperand(1), storeInst->getOperand(1)->getName());
              // this->nodes.push_back(dataNode);
              // errs() << dataNode->getOpcodeName() << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }
            // errs() << "DataMemNode Value: " << dataNode->getValue()->getName() << "\n";
            // errs() << "DataMemNode StringRef: " << dataNode->getStringRef() << "\n";
            // errs() << "DataMemNode Opcode Name: " << dataNode->getOpcodeName() << "\n";
            // errs() << "DataMemNode Function Type: " << dataNode->getFuType() << "\n";
            // dataNode->addPredNode(storeNode);

            // DFGEdge *dataEdge; // Create data edge storeNode -> dataNode
            // if (this->hasDFGEdge(storeNode, dataNode))
            // {
            //   dataEdge = this->getDFGEdge(storeNode, dataNode);
            // }
            // else
            // {
            //   dataEdge = new DFGEdge(m_dfgedgeCount++, storeNode, dataNode);
            //   this->m_allEdges.push_back(dataEdge);
            // }

            if (storeInst->getOperand(0))
            {
              errs() << "storeInst Operand: " << *storeInst->getOperand(0) << "\n";
            }
            else
            {
              errs() << "storeInst Operand is NULL\n";
            }

            DFGNode *storeValNode;
            if (this->hasNode(storeInst->getOperand(0)))
            {
              storeValNode = this->getNode(storeInst->getOperand(0));
            }
            else
            {

              storeValNode = new DFGNode(m_nodeCount++, m_precisionAware, dyn_cast<Instruction>(storeInst->getOperand(0)), storeInst->getOperand(0)->getName());
              errs() << storeNode->getInst() << " ";
              cout << " (ID: " << dataNode->getID() << ")\n";
              this->nodes.push_back(storeValNode);
            }

            DFGEdge *dfgEdge; // Create dfg edge storeValNode -> storeNode
            if (this->hasDFGEdge(storeValNode, storeNode))
            {
              dfgEdge = this->getDFGEdge(storeValNode, storeNode);
            }
            else
            {
              dfgEdge = new DFGEdge(m_dfgedgeCount++, storeValNode, storeNode);
              this->m_DFGEdges.push_back(dfgEdge);
            }
            continue;
          }
          else
          {
            errs() << "[ERROR] storeInst is NULL\n";
            return false;
          }
        }
        else if (this->isLiveInBasicBlock(curBB, curII))
        {
          if (curII->getOpcode() == Instruction::PHI)
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(this->m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (hasCtrlEdge(outBBNode, dfgNode))
            {
              errs() << "Control Edge already exists.\n";
              ctrlEdge = getCtrlEdge(outBBNode, dfgNode);
            }
            else
            {
              errs() << "Control Edge does not exist.\n";
              ctrlEdge = new DFGEdge(this->m_ctrledgeCount++, outBBNode, dfgNode, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
            }
          }
          else if (curII->getOpcode() == Instruction::Br)
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (this->hasCtrlEdge(dfgNode, outBBNode))
            {
              ctrlEdge = getCtrlEdge(dfgNode, outBBNode);
            }
            else
            {
              ctrlEdge = new DFGEdge(m_ctrledgeCount++, dfgNode, outBBNode, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
            }
          }
          else
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *dfgEdge;
            if (this->hasDFGEdge(outBBNode, dfgNode))
            {
              dfgEdge = getDFGEdge(outBBNode, dfgNode);
            }
            else
            {
              dfgEdge = new DFGEdge(m_ctrledgeCount++, outBBNode, dfgNode);
              this->m_DFGEdges.push_back(dfgEdge);
            }
          }
        }
      }
    }

    errs() << "==================================\n";
    errs() << "===Done DFG Nodes Construction.===\n";

    // Construct DFG Control Edges
    for (DFGNode *node : this->nodes)
    {
      if (node->getOpcodeName() == "datamem")
      {
        continue;
      }
      Instruction *curII = node->getInst();
      assert(node->getInst() == curII);

      // Only consider the control dependencies for nodes in current BB
      if (BBInsts.find(curII->getParent()) == BBInsts.end())
      {
        continue;
      }

      if (curII->getOpcode() == Instruction::PHI)
      {
        PHINode *phiNode = dyn_cast<PHINode>(curII);
        errs() << "Phi Instruction: " << *phiNode << "\n";
        for (unsigned i = 0; i < phiNode->getNumIncomingValues(); i++)
        {
          if (Instruction *inst = dyn_cast<Instruction>(phiNode->getIncomingBlock(i)->getTerminator()))
          {
            errs() << "Phi Instruction ctrl operand " << *inst << "\n";
            DFGNode *ctrlNode;
            if (this->hasNode(inst))
            {
              ctrlNode = this->getNode(inst);
            }
            else
            {
              DFGNode *ctrlNode = new DFGNode(m_nodeCount++, m_precisionAware, inst, getValueName(inst));
              this->nodes.push_back(ctrlNode);
              cout << " (ID: " << ctrlNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (this->hasCtrlEdge(ctrlNode, node))
            {
              errs() << "Control Edge already exists.\n";
              ctrlEdge = this->getCtrlEdge(ctrlNode, node);
            }
            else
            {
              errs() << "Control Edge does not exist.\n";
              ctrlEdge = new DFGEdge(m_ctrledgeCount++, ctrlNode, node, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
              errs() << "Control Edge: " << ctrlEdge->getID() << " " << ctrlEdge->getSrc()->getID() << " -> " << ctrlEdge->getDst()->getID() << "\n";
            }
          }
        }
      }
    }
    errs() << "==================================\n";
    errs() << "===Done DFG Contrl Edges Construction.===\n";

    // Construct DFG Data Flow Edges
    for (DFGNode *node : this->nodes)
    {
      if (node->getOpcodeName() == "datamem")
      {
        continue;
      }
      Instruction *curII = node->getInst();
      errs() << "Instruction: " << *curII << "\n";
      for (Instruction::op_iterator op = curII->op_begin(); op != curII->op_end(); op++)
      {
        Instruction *tempInst = dyn_cast<Instruction>(*op);
        if (tempInst)
        {
          errs() << "Operand: " << *tempInst << "\n";
          DFGEdge *dfgEdge;
          if (this->hasNode(tempInst))
          {
            if (hasDFGEdge(this->getNode(tempInst), node))
            {
              dfgEdge = this->getDFGEdge(this->getNode(tempInst), node);
            }
            else
            {
              dfgEdge = new DFGEdge(m_dfgedgeCount++, this->getNode(tempInst), node);
              this->m_DFGEdges.push_back(dfgEdge);
            }
          }
          else
          {
            DFGNode *tempNode = new DFGNode(m_nodeCount++, m_precisionAware, tempInst, getValueName(tempInst));
            this->nodes.push_back(tempNode);
            cout << " (ID: " << tempNode->getID() << ")\n";
            dfgEdge = new DFGEdge(m_dfgedgeCount++, this->getNode(tempInst), node);
            this->m_DFGEdges.push_back(dfgEdge);
          }
        }
      }
    }
    errs() << "==================================\n";
    errs() << "===Done DFG Data Flow Edges Construction.===\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Nodes===\n";
  for (DFGNode *node : this->nodes)
  {
    errs() << "DFG Node: " << node->getID() << " " << *node->getValue() << "\n";
  }

  for (DataNode *dataNode : this->dataNodes)
  {
    errs() << "DFG Node: " << dataNode->getID() << "  " << dataNode->getOpcodeName() << "[size=" << dataNode->getSize() << "]: " << *dataNode->getValue() << ", Parent:" << dataNode->getParentNode()->getID() << "\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Control Edges===\n";
  for (DFGEdge *edge : this->m_ctrlEdges)
  {
    errs() << "DFG Control Edge: " << edge->getID() << " " << edge->getSrc()->getID() << " -> " << edge->getDst()->getID() << "\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Data Flow Edges===\n";
  for (DFGEdge *edge : this->m_DFGEdges)
  {
    errs() << "DFG Data Flow Edge: " << edge->getID() << " " << edge->getSrc()->getID() << " -> " << edge->getDst()->getID() << "\n";
  }
  // reorderInLongest();
  return true;
}

// extract DFG with data accessing info
bool DFG::construct(Loop *L)
{
  if (!L->getSubLoops().empty())
  {
    errs() << "Nested Loop not Supported: " << L->getName() << "\n";
    return false;
  }

  errs() << "Loop Detected: " << L->getName() << "\n";
  errs() << "Loop Header: " << L->getHeader()->getName() << "\n";
  errs() << "Blocks Detected: \n";

  for (BasicBlock *BB : L->getBlocks())
  {
    errs() << "BB: " << BB->getName() << "\n";
    LoopBBs[L].push_back(BB);
    for (Instruction &I : *BB)
    {
      Instruction *ptrI = &I;
      errs() << "  " << I << "\n";
      BBInsts[BB].push_back(ptrI);
    }
  }

  // Construct DFG nodes.
  for (BasicBlock *BB : L->getBlocks())
  {
    BasicBlock *curBB = BB;
    errs() << "*** current basic block: " << *curBB->begin() << "\n";
    for (BasicBlock *sucBB : successors(curBB))
    {
      errs() << "   ****** succ bb: " << *sucBB->begin() << "\n";
    }

    for (BasicBlock::iterator II = curBB->begin(), IEnd = curBB->end(); II != IEnd; ++II)
    {

      Instruction *curII = &*II;
      errs() << *curII << "\n";

      // Make nodes for each instruction in the basic block.
      DFGNode *dfgNode;
      if (this->hasNode(curII))
      {
        dfgNode = this->getNode(curII);
      }
      else
      {
        dfgNode = new DFGNode(this->m_nodeCount++, m_precisionAware, curII, getValueName(curII));
        this->nodes.push_back(dfgNode);
        this->allNodes.push_back(dfgNode);
        cout << " (ID: " << dfgNode->getID() << ")\n";
      }

      // Handle Load/Store instructions and Out-of-BB instructions.
      if (curII->getOpcode() == Instruction::Load || curII->getOpcode() == Instruction::Store || this->isLiveInBasicBlock(curBB, curII))
      {
        if (curII->getOpcode() == Instruction::Load)
        {
          LoadInst *loadInst = dyn_cast<LoadInst>(curII);
          if (loadInst)
          {
            DFGNode *loadNode = this->getNode(loadInst);
            DataNode *dataNode; // Use this node to store the array data
            errs() << "\t[Memory Node] LoadInst Operand: " << *loadInst->getOperand(0) << "\n";
            Instruction *gepInst = getParentGEP(loadInst);
            if (gepInst)
            {
              errs() << "\t[Memory Node] Parent GEP: " << *gepInst << "\n";
              DFGNode *gepNode;
              if (!this->hasNode(gepInst))
              {
                errs() << *gepInst << "\n";
                gepNode = new DFGNode(this->m_nodeCount++, m_precisionAware, gepInst, this->getValueName(gepInst));
                this->nodes.push_back(gepNode);
                this->allNodes.push_back(gepNode);
                cout << " (ID: " << dfgNode->getID() << ")\n";
              }
              else
              {
                gepNode = this->getNode(gepInst);
              }

              // Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              // errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              // DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              // Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              // errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              // int datasize = DL.getTypeAllocSize(pointertype);
              // errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              // dataNode = new DataNode(this->m_dataNodeCount++, m_precisionAware, gepInst->getOperand(0), gepInst->getOperand(0)->getName(), datasize, pointertype);
              // this->dataNodes.push_back(dataNode);
              // this->allNodes.push_back(dataNode);
              // dataNode->setParentNode(loadNode);
              // loadNode->sethasMemory(true);
              // errs() << dataNode->getOpcodeName() << "[size = " << dataNode->getSize() << "]" << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }
            else
            {
              errs() << " gepInst is NULL\n";
              return false;
              // Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              // errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              // DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              // Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              // errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              // int datasize = DL.getTypeAllocSize(pointertype);
              // errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              // dataNode = new DataNode(dataNodeID++, m_precisionAware, loadInst->getOperand(0), loadInst->getOperand(0)->getName(), datasize, );
              // this->dataNodes.push_back(dataNode);
              // this->allNodes.push_back(dataNode);
              // errs() << dataNode->getOpcodeName() << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }

            // DFGEdge *dataEdge; // Create data edge dataNode -> loadNode
            // if (this->hasDFGEdge(dataNode, loadNode))
            // {
            //   dataEdge = this->getDFGEdge(dataNode, loadNode);
            // }
            // else
            // {
            //   dataEdge = new DFGEdge(this->m_dfgedgeCount++, dataNode, loadNode);
            //   this->m_DFGEdges.push_back(dataEdge);
            // }
            continue;
          }
          else
          {
            errs() << "[ERROR] loadInst is NULL\n";
            return false;
          }
        }
        else if (curII->getOpcode() == Instruction::Store)
        {
          StoreInst *storeInst = dyn_cast<StoreInst>(curII);
          if (storeInst)
          {
            DFGNode *storeNode = this->getNode(storeInst);
            DataNode *dataNode; // Use this node to store the array data
            Instruction *gepInst = getParentGEP(storeInst);
            if (gepInst)
            {
              errs() << "\t[Memory Node] Parent GEP: " << *gepInst << "\n";
              DFGNode *gepNode;
              if (!this->hasNode(gepInst))
              {
                errs() << *gepInst << "\n";
                gepNode = new DFGNode(m_nodeCount++, m_precisionAware, gepInst, this->getValueName(gepInst));
                this->nodes.push_back(gepNode);
                cout << " (ID: " << dfgNode->getID() << ")\n";
              }
              else
              {
                gepNode = this->getNode(gepInst);
              }

              // Type *gepPtrOprandType = dyn_cast<GetElementPtrInst>(gepInst)->getPointerOperandType();
              // errs() << "\t[Memory Node] gepPtrOprandType: " << *gepPtrOprandType << "\n";
              // DataLayout DL = gepInst->getParent()->getModule()->getDataLayout();

              // Type *pointertype = dyn_cast<PointerType>(gepPtrOprandType)->getElementType();
              // errs() << "\t[Memory Node] Type of Array Type: " << *pointertype << "\n";
              // int datasize = DL.getTypeAllocSize(pointertype);
              // errs() << "\t[Memory Node] Size of datasize: " << datasize << "\n";

              // dataNode = new DataNode(m_dataNodeCount++, m_precisionAware, gepInst->getOperand(0), gepInst->getOperand(0)->getName(), datasize, pointertype);
              // this->dataNodes.push_back(dataNode);
              // dataNode->setParentNode(storeNode);
              // storeNode->sethasMemory(true);
              // errs() << dataNode->getOpcodeName() << "[size = " << dataNode->getSize() << "]" << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }
            else
            {
              errs() << "[ERROR] 1 storeInst is NULL\n";
              return false;
              // dataNode = new DataMemNode(m_nodeCount++, m_precisionAware, storeInst->getOperand(1), storeInst->getOperand(1)->getName());
              // this->nodes.push_back(dataNode);
              // errs() << dataNode->getOpcodeName() << ": " << dataNode->getValue()->getName() << " ";
              // cout << " (ID: " << dataNode->getID() << ")\n";
            }
            // errs() << "DataMemNode Value: " << dataNode->getValue()->getName() << "\n";
            // errs() << "DataMemNode StringRef: " << dataNode->getStringRef() << "\n";
            // errs() << "DataMemNode Opcode Name: " << dataNode->getOpcodeName() << "\n";
            // errs() << "DataMemNode Function Type: " << dataNode->getFuType() << "\n";
            // dataNode->addPredNode(storeNode);

            // DFGEdge *dataEdge; // Create data edge storeNode -> dataNode
            // if (this->hasDFGEdge(storeNode, dataNode))
            // {
            //   dataEdge = this->getDFGEdge(storeNode, dataNode);
            // }
            // else
            // {
            //   dataEdge = new DFGEdge(m_dfgedgeCount++, storeNode, dataNode);
            //   this->m_allEdges.push_back(dataEdge);
            // }

            DFGNode *storeValNode;
            if (this->hasNode(storeInst->getOperand(0)))
            {
              storeValNode = this->getNode(storeInst->getOperand(0));
            }
            else
            {
              storeValNode = new DFGNode(m_nodeCount++, m_precisionAware, dyn_cast<Instruction>(storeInst->getOperand(0)), storeInst->getOperand(0)->getName());
              errs() << storeNode->getInst() << " ";
              cout << " (ID: " << dataNode->getID() << ")\n";
              this->nodes.push_back(storeValNode);
            }

            DFGEdge *dfgEdge; // Create dfg edge storeValNode -> storeNode
            if (this->hasDFGEdge(storeValNode, storeNode))
            {
              dfgEdge = this->getDFGEdge(storeValNode, storeNode);
            }
            else
            {
              dfgEdge = new DFGEdge(m_dfgedgeCount++, storeValNode, storeNode);
              this->m_DFGEdges.push_back(dfgEdge);
            }
            continue;
          }
          else
          {
            errs() << "[ERROR] storeInst is NULL\n";
            return false;
          }
        }
        else if (this->isLiveInBasicBlock(curBB, curII))
        {
          if (curII->getOpcode() == Instruction::PHI)
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(this->m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (hasCtrlEdge(outBBNode, dfgNode))
            {
              errs() << "Control Edge already exists.\n";
              ctrlEdge = getCtrlEdge(outBBNode, dfgNode);
            }
            else
            {
              errs() << "Control Edge does not exist.\n";
              ctrlEdge = new DFGEdge(this->m_ctrledgeCount++, outBBNode, dfgNode, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
            }
          }
          else if (curII->getOpcode() == Instruction::Br)
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (this->hasCtrlEdge(dfgNode, outBBNode))
            {
              ctrlEdge = getCtrlEdge(dfgNode, outBBNode);
            }
            else
            {
              ctrlEdge = new DFGEdge(m_ctrledgeCount++, dfgNode, outBBNode, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
            }
          }
          else
          {
            Instruction *outBBInst = this->getInstNotInBasicBlock(curBB, curII);
            DFGNode *outBBNode;

            if (this->hasNode(outBBInst))
            {
              outBBNode = this->getNode(outBBInst);
            }
            else
            {
              outBBNode = new DFGNode(m_nodeCount++, m_precisionAware, outBBInst, getValueName(outBBInst));
              this->nodes.push_back(outBBNode);
              cout << " (ID: " << outBBNode->getID() << ")\n";
            }

            DFGEdge *dfgEdge;
            if (this->hasDFGEdge(outBBNode, dfgNode))
            {
              dfgEdge = getDFGEdge(outBBNode, dfgNode);
            }
            else
            {
              dfgEdge = new DFGEdge(m_ctrledgeCount++, outBBNode, dfgNode);
              this->m_DFGEdges.push_back(dfgEdge);
            }
          }
        }
      }
    }

    errs() << "==================================\n";
    errs() << "===Done DFG Nodes Construction.===\n";

    // Construct DFG Control Edges
    for (DFGNode *node : this->nodes)
    {
      if (node->getOpcodeName() == "datamem")
      {
        continue;
      }
      Instruction *curII = node->getInst();
      assert(node->getInst() == curII);

      // Only consider the control dependencies for nodes in current BB
      if (BBInsts.find(curII->getParent()) == BBInsts.end())
      {
        continue;
      }

      if (curII->getOpcode() == Instruction::PHI)
      {
        PHINode *phiNode = dyn_cast<PHINode>(curII);
        errs() << "Phi Instruction: " << *phiNode << "\n";
        for (unsigned i = 0; i < phiNode->getNumIncomingValues(); i++)
        {
          if (Instruction *inst = dyn_cast<Instruction>(phiNode->getIncomingBlock(i)->getTerminator()))
          {
            errs() << "Phi Instruction ctrl operand " << *inst << "\n";
            DFGNode *ctrlNode;
            if (this->hasNode(inst))
            {
              ctrlNode = this->getNode(inst);
            }
            else
            {
              DFGNode *ctrlNode = new DFGNode(m_nodeCount++, m_precisionAware, inst, getValueName(inst));
              this->nodes.push_back(ctrlNode);
              cout << " (ID: " << ctrlNode->getID() << ")\n";
            }

            DFGEdge *ctrlEdge;
            if (this->hasCtrlEdge(ctrlNode, node))
            {
              errs() << "Control Edge already exists.\n";
              ctrlEdge = this->getCtrlEdge(ctrlNode, node);
            }
            else
            {
              errs() << "Control Edge does not exist.\n";
              ctrlEdge = new DFGEdge(m_ctrledgeCount++, ctrlNode, node, true);
              this->m_ctrlEdges.push_back(ctrlEdge);
              errs() << "Control Edge: " << ctrlEdge->getID() << " " << ctrlEdge->getSrc()->getID() << " -> " << ctrlEdge->getDst()->getID() << "\n";
            }
          }
        }
      }
    }
    errs() << "==================================\n";
    errs() << "===Done DFG Contrl Edges Construction.===\n";

    // Construct DFG Data Flow Edges
    for (DFGNode *node : this->nodes)
    {
      if (node->getOpcodeName() == "datamem")
      {
        continue;
      }
      Instruction *curII = node->getInst();
      errs() << "Instruction: " << *curII << "\n";
      for (Instruction::op_iterator op = curII->op_begin(); op != curII->op_end(); op++)
      {
        Instruction *tempInst = dyn_cast<Instruction>(*op);
        if (tempInst)
        {
          errs() << "Operand: " << *tempInst << "\n";
          DFGEdge *dfgEdge;
          if (this->hasNode(tempInst))
          {
            if (hasDFGEdge(this->getNode(tempInst), node))
            {
              dfgEdge = this->getDFGEdge(this->getNode(tempInst), node);
            }
            else
            {
              dfgEdge = new DFGEdge(m_dfgedgeCount++, this->getNode(tempInst), node);
              this->m_DFGEdges.push_back(dfgEdge);
            }
          }
          else
          {
            DFGNode *tempNode = new DFGNode(m_nodeCount++, m_precisionAware, tempInst, getValueName(tempInst));
            this->nodes.push_back(tempNode);
            cout << " (ID: " << tempNode->getID() << ")\n";
            dfgEdge = new DFGEdge(m_dfgedgeCount++, this->getNode(tempInst), node);
            this->m_DFGEdges.push_back(dfgEdge);
          }
        }
      }
    }
    errs() << "==================================\n";
    errs() << "===Done DFG Data Flow Edges Construction.===\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Nodes===\n";
  for (DFGNode *node : this->nodes)
  {
    errs() << "DFG Node: " << node->getID() << " " << *node->getValue() << "\n";
  }

  for (DataNode *dataNode : this->dataNodes)
  {
    errs() << "DFG Node: " << dataNode->getID() << "  " << dataNode->getOpcodeName() << "[size=" << dataNode->getSize() << "]: " << *dataNode->getValue() << ", Parent:" << dataNode->getParentNode()->getID() << "\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Control Edges===\n";
  for (DFGEdge *edge : this->m_ctrlEdges)
  {
    errs() << "DFG Control Edge: " << edge->getID() << " " << edge->getSrc()->getID() << " -> " << edge->getDst()->getID() << "\n";
  }

  errs() << "==================================\n";
  errs() << "===Print DFG Data Flow Edges===\n";
  for (DFGEdge *edge : this->m_DFGEdges)
  {
    errs() << "DFG Data Flow Edge: " << edge->getID() << " " << edge->getSrc()->getID() << " -> " << edge->getDst()->getID() << "\n";
  }
  // reorderInLongest();
  return true;
}

// extract DFG from specific function
void DFG::construct(Function &t_F)
{

  m_DFGEdges.clear();
  nodes.clear();
  m_ctrlEdges.clear();

  int nodeID = 0;
  int ctrlEdgeID = 0;
  int dfgEdgeID = 0;

  cout << "*** current function: " << t_F.getName().str() << "\n";

  // FIXME: eleminate duplicated edges.
  for (Function::iterator BB = t_F.begin(), BEnd = t_F.end();
       BB != BEnd; ++BB)
  {
    BasicBlock *curBB = &*BB;
    errs() << "*** current basic block: " << *curBB->begin() << "\n";
    for (BasicBlock *sucBB : successors(curBB))
    {
      errs() << "   ****** succ bb: " << *sucBB->begin() << "\n";
    }

    // Construct DFG nodes.
    for (BasicBlock::iterator II = curBB->begin(),
                              IEnd = curBB->end();
         II != IEnd; ++II)
    {
      Instruction *curII = &*II;

      // Ignore this IR if it is out of the scope.
      if (shouldIgnore(curII))
      {
        errs() << *curII << " *** ignored by pass due to that the BB is out of the scope (target loop)\n";
        continue;
      }
      errs() << *curII;
      DFGNode *dfgNode;
      if (hasNode(curII))
      {
        dfgNode = getNode(curII);
      }
      else
      {
        dfgNode = new DFGNode(nodeID++, m_precisionAware, curII, getValueName(curII));
        nodes.push_back(dfgNode);
      }
      cout << " (ID: " << dfgNode->getID() << ")\n";
    }
    Instruction *terminator = curBB->getTerminator();

    if (shouldIgnore(terminator))
      continue;
    //    DFGNode* dfgNodeTerm = new DFGNode(nodeID++, terminator, getValueName(terminator));
    for (BasicBlock *sucBB : successors(curBB))
    {
      // TODO: get the live-in nodes rather than front() and connect them
      for (BasicBlock::iterator II = sucBB->begin(),
                                IEnd = sucBB->end();
           II != IEnd; ++II)
      {
        Instruction *inst = &*II;

        // Ignore this IR if it is out of the scope.
        if (shouldIgnore(inst))
          continue;

        if (isLiveInInst(sucBB, inst))
        {
          errs() << " check inst: " << *inst << "\n";

          DFGNode *dfgNode;
          if (hasNode(inst))
          {
            dfgNode = getNode(inst);
          }
          else
          {
            dfgNode = new DFGNode(nodeID++, m_precisionAware, inst, getValueName(inst));
            nodes.push_back(dfgNode);
          }
          //      Instruction* first = &*(sucBB->begin());
          //      if (!getNode(inst)->isPhi()) {
          //
          //        cout<<"!!!!!!! [avoid as a phi] construct ctrl flow: "<<*terminator<<"->"<<*inst<<"\n";
          //        continue;
          //      }

          errs() << "!!!!!!! construct ctrl flow: " << *terminator << "->" << *inst << "\n";

          // Construct contrl flow edges.
          DFGEdge *ctrlEdge;
          if (hasCtrlEdge(getNode(terminator), dfgNode))
          {
            ctrlEdge = getCtrlEdge(getNode(terminator), dfgNode);
          }
          else
          {
            ctrlEdge = new DFGEdge(ctrlEdgeID++, getNode(terminator), dfgNode, true);
            m_ctrlEdges.push_back(ctrlEdge);
          }
        }
      }
    }
  }

  //      Instruction* inst = &(sucBB->front());
  ////    for (Instruction* inst: sucBB) {
  //      // Ignore this IR if it is out of the scope.
  //      if (shouldIgnore(inst))
  //        continue;
  //      DFGNode* dfgNode;
  //      if (hasNode(inst)) {
  //        dfgNode = getNode(inst);
  //      } else {
  //        dfgNode = new DFGNode(nodeID++, inst, getValueName(inst));
  //        nodes.push_back(dfgNode);
  //      }
  ////      Instruction* first = &*(sucBB->begin());
  ////      if (!getNode(inst)->isPhi()) {
  ////
  ////        cout<<"!!!!!!! [avoid as a phi] construct ctrl flow: "<<*terminator<<"->"<<*inst<<"\n";
  ////        continue;
  ////      }
  //
  //      cout<<"!!!!!!! construct ctrl flow: "<<*terminator<<"->"<<*inst<<"\n";
  //
  //      // Construct contrl flow edges.
  //      DFGEdge* ctrlEdge;
  //      if (hasCtrlEdge(getNode(terminator), dfgNode)) {
  //        ctrlEdge = getCtrlEdge(getNode(terminator), dfgNode);
  //      }
  //      else {
  //        ctrlEdge = new DFGEdge(ctrlEdgeID++, getNode(terminator), dfgNode);
  //        m_ctrlEdges.push_back(ctrlEdge);
  //      }
  //    }
  //  }

  //      for (BasicBlock::iterator II=sucBB->begin(),
  //          IEnd=sucBB->end(); II!=IEnd; ++II) {
  //        Instruction* inst = &*II;
  ////      for (Instruction* inst: sucBB) {
  //        // Ignore this IR if it is out of the scope.
  //        if (shouldIgnore(inst))
  //          continue;
  //        DFGNode* dfgNode;
  //        if (hasNode(inst)) {
  //          dfgNode = getNode(inst);
  //        } else {
  //          dfgNode = new DFGNode(nodeID++, inst, getValueName(inst));
  //          nodes.push_back(dfgNode);
  //        }
  ////        Instruction* first = &*(sucBB->begin());
  //        if (!getNode(inst)->isPhi()) {
  //
  //          cout<<"!!!!!!! [avoid as a phi] construct ctrl flow: "<<*terminator<<"->"<<*inst<<"\n";
  //          continue;
  //        }
  //
  //        cout<<"!!!!!!! construct ctrl flow: "<<*terminator<<"->"<<*inst<<"\n";
  //
  //        // Construct contrl flow edges.
  //        DFGEdge* ctrlEdge;
  //        if (hasCtrlEdge(getNode(terminator), dfgNode)) {
  //          ctrlEdge = getCtrlEdge(getNode(terminator), dfgNode);
  //        }
  //        else {
  //          ctrlEdge = new DFGEdge(ctrlEdgeID++, getNode(terminator), dfgNode);
  //          m_ctrlEdges.push_back(ctrlEdge);
  //        }
  //      }
  //    }
  //  }

  //  // Construct contrl flow forward edges.
  //  for (list<DFGNode*>::iterator nodeItr=nodes.begin();
  //      nodeItr!=nodes.end(); ++nodeItr) {
  //    list<DFGNode*>::iterator next = nodeItr;
  //    ++next;
  //    if (next != nodes.end()) {
  //      DFGEdge* ctrlEdge;
  //      if (hasCtrlEdge(*nodeItr, *next))
  //        ctrlEdge = getCtrlEdge(*nodeItr, *next);
  //      else {
  //        ctrlEdge = new DFGEdge(ctrlEdgeID++, *nodeItr, *next);
  //        m_ctrlEdges.push_back(ctrlEdge);
  //      }
  //    }
  //  }

  // Construct data flow edges.
  for (DFGNode *node : nodes)
  {
    //    nodes.push_back(Node(curII, getValueName(curII)));
    Instruction *curII = node->getInst();
    assert(node == getNode(curII));
    switch (curII->getOpcode())
    {
    // The load/store instruction is special
    case llvm::Instruction::Load:
    {
      LoadInst *linst = dyn_cast<LoadInst>(curII);
      Value *loadValPtr = linst->getPointerOperand();

      // Parameter of the loop or the basic block, invisible in DFG.
      if (!hasNode(loadValPtr))
        break;
      DFGEdge *dfgEdge;
      if (hasDFGEdge(getNode(loadValPtr), node))
        dfgEdge = getDFGEdge(getNode(loadValPtr), node);
      else
      {
        dfgEdge = new DFGEdge(dfgEdgeID++, getNode(loadValPtr), node);
        m_DFGEdges.push_back(dfgEdge);
      }
      //        getNode(loadValPtr)->setOutEdge(dfgEdge);
      //        (*nodeItr)->setInEdge(dfgEdge);
      break;
    }
    case llvm::Instruction::Store:
    {
      StoreInst *sinst = dyn_cast<StoreInst>(curII);
      Value *storeValPtr = sinst->getPointerOperand();
      Value *storeVal = sinst->getValueOperand();
      DFGEdge *dfgEdge1;
      DFGEdge *dfgEdge2;

      // TODO: need to figure out storeVal and storeValPtr
      if (hasNode(storeVal))
      {
        if (hasDFGEdge(getNode(storeVal), node))
          dfgEdge1 = getDFGEdge(getNode(storeVal), node);
        else
        {
          dfgEdge1 = new DFGEdge(dfgEdgeID++, getNode(storeVal), node);
          m_DFGEdges.push_back(dfgEdge1);
        }
        //          getNode(storeVal)->setOutEdge(dfgEdge1);
        //          (*nodeItr)->setInEdge(dfgEdge1);
      }
      if (hasNode(storeValPtr))
      {
        //          if (hasDFGEdge(*nodeItr, getNode(storeValPtr)))
        if (hasDFGEdge(getNode(storeValPtr), node))
          //            dfgEdge2 = getDFGEdge(*nodeItr, getNode(storeValPtr));
          dfgEdge2 = getDFGEdge(getNode(storeValPtr), node);
        else
        {
          //            dfgEdge2 = new DFGEdge(dfgEdgeID++, *nodeItr, getNode(storeValPtr));
          dfgEdge2 = new DFGEdge(dfgEdgeID++, getNode(storeValPtr), node);
          m_DFGEdges.push_back(dfgEdge2);
        }
        //          getNode(storeValPtr)->setOutEdge(dfgEdge2);
        //          (*nodeItr)->setInEdge(dfgEdge2);
        //          (*nodeItr)->setOutEdge(dfgEdge2);
        //          getNode(storeValPtr)->setInEdge(dfgEdge2);
      }
      break;
    }
    default:
    {
      for (Instruction::op_iterator op = curII->op_begin(), opEnd = curII->op_end(); op != opEnd; ++op)
      {
        Instruction *tempInst = dyn_cast<Instruction>(*op);
        if (tempInst and !shouldIgnore(tempInst))
        {
          //            if(node->isBranch()) {
          //              cout<<"  the real branch's pred: "<<*tempInst<<"\n";
          //              int numSuccs = tempInst->getNumSuccessors();
          //            }
          DFGEdge *dfgEdge;
          if (hasNode(tempInst))
          {
            if (hasDFGEdge(getNode(tempInst), node))
              dfgEdge = getDFGEdge(getNode(tempInst), node);
            else
            {
              dfgEdge = new DFGEdge(dfgEdgeID++, getNode(tempInst), node);
              m_DFGEdges.push_back(dfgEdge);
            }
            //              getNode(tempInst)->setOutEdge(dfgEdge);
            //              (*nodeItr)->setInEdge(dfgEdge);
          }
        }
        else
        {
          // Original Branch node will take three
          // predecessors (i.e., condi, true, false).
          if (!node->isBranch())
            node->addConst();
        }
      }
      //        if(node->isBranch()) {
      //          int numSuccs = curII->getNumSuccessors();
      //          cout<<"the succ of the branch: "<<*curII<<"; ("<<numSuccs<<")\n";
      //          for(int i=0; i<numSuccs; ++i) {
      //            BasicBlock* bb
      //          }
      //        }
      break;
    }
    }
  }
  connectDFGNodes();

  calculateCycles();

  // The mapping algorithm works on the DFG that is ordered in ASAP.
  // reorderInASAP();
  // The mapping algorithm works on the DFG that is ordered in ALAP.
  // reorderInALAP();
  // The mapping algorithm works on the DFG that is ordered along with the longest path.
  reorderInLongest();
}

// Reorder the DFG nodes in ASAP based on original sequential execution order.
void DFG::reorderInASAP()
{

  list<DFGNode *> tempNodes;
  // The first node in the nodes is treated as the starting point (no
  // matter it has predecessors or not).
  int maxLevel = 0;
  for (DFGNode *node : nodes)
  {
    int level = 0;
    for (DFGNode *predNode : *(node->getPredNodes()))
    {
      if (predNode->getID() < node->getID())
      {
        if (level < predNode->getLevel() + 1)
        {
          level = predNode->getLevel() + 1;
        }
      }
    }
    node->setLevel(level);
    if (maxLevel < level)
    {
      maxLevel = level;
    }
  }

  for (int l = 0; l < maxLevel + 1; ++l)
  {
    for (DFGNode *node : nodes)
    {
      if (node->getLevel() == l)
      {
        tempNodes.push_back(node);
      }
    }
  }

  nodes.clear();
  cout << "[reorder DFG in ASAP]\n";
  for (DFGNode *node : tempNodes)
  {
    nodes.push_back(node);
    errs() << "(" << node->getID() << ") " << *(node->getInst()) << ", level: " << node->getLevel() << "\n";
  }
}

bool DFG::isMinimumAndHasNotBeenVisited(set<DFGNode *> *t_visited, map<DFGNode *, int> *t_map, DFGNode *t_node)
{
  if (t_visited->find(t_node) != t_visited->end())
  {
    return false;
  }
  for (DFGNode *e_node : nodes)
  {
    if (e_node != t_node and t_visited->find(e_node) == t_visited->end() and (*t_map)[e_node] < (*t_map)[t_node])
    {
      return false;
    }
  }
  return true;
}

// Reorder the DFG nodes based on the longest path.
void DFG::reorderInLongest()
{
  list<DFGNode *> *longestPath = new list<DFGNode *>();
  list<DFGNode *> *currentPath = new list<DFGNode *>();
  set<DFGNode *> *visited = new set<DFGNode *>();
  map<DFGNode *, int> indegree;
  for (DFGNode *node : nodes)
  {
    indegree[node] = node->getPredNodes()->size();
    currentPath->clear();
    visited->clear();
    reorderDFS(visited, longestPath, currentPath, node);
  }

  visited->clear();
  int level = 0;
  for (DFGNode *node : *longestPath)
  {
    node->setLevel(level);
    visited->insert(node);
    // cout<<"check longest path node: "<<node->getID()<<endl;
    for (DFGNode *succNode : *(node->getSuccNodes()))
    {
      indegree[succNode] -= 1;
    }
    level += 1;
  }
  int maxLevel = level;

  while (visited->size() < nodes.size())
  {
    for (DFGNode *node : nodes)
    {
      // if (visited->find(node) == visited->end() and indegree[node] <= 0) {
      if (isMinimumAndHasNotBeenVisited(visited, &indegree, node))
      {
        level = 0;
        for (DFGNode *preNode : *(node->getPredNodes()))
        {
          if (level < preNode->getLevel() + 1)
          {
            level = preNode->getLevel() + 1;
          }
        }
        node->setLevel(level);
        visited->insert(node);
        for (DFGNode *succNode : *(node->getSuccNodes()))
        {
          indegree[succNode] -= 1;
        }
      }
    }
  }

  list<DFGNode *> tempNodes;
  for (int l = 0; l < maxLevel + 1; ++l)
  {
    for (DFGNode *node : nodes)
    {
      if (node->getLevel() == l)
      {
        tempNodes.push_back(node);
      }
    }
  }

  nodes.clear();
  cout << "[reorder DFG along with the longest path]\n";
  for (DFGNode *node : tempNodes)
  {
    nodes.push_back(node);
    errs() << "(" << node->getID() << ") " << *(node->getValue()) << ", level: " << node->getLevel() << "\n";
  }
}

void DFG::reorderDFS(set<DFGNode *> *t_visited, list<DFGNode *> *t_targetPath,
                     list<DFGNode *> *t_curPath, DFGNode *targetDFGNode)
{

  t_visited->insert(targetDFGNode);
  t_curPath->push_back(targetDFGNode);

  // Update target longest path if current one is longer.
  if (t_curPath->size() > t_targetPath->size())
  {
    t_targetPath->clear();
    for (DFGNode *node : *t_curPath)
    {
      t_targetPath->push_back(node);
    }
  }

  for (DFGNode *succNode : *(targetDFGNode->getSuccNodes()))
  {
    if (t_visited->find(succNode) == t_visited->end())
    { // not visited yet
      reorderDFS(t_visited, t_targetPath, t_curPath, succNode);
      t_visited->erase(succNode);
      t_curPath->pop_back();
    }
  }
}

// Reorder the DFG nodes in ALAP based on original sequential execution order.
void DFG::reorderInALAP()
{

  list<DFGNode *> tempNodes;
  // The last node in the nodes is treated as the end point (no
  // matter it has successors or not).
  int maxLevel = 0;
  nodes.reverse();
  for (DFGNode *node : nodes)
  {
    int level = 0;
    for (DFGNode *succNode : *(node->getSuccNodes()))
    {
      if (succNode->getID() > node->getID())
      {
        if (level < succNode->getLevel() + 1)
        {
          level = succNode->getLevel() + 1;
        }
      }
    }
    node->setLevel(level);
    if (maxLevel < level)
    {
      maxLevel = level;
    }
  }

  for (DFGNode *node : nodes)
  {
    node->setLevel(maxLevel - node->getLevel());
  }

  for (int l = 0; l < maxLevel + 1; ++l)
  {
    for (DFGNode *node : nodes)
    {
      if (node->getLevel() == l)
      {
        tempNodes.push_back(node);
      }
    }
  }

  nodes.clear();
  cout << "[reorder DFG in ALAP]\n";
  for (DFGNode *node : tempNodes)
  {
    nodes.push_back(node);
    errs() << "(" << node->getID() << ") " << *(node->getInst()) << ", level: " << node->getLevel() << "\n";
  }
}

void DFG::initExecLatency(map<string, int> *t_execLatency)
{
  set<string> targetOpt;
  for (map<string, int>::iterator iter = t_execLatency->begin();
       iter != t_execLatency->end(); ++iter)
  {
    targetOpt.insert(iter->first);
  }
  for (DFGNode *node : nodes)
  {
    if (t_execLatency->find(node->getOpcodeName()) != t_execLatency->end())
    {
      string opcodeName = node->getOpcodeName();
      node->setExecLatency((*t_execLatency)[opcodeName]);
      targetOpt.erase(opcodeName);
    }
  }
  if (!targetOpt.empty())
  {
    cout << "\033[0;31mPlease check the operations targeting multi-cycle execution in <param.json>:\"\033[0m";
    for (set<string>::iterator it = targetOpt.begin(); it != targetOpt.end(); ++it)
    {
      cout << " " << *it << " "; // Note the "*" here
    }
    cout << "\033[0;31m\".\033[0m" << endl;
  }
}

void DFG::initPipelinedOpt(list<string> *t_pipelinedOpt)
{
  set<string> targetOpt;
  for (string opt : *t_pipelinedOpt)
  {
    targetOpt.insert(opt);
  }
  for (DFGNode *node : nodes)
  {
    list<string>::iterator it;
    it = find(t_pipelinedOpt->begin(), t_pipelinedOpt->end(), node->getOpcodeName());
    if (it != t_pipelinedOpt->end())
    {
      string opcodeName = node->getOpcodeName();
      node->setPipelinable();
      targetOpt.erase(opcodeName);
    }
  }
  if (!targetOpt.empty())
  {
    cout << "\033[0;31mPlease check the pipelinable operations in <param.json>:\"\033[0m";
    for (set<string>::iterator it = targetOpt.begin(); it != targetOpt.end(); ++it)
    {
      cout << " " << *it << " "; // Note the "*" here
    }
    cout << "\033[0;31m\".\033[0m" << endl;
  }
}

bool DFG::isLiveInInst(BasicBlock *t_bb, Instruction *t_inst)
{
  if (t_inst == &(t_bb->front()))
  {
    errs() << "ctrl to: " << *t_inst << "; front: " << (t_bb->front()) << ";\n";
    return true;
  }

  for (Instruction::op_iterator op = t_inst->op_begin(), opEnd = t_inst->op_end(); op != opEnd; ++op)
  {
    Instruction *tempInst = dyn_cast<Instruction>(*op);
    if (tempInst and !containsInst(t_bb, tempInst))
    {
      errs() << "tempInst: " << *tempInst << ";\n ";
      errs() << "ctrl to: " << *t_inst << "; containsInst(t_bb, tempInst): " << containsInst(t_bb, tempInst) << "; \n";
      return true;
    }
  }

  // The first (lower ID) IR with only in-block dependency is also treated as live-in.
  for (Instruction::op_iterator op = t_inst->op_begin(), opEnd = t_inst->op_end(); op != opEnd; ++op)
  {
    Instruction *tempInst = dyn_cast<Instruction>(*op);
    if (tempInst and getInstID(t_bb, t_inst) > getInstID(t_bb, tempInst))
    {
      return false;
    }
  }

  errs() << "ctrl to: " << *t_inst << "; \n";
  return true;
}

bool DFG::isLiveInBasicBlock(BasicBlock *BB, Instruction *t_inst)
{
  if (PHINode *phiInst = dyn_cast<PHINode>(t_inst))
  {
    errs() << "PHIInst: " << *phiInst << "\n";
    for (unsigned i = 0; i < phiInst->getNumIncomingValues(); ++i)
    {
      if (phiInst->getIncomingBlock(i) != BB)
      {
        errs() << "Out Block: " << phiInst->getIncomingBlock(i)->getName() << "\n";
        return true;
      }
    }
  }
  else if (BranchInst *branchInst = dyn_cast<BranchInst>(t_inst))
  {
    errs() << "BranchInst: " << *branchInst << "\n";
    for (unsigned i = 0; i < branchInst->getNumSuccessors(); ++i)
    {
      if (branchInst->getSuccessor(i) != BB)
      {
        errs() << "Out Block: " << branchInst->getSuccessor(i)->getName() << "\n";
        return true;
      }
    }
  }
  else
  {
    for (unsigned i = 0; i < t_inst->getNumOperands(); i++)
    {
      Instruction *operand = dyn_cast<Instruction>(t_inst->getOperand(i));
      if (operand and operand->getParent() != BB)
      {
        errs() << "Out Block: " << operand->getParent()->getName() << "\n";
        return true;
      }
    }
  }
  return false;
}

Instruction *DFG::getInstNotInBasicBlock(BasicBlock *BB, Instruction *t_inst)
{
  if (PHINode *phiInst = dyn_cast<PHINode>(t_inst))
  {
    for (unsigned i = 0; i < phiInst->getNumIncomingValues(); ++i)
    {
      if (phiInst->getIncomingBlock(i) != BB && dyn_cast<Instruction>(phiInst->getIncomingBlock(i)->getTerminator()))
      {
        return (dyn_cast<Instruction>(phiInst->getIncomingBlock(i)->getTerminator()));
      }
    }
  }
  else if (BranchInst *branchInst = dyn_cast<BranchInst>(t_inst))
  {
    for (unsigned i = 0; i < branchInst->getNumSuccessors(); ++i)
    {
      if (branchInst->getSuccessor(i) != BB && dyn_cast<Instruction>(branchInst->getSuccessor(i)->begin()))
      {
        return (dyn_cast<Instruction>(branchInst->getSuccessor(i)->begin()));
      }
    }
  }
  else
  {
    for (unsigned i = 0; i < t_inst->getNumOperands(); i++)
    {
      Instruction *operand = dyn_cast<Instruction>(t_inst->getOperand(i));
      if (operand and operand->getParent() != BB)
      {
        return operand;
      }
    }
  }
  return nullptr;
}

bool DFG::containsInst(BasicBlock *t_bb, Instruction *t_inst)
{

  for (BasicBlock::iterator II = t_bb->begin(),
                            IEnd = t_bb->end();
       II != IEnd; ++II)
  {
    Instruction *inst = &*II;
    if ((inst) == (t_inst))
    {
      return true;
    }
  }
  return false;
}

int DFG::getInstID(BasicBlock *t_bb, Instruction *t_inst)
{

  int id = 0;
  for (BasicBlock::iterator II = t_bb->begin(),
                            IEnd = t_bb->end();
       II != IEnd; ++II)
  {
    Instruction *inst = &*II;
    if ((inst) == (t_inst))
    {
      return id;
    }
    id += 1;
  }
  // This never gonna happen.
  assert(false);
  return -1;
}

void DFG::connectDFGNodes()
{
  for (DFGNode *node : nodes)
  {
    node->cutEdges();
  }

  // Incorporate ctrl flow into data flow.
  if (!this->m_CDFGFused)
  {
    for (DFGEdge *edge : this->m_ctrlEdges)
    {
      this->m_DFGEdges.push_back(edge);
    }
    this->m_CDFGFused = true;
  }
  errs() << "==================================\n";
  for (DFGEdge *edge : this->m_DFGEdges)
  {
    errs() << "DFG Data Flow Edge: " << edge->getID() << " " << edge->getSrc()->getID() << " -> " << edge->getDst()->getID() << "\n";
    DFGNode *left = edge->getSrc();
    DFGNode *right = edge->getDst();
    left->setOutEdge(edge);
    right->setInEdge(edge);
  }

  //  for (DFGEdge* edge: m_ctrlEdges) {
  //    DFGNode* left = edge->getSrc();
  //    DFGNode* right = edge->getDst();
  ////    cout<<"... connectDFGNodes() for inst (left): "<<*(left->getInst())<<", (right): "<<*(right->getInst())<<"\n";
  //    left->setOutEdge(edge);
  //    right->setInEdge(edge);
  //  }
}

void DFG::generateJSON()
{
  ofstream jsonFile;
  jsonFile.open("dfg.json");
  jsonFile << "[\n";
  int node_index = 0;
  int node_size = nodes.size();
  for (DFGNode *node : nodes)
  {
    jsonFile << "  {\n";
    jsonFile << "    \"fu\"         : \"" << node->getFuType() << "\",\n";
    jsonFile << "    \"id\"         : " << node->getID() << ",\n";
    jsonFile << "    \"org_opt\"    : \"" << node->getOpcodeName() << "\",\n";
    jsonFile << "    \"JSON_opt\"   : \"" << node->getJSONOpt() << "\",\n";
    jsonFile << "    \"in_const\"   : [";
    int const_size = node->getNumConst();
    for (int const_index = 0; const_index < const_size; ++const_index)
    {
      jsonFile << const_index;
      if (const_index < const_size - 1)
        jsonFile << ",";
    }
    jsonFile << "],\n";
    jsonFile << "    \"pre\"         : [";
    int in_size = node->getPredNodes()->size();
    int in_index = 0;
    for (DFGNode *predNode : *(node->getPredNodes()))
    {
      jsonFile << predNode->getID();
      in_index += 1;
      if (in_index < in_size)
        jsonFile << ",";
    }
    jsonFile << "],\n";
    jsonFile << "    \"succ\"       : [[";
    int out_size = node->getSuccNodes()->size();
    int out_index = 0;
    for (DFGNode *succNode : *(node->getSuccNodes()))
    {
      jsonFile << succNode->getID();
      out_index += 1;
      if (out_index < out_size)
        jsonFile << ",";
    }
    jsonFile << "]]\n";
    node_index += 1;
    if (node_index < node_size)
      jsonFile << "  },\n";
    else
      jsonFile << "  }\n";
  }
  jsonFile << "]\n";
}

void DFG::generateDot(Function &t_F, bool t_isTrimmedDemo, bool t_supportMemory)
{

  error_code error;
  //  sys::fs::OpenFlags F_Excl;
  string func_name = t_F.getName().str();
  string file_name = func_name + ".dot";
  StringRef fileName(file_name);
  raw_fd_ostream file(fileName, error, sys::fs::F_None);

  file << "digraph \"DFG for'" + t_F.getName() + "\' function\" {\n";

  if (t_supportMemory)
  {
    errs() << "DataNodes Size: " << this->dataNodes.size() << "\n";
    for (DataNode *dataNode : this->dataNodes)
    {
      if (t_isTrimmedDemo)
      {
        if (dataNode->getParentNode()->getInst()->getOpcode() == Instruction::Load)
        {
          DFGEdge *dataEdge;
          file << "\tNode" << dataNode->getID() << dataNode->getOpcodeName() << "[shape=record, color=lightblue, style=filled, label=\"" << "(" << dataNode->getID() << ") " << dataNode->getOpcodeName() << "\"];\n";
          dataEdge = new DFGEdge(0, dataNode, dataNode->getParentNode());
          file << "edge [color=red]" << "\n";
          file << "\tNode" << dataEdge->getSrc()->getID() << dataEdge->getSrc()->getOpcodeName() << " -> Node" << dataEdge->getDst()->getID() << dataEdge->getDst()->getOpcodeName() << "\n";
        }
        else if (dataNode->getParentNode()->getInst()->getOpcode() == Instruction::Store)
        {
          DFGEdge *dataEdge;
          file << "\tNode" << dataNode->getID() << dataNode->getOpcodeName() << "[shape=record, color=lightblue, style=filled, label=\"" << "(" << dataNode->getID() << ") " << dataNode->getOpcodeName() << "\"];\n";
          dataEdge = new DFGEdge(0, dataNode->getParentNode(), dataNode);
          file << "edge [color=red]" << "\n";
          file << "\tNode" << dataEdge->getSrc()->getID() << dataEdge->getSrc()->getOpcodeName() << " -> Node" << dataEdge->getDst()->getID() << dataEdge->getDst()->getOpcodeName() << "\n";
        }
      }
      else
      {
        if (dataNode->getParentNode()->getInst()->getOpcode() == Instruction::Load)
        {
          DFGEdge *dataEdge;
          file << "\tNode" << dataNode->getValue() << "[shape=record, color=lightblue, style=filled, label=\"" << changeVal2Str(dataNode->getValue()) << "\"];\n";
          dataEdge = new DFGEdge(0, dataNode, dataNode->getParentNode());
          file << "edge [color=red]" << "\n";
          file << "\tNode" << dataEdge->getSrc()->getValue() << " -> Node" << dataEdge->getDst()->getValue() << "\n";
        }
        else if (dataNode->getParentNode()->getInst()->getOpcode() == Instruction::Store)
        {
          DFGEdge *dataEdge;
          file << "\tNode" << dataNode->getID() << dataNode->getOpcodeName() << "[shape=record, color=lightblue, style=filled, label=\"" << "(" << dataNode->getID() << ") " << dataNode->getOpcodeName() << "\"];\n";
          dataEdge = new DFGEdge(0, dataNode->getParentNode(), dataNode);
          file << "edge [color=red]" << "\n";
          file << "\tNode" << dataEdge->getSrc()->getValue() << " -> Node" << dataEdge->getDst()->getValue() << "\n";
        }
      }
    }
  }

  // Dump DFG nodes.
  for (DFGNode *node : this->nodes)
  {
    //    if (dyn_cast<Instruction>((*node)->getInst())) {
    if (t_isTrimmedDemo)
    {
      if (node->getOpcodeName() == "load" || node->getOpcodeName() == "store")
      {
        file << "\tNode" << node->getID() << node->getOpcodeName() << "[shape=oval, color=darkorange, style=filled, label=\"" << "(" << node->getID() << ") " << node->getOpcodeName() << "\"];\n";
      }
      else
      {
        file << "\tNode" << node->getID() << node->getOpcodeName() << "[shape=record, label=\"" << "(" << node->getID() << ") " << node->getOpcodeName() << "\"];\n";
      }
    }
    else
    {
      if (node->getOpcodeName() == "load" || node->getOpcodeName() == "store")
      {
        file << "\tNode" << node->getInst() << "[shape=oval, color=darkorange, style=filled, label=\"" << changeVal2Str(node->getInst()) << "\"];\n";
      }
      else if (node->getOpcodeName() == "datamem")
      {
        file << "\tNode" << node->getValue() << "[shape=record, color=lightblue, style=filled, label=\"" << changeVal2Str(node->getValue()) << "\"];\n";
      }
      else
      {
        file << "\tNode" << node->getValue() << "[shape=record, label=\"" << changeVal2Str(node->getValue()) << "\"];\n";
      }
    }
  }
  /*
    if(dyn_cast<Instruction>(node->first))
      file << "\tNode" << node->first << "[shape=record, label=\"" << *(node->first) << "\"];\n";
      file << "\tNode" << (*node)->getInst() << "[shape=record, label=\"" << ((*node)->getID()) << "\"];\n";
    else {
      file << "\tNode" << (*node)->getInst() << "[shape=record, label=\"" << (*node)->getStringRef() << "\"];\n";
    }
            file << "\tNode" << node->first << "[shape=record, label=\"" << node->second << "\"];\n";
  */

  // Dump control flow.
  file << "edge [color=blue]" << "\n";
  for (DFGEdge *edge : m_ctrlEdges)
  {
    // Distinguish data and control flows. Don't show the ctrl flows that are optimzied out from the data flow optimization.
    if (find(m_DFGEdges.begin(), m_DFGEdges.end(), edge) != m_DFGEdges.end())
    {
      if (t_isTrimmedDemo)
      {
        file << "\tNode" << edge->getSrc()->getID() << edge->getSrc()->getOpcodeName() << " -> Node" << edge->getDst()->getID() << edge->getDst()->getOpcodeName() << "\n";
      }
      else
      {
        file << "\tNode" << edge->getSrc()->getValue() << " -> Node" << edge->getDst()->getValue() << "\n";
      }
    }
  }

  // Dump data flow.
  file << "edge [color=red]" << "\n";
  for (DFGEdge *edge : m_DFGEdges)
  {
    // Distinguish data and control flows. Make ctrl flow invisible.
    if (find(m_ctrlEdges.begin(), m_ctrlEdges.end(), edge) == m_ctrlEdges.end())
    {
      if (t_isTrimmedDemo)
      {
        file << "\tNode" << edge->getSrc()->getID() << edge->getSrc()->getOpcodeName() << " -> Node" << edge->getDst()->getID() << edge->getDst()->getOpcodeName() << "\n";
      }
      else
      {
        file << "\tNode" << edge->getSrc()->getValue() << " -> Node" << edge->getDst()->getValue() << "\n";
      }
    }
  }
  //  cout << "Write data flow done.\n";
  file << "}\n";
  file.close();
}

void DFG::DFS_on_DFG(DFGNode *t_head, DFGNode *t_current,
                     list<DFGNode *> *t_visitedNodes, list<DFGEdge *> *t_erasedEdges,
                     list<DFGEdge *> *t_currentCycle, list<list<DFGEdge *> *> *t_cycles)
{
  for (DFGEdge *edge : m_DFGEdges)
  {
    if (find(t_erasedEdges->begin(), t_erasedEdges->end(), edge) != t_erasedEdges->end())
      continue;
    // check whether the IR is equal
    if (edge->getSrc() == t_current)
    {
      // skip the visited nodes/edges:
      if (find(t_currentCycle->begin(), t_currentCycle->end(), edge) != t_currentCycle->end())
      {
        continue;
      }
      t_currentCycle->push_back(edge);

      //      cout << ".. add current cycle edge: {" << *edge->getSrc()->getInst() << "  } -> {"<< *edge->getDst()->getInst() << "  } ("<<edge->getSrc()->getID()<<" -> "<<edge->getDst()->getID()<<")\n";
      if (edge->getDst() == t_head)
      {
        cout << "==================================\n";
        errs() << "[detected one cycle] head: " << *(t_head->getInst()) << "\n";
        list<DFGEdge *> *temp_cycle = new list<DFGEdge *>();
        for (DFGEdge *currentEdge : *t_currentCycle)
        {
          temp_cycle->push_back(currentEdge);
          // break the cycle to avoid future repeated detection
          errs() << "cycle edge: {" << *(currentEdge)->getSrc()->getInst() << "  } -> {" << *(currentEdge)->getDst()->getInst() << "  } (" << currentEdge->getSrc()->getID() << " -> " << currentEdge->getDst()->getID() << ")\n";
        }
        t_erasedEdges->push_back(edge);
        t_cycles->push_back(temp_cycle);
        t_currentCycle->remove(edge);
      }
      else
      {
        if (find(t_visitedNodes->begin(), t_visitedNodes->end(), edge->getDst()) == t_visitedNodes->end())
        {
          t_visitedNodes->push_back(edge->getDst());
          // Only continue when the path size is less than the node count.
          if (t_currentCycle->size() <= nodes.size())
          {
            DFS_on_DFG(t_head, edge->getDst(), t_visitedNodes, t_erasedEdges, t_currentCycle, t_cycles);
          }
        }
        else
        {
          t_currentCycle->remove(edge);
        }
      }
    }
  }
  if (t_currentCycle->size() != 0)
  {
    t_currentCycle->pop_back();
  }
}

list<list<DFGEdge *> *> *DFG::calculateCycles()
{
  list<list<DFGEdge *> *> *cycleLists = new list<list<DFGEdge *> *>();
  list<DFGEdge *> *currentCycle = new list<DFGEdge *>();
  list<DFGNode *> *visitedNodes = new list<DFGNode *>();
  list<DFGEdge *> *erasedEdges = new list<DFGEdge *>();
  cycleLists->clear();
  for (DFGNode *node : nodes)
  {
    currentCycle->clear();
    visitedNodes->clear();
    visitedNodes->push_back(node);
    DFS_on_DFG(node, node, visitedNodes, erasedEdges, currentCycle, cycleLists);
  }
  int cycleID = 0;
  m_cycleNodeLists->clear();
  for (list<DFGEdge *> *cycle : *cycleLists)
  {
    list<DFGNode *> *nodeCycle = new list<DFGNode *>();
    for (DFGEdge *edge : *cycle)
    {
      edge->getDst()->setCritical();
      edge->getDst()->addCycleID(cycleID);
      nodeCycle->push_back(edge->getDst());
    }
    m_cycleNodeLists->push_back(nodeCycle);
    cycleID += 1;
  }
  return cycleLists;
}

list<list<DFGNode *> *> *DFG::getCycleLists()
{
  return m_cycleNodeLists;
}

void DFG::showOpcodeDistribution()
{

  map<string, int> opcodeMap;
  for (DFGNode *node : nodes)
  {
    opcodeMap[node->getOpcodeName()] += 1;
  }
  for (map<string, int>::iterator opcodeItr = opcodeMap.begin();
       opcodeItr != opcodeMap.end(); ++opcodeItr)
  {
    cout << (*opcodeItr).first << " : " << (*opcodeItr).second << "\n";
  }
  int simdNodeCount = 0;
  for (DFGNode *node : nodes)
  {
    if (node->isVectorized())
    {
      simdNodeCount++;
    }
  }
  cout << "DFG node count: " << nodes.size() << "; DFG edge count: " << m_DFGEdges.size() << "; SIMD node count: " << simdNodeCount << "\n";
}

int DFG::getID(DFGNode *t_node)
{
  int index = 0;
  return t_node->getID();
}

DFGNode *DFG::getNode(Value *t_value)
{
  for (DFGNode *node : nodes)
  {
    if (node->getInst() == t_value)
    {
      return node;
    }
  }
  assert("ERROR cannot find the corresponding DFG node.");
  return NULL;
}

bool DFG::hasNode(Value *t_value)
{
  for (DFGNode *node : this->nodes)
  {
    if (node->getValue() == t_value)
    {
      return true;
    }
  }
  return false;
}

DFGEdge *DFG::getCtrlEdge(DFGNode *t_src, DFGNode *t_dst)
{
  for (DFGEdge *edge : m_ctrlEdges)
  {
    if (edge->getSrc() == t_src and
        edge->getDst() == t_dst)
    {
      return edge;
    }
  }
  assert("ERROR cannot find the corresponding Ctrl edge.");
  return NULL;
}

bool DFG::hasCtrlEdge(DFGNode *t_src, DFGNode *t_dst)
{
  for (DFGEdge *edge : this->m_ctrlEdges)
  {
    if (edge->getSrc() == t_src and
        edge->getDst() == t_dst)
    {
      return true;
    }
  }
  return false;
}

DFGEdge *DFG::getDFGEdge(DFGNode *t_src, DFGNode *t_dst)
{
  for (DFGEdge *edge : m_DFGEdges)
  {
    if (edge->getSrc() == t_src and
        edge->getDst() == t_dst)
    {
      return edge;
    }
  }
  assert("ERROR cannot find the corresponding DFG edge.");
  return NULL;
}

void DFG::replaceDFGEdge(DFGNode *t_old_src, DFGNode *t_old_dst,
                         DFGNode *t_new_src, DFGNode *t_new_dst)
{
  DFGEdge *target = NULL;
  cout << "replace edge: [delete] " << t_old_src->getID() << "->" << t_old_dst->getID() << " [new] " << t_new_src->getID() << "->" << t_new_dst->getID() << "\n";
  for (DFGEdge *edge : m_DFGEdges)
  {
    if (edge->getSrc() == t_old_src and
        edge->getDst() == t_old_dst)
    {
      target = edge;
      break;
    }
  }
  if (target == NULL)
    assert("ERROR cannot find the corresponding DFG edge.");
  m_DFGEdges.remove(target);
  // Keeps the ctrl property of the original edge on the newly added edge.
  DFGEdge *newEdge = new DFGEdge(target->getID(), t_new_src, t_new_dst, target->isCtrlEdge());
  m_DFGEdges.push_back(newEdge);
  if (newEdge->isCtrlEdge())
  {
    m_ctrlEdges.push_back(newEdge);
  }
}

void DFG::deleteDFGEdge(DFGNode *t_src, DFGNode *t_dst)
{
  if (!hasDFGEdge(t_src, t_dst))
    return;
  m_DFGEdges.remove(getDFGEdge(t_src, t_dst));
}

bool DFG::hasDFGEdge(DFGNode *t_src, DFGNode *t_dst)
{
  for (DFGEdge *edge : m_DFGEdges)
  {
    if (edge->getSrc() == t_src and
        edge->getDst() == t_dst)
    {
      return true;
    }
  }
  return false;
}

string DFG::changeVal2Str(Value *t_ins)
{
  string temp_str;
  raw_string_ostream os(temp_str);
  t_ins->print(os);
  return os.str();
}

// get value's name or inst's content
StringRef DFG::getValueName(Value *t_value)
{
  string temp_result = "val";
  if (t_value->getName().empty())
  {
    temp_result += to_string(m_num);
    m_num++;
  }
  else
  {
    temp_result = t_value->getName().str();
  }
  StringRef result(temp_result);
  //  cout << "" << result;
  return result;
}

int DFG::getNodeCount()
{
  return this->nodes.size();
}

int DFG::getDataNodeCount()
{
  return this->dataNodes.size();
}

int DFG::getFuNodeCount()
{
  return this->getNodeCount() - this->getDataNodeCount();
}

void DFG::tuneForBitcast()
{
  list<DFGNode *> unnecessaryDFGNodes;
  list<DFGEdge *> replaceDFGEdges;
  list<DFGEdge *> newDFGEdges;
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isBitcast())
    {
      unnecessaryDFGNodes.push_back(dfgNode);
      list<DFGNode *> *predNodes = dfgNode->getPredNodes();
      for (DFGNode *predNode : *predNodes)
      {
        replaceDFGEdges.push_back(getDFGEdge(predNode, dfgNode));
      }
      list<DFGNode *> *succNodes = dfgNode->getSuccNodes();
      for (DFGNode *succNode : *succNodes)
      {
        replaceDFGEdges.push_back(getDFGEdge(dfgNode, succNode));
        for (DFGNode *predNode : *predNodes)
        {
          DFGEdge *bypassDFGEdge = new DFGEdge(predNode->getID(),
                                               predNode, succNode);
          newDFGEdges.push_back(bypassDFGEdge);
        }
      }
    }
  }

  for (DFGNode *dfgNode : unnecessaryDFGNodes)
    nodes.remove(dfgNode);

  for (DFGEdge *dfgEdge : replaceDFGEdges)
    m_DFGEdges.remove(dfgEdge);

  for (DFGEdge *dfgEdge : newDFGEdges)
    m_DFGEdges.push_back(dfgEdge);

  connectDFGNodes();
}

void DFG::tuneForLoad()
{
  list<DFGNode *> unnecessaryDFGNodes;
  list<DFGEdge *> removeDFGEdges;
  list<DFGEdge *> newDFGEdges;
  for (DFGNode *dfgNode : nodes)
  {
    if (dfgNode->isGetptr())
    {
      list<DFGNode *> *succNodes = dfgNode->getSuccNodes();
      DFGNode *firstLoadNode = NULL;
      for (DFGNode *succNode : *succNodes)
      {
        if (firstLoadNode == NULL and succNode->isLoad())
        {
          firstLoadNode = succNode;
        }
        else if (firstLoadNode != NULL and succNode->isLoad())
        {
          unnecessaryDFGNodes.push_back(succNode);
          removeDFGEdges.push_back(getDFGEdge(dfgNode, succNode));
          for (DFGNode *succOfLoad : *(succNode->getSuccNodes()))
          {
            DFGEdge *removeEdge = getDFGEdge(succNode, succOfLoad);
            removeDFGEdges.push_back(removeEdge);
            DFGEdge *newDFGEdge = new DFGEdge(removeEdge->getID(),
                                              firstLoadNode, succOfLoad);
            newDFGEdges.push_back(newDFGEdge);
          }
        }
      }
    }
  }

  for (DFGNode *dfgNode : unnecessaryDFGNodes)
    nodes.remove(dfgNode);

  for (DFGEdge *dfgEdge : removeDFGEdges)
    m_DFGEdges.remove(dfgEdge);

  for (DFGEdge *dfgEdge : newDFGEdges)
    m_DFGEdges.push_back(dfgEdge);

  connectDFGNodes();
}

// This is necessary to handle the control flow.
// Each one would have their own implementation about control
// flow handling. We simply connect 'br' to the entry ('phi')
// of the corresponding basic blocks (w/o including additional
// DFG nodes).
void DFG::tuneForBranch()
{
  list<DFGNode *> processedDFGBrNodes;
  list<DFGEdge *> replaceDFGEdges;
  list<DFGEdge *> newBrDFGEdges;
  int newDFGEdgeID = m_DFGEdges.size();
  for (DFGEdge *dfgEdge : m_ctrlEdges)
  {
    DFGNode *left = dfgEdge->getSrc();
    DFGNode *right = dfgEdge->getDst();
    assert(left->isBranch());
    assert(right->isPhi());
    if (find(processedDFGBrNodes.begin(), processedDFGBrNodes.end(), left) ==
        processedDFGBrNodes.end())
    {
      processedDFGBrNodes.push_back(left);
    }
    else
    {
      DFGNode *newDFGBrNode = new DFGNode(nodes.size(), m_precisionAware, left->getInst(),
                                          getValueName(left->getInst()));
      for (DFGNode *predDFGNode : *(left->getPredNodes()))
      {
        DFGEdge *newDFGBrEdge = new DFGEdge(newDFGEdgeID++,
                                            predDFGNode, newDFGBrNode);
        m_DFGEdges.push_back(newDFGBrEdge);
      }
      nodes.push_back(newDFGBrNode);
      left = newDFGBrNode;
    }
    list<DFGNode *> *predNodes = right->getPredNodes();
    for (DFGNode *predNode : *predNodes)
    {
      DFGEdge *replaceDFGEdge = getDFGEdge(predNode, right);
      DFGEdge *brDataDFGEdge = new DFGEdge(replaceDFGEdge->getID(), predNode, left);
      DFGEdge *brCtrlDFGEdge = new DFGEdge(newDFGEdgeID++, left, right);
      // FIXME: Only consider one predecessor for 'phi' node for now.
      //        Need to care about true/false and make proper connection.
      replaceDFGEdges.push_back(replaceDFGEdge);
      newBrDFGEdges.push_back(brDataDFGEdge);
      newBrDFGEdges.push_back(brCtrlDFGEdge);
      break;
    }
  }
  for (DFGEdge *dfgEdge : replaceDFGEdges)
  {
    m_DFGEdges.remove(dfgEdge);
  }
  for (DFGEdge *dfgEdge : newBrDFGEdges)
  {
    m_DFGEdges.push_back(dfgEdge);
  }

  connectDFGNodes();
  //    DFGEdge* brCtrlDFGEdge = new DFGEdge(m_DFGEdges.size(), left, right);
  //    DFGEdge* replaceDFGEdge;
  //    for (list<DFGNode*>::iterator predNodeItr=predNodes->begin();
  //        predNodeItr!=predNodes->end(); ++predNodeItr) {
  //      DFGNode* predNode = *predNodeItr;
  //      list<DFGNode*>* visitedNodes = new list<DFGNode*>();
  //      // Found one predNode is one the same control/data path as the 'br'.
  //      if (searchDFS(left, predNode, visitedNodes)) {
  //        replaceDFGEdge = getDFGEdge(predNode, right);
  //        DFGEdge* brDataDFGEdge = new DFGEdge(replaceDFGEdge->getID(), predNode, left);
  //        m_DFGEdges.remove(replaceDFGEdge);
  //        m_DFGEdges.push_back(brDataDFGEdge);
  //        break;
  //      }
  //    }
  //    m_DFGEdges.push_back(brCtrlDFGEdge);
  //  }
}

void DFG::trimForStandalone()
{
  list<DFGNode *> removeNodes;
  for (DFGNode *dfgNode : nodes)
    if (dfgNode->getPredNodes()->size() == 0 and
        dfgNode->getSuccNodes()->size() == 0)
      removeNodes.push_back(dfgNode);

  for (DFGNode *dfgNode : removeNodes)
    nodes.remove(dfgNode);
}

bool DFG::searchDFS(DFGNode *t_target, DFGNode *t_head,
                    list<DFGNode *> *t_visitedNodes)
{
  for (DFGNode *succNode : *t_head->getSuccNodes())
  {
    if (t_target == succNode)
    {
      return true;
    }
    // succNode is not yet visited.
    if (find(t_visitedNodes->begin(), t_visitedNodes->end(), succNode) ==
        t_visitedNodes->end())
    {
      t_visitedNodes->push_back(succNode);
      if (searchDFS(t_target, succNode, t_visitedNodes))
      {
        return true;
      }
    }
  }
  return false;
}

// TODO: This is necessary for inter-iteration data dependency
//       checking (ld/st dependency analysis on base address).
void DFG::detectMemDataDependency()
{
}

// TODO: Certain opcode can be eliminated, such as bitcast, etc.
void DFG::eliminateOpcode(string t_opcodeName)
{
}

Instruction *DFG::getParentGEP(Instruction *t_inst)
{
  if (t_inst->getOpcode() == Instruction::GetElementPtr)
  {
    return t_inst;
  }
  else
  {
    for (Instruction::op_iterator op = t_inst->op_begin(), opEnd = t_inst->op_end(); op != opEnd; ++op)
    {
      Instruction *tempInst = dyn_cast<Instruction>(*op);
      if (tempInst)
      {
        return getParentGEP(tempInst);
      }
    }
  }
  return nullptr;
}