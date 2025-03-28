/*
 * ======================================================================
 * DFG.cpp
 * ======================================================================
 * DFG implementation header file.
 *
 * Author : Cheng Tan
 *   Date : July 16, 2019
 */

#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include "llvm/IR/GetElementPtrTypeIterator.h"
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/IR/Use.h>
#include <llvm/Analysis/CFG.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <list>
#include <set>
#include <map>
#include <iostream>

#include "DFGNode.h"
#include "DFGEdge.h"
#include "DataNode.h"

using namespace llvm;
using namespace std;

class DFG
{
private:
  int m_nodeCount;
  int m_dataNodeCount;
  int m_ctrledgeCount;
  int m_dfgedgeCount;

  int m_num;
  bool m_CDFGFused;
  bool m_targetFunction;
  bool m_precisionAware;
  list<DFGNode *> *m_orderedNodes;
  list<Loop *> *m_targetLoops;

  // edges of data flow
  list<DFGEdge *> m_DFGEdges;
  list<DFGEdge *> m_ctrlEdges;
  list<DFGEdge *> m_allEdges; // all edges including data Node edges

  string changeVal2Str(Value *ins);
  // get value's name or inst's content
  StringRef getValueName(Value *v);
  void DFS_on_DFG(DFGNode *, DFGNode *, list<DFGNode *> *, list<DFGEdge *> *,
                  list<DFGEdge *> *, list<list<DFGEdge *> *> *);
  DFGNode *getNode(Value *);
  bool hasNode(Value *);
  DFGEdge *getDFGEdge(DFGNode *, DFGNode *);
  void deleteDFGEdge(DFGNode *, DFGNode *);
  void replaceDFGEdge(DFGNode *, DFGNode *, DFGNode *, DFGNode *);
  bool hasDFGEdge(DFGNode *, DFGNode *);
  DFGEdge *getCtrlEdge(DFGNode *, DFGNode *);
  bool hasCtrlEdge(DFGNode *, DFGNode *);
  bool shouldIgnore(Instruction *);
  void tuneForBranch();
  void tuneForBitcast();
  void tuneForLoad();
  void tuneForPattern();
  void combineCmpBranch();
  void combineMulAdd();
  void combinePhiAdd();
  void combine(string, string);
  void combineForIter(list<string> *);
  // combineForUnroll is used to reconstruct "phi-add-add-..." alike patterns with a limited length.
  void combineForUnroll(list<string> *);
  void trimForStandalone();
  void detectMemDataDependency();
  void eliminateOpcode(string);
  bool searchDFS(DFGNode *, DFGNode *, list<DFGNode *> *);
  void connectDFGNodes();
  bool isLiveInInst(BasicBlock *, Instruction *);
  bool containsInst(BasicBlock *, Instruction *);
  int getInstID(BasicBlock *, Instruction *);
  // Reorder the DFG nodes (initial CPU execution ordering) in
  // ASAP (as soon as possible) or ALAP (as last as possible)
  // for mapping.
  void reorderInASAP();
  void reorderInALAP();
  void reorderInLongest();
  void reorderDFS(set<DFGNode *> *, list<DFGNode *> *,
                  list<DFGNode *> *, DFGNode *);
  void initExecLatency(map<string, int> *);
  void initPipelinedOpt(list<string> *);
  bool isMinimumAndHasNotBeenVisited(set<DFGNode *> *, map<DFGNode *, int> *, DFGNode *);

public:
  DFG(Function &, list<Loop *> *, bool, bool, bool, map<string, int> *, list<string> *);
  DFG(list<Loop *> *, bool, bool, bool, map<string, int> *, list<string> *,bool);
  list<list<DFGNode *> *> *m_cycleNodeLists;
  // initial ordering of insts
  list<DFGNode *> allNodes;   // all nodes
  list<DFGNode *> nodes;      // nodes of operating instructions
  list<DataNode *> dataNodes; // nodes of data

  list<Loop *> DFGLoops;
  map<Loop *, vector<BasicBlock *>> LoopBBs;
  map<BasicBlock *, vector<Instruction *>> BBInsts;

  list<DFGNode *> *getBFSOrderedNodes();
  list<DFGNode *> *getDFSOrderedNodes();
  int getNodeCount();
  int getDataNodeCount();
  int getFuNodeCount();
  void construct(Function &);
  bool construct(Loop *);
  bool constructWithDataMem(Loop *);
  void setupCycles();
  list<list<DFGEdge *> *> *calculateCycles();
  list<list<DFGNode *> *> *getCycleLists();
  int getID(DFGNode *);
  bool isLoad(DFGNode *);
  bool isStore(DFGNode *);
  void showOpcodeDistribution();
  void generateDot(Function &, bool, bool);
  void generateJSON();
  bool isLiveInBasicBlock(BasicBlock *BB, Instruction *t_inst);
  Instruction *getInstNotInBasicBlock(BasicBlock *BB, Instruction *t_inst);
  Instruction *getParentGEP(Instruction *t_inst);
};
