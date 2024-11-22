/*
 * ======================================================================
 * DFGNode.h
 * ======================================================================
 * DFG node implementation header file.
 *
 * Author : Cheng Tan
 *   Date : July 19, 2019
 */

#ifndef DFGNode_H
#define DFGNode_H

#include <llvm/IR/Value.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

#include <string>
#include <list>
#include <stdio.h>
#include <iostream>

#include "DFGEdge.h"

using namespace llvm;
using namespace std;

class DFGEdge;

class DFGNode
{
private:
  // Original id that is ordered in the original execution order (i.e.,
  // CPU/IR execution sequential ordering).
  int m_id;
  bool m_precisionAware;
  Instruction *m_inst;
  Value *m_value;
  StringRef m_stringRef;
  string m_opcodeName;
  list<DFGEdge *> m_inEdges;
  list<DFGEdge *> m_outEdges;
  list<DFGNode *> *m_succNodes;
  list<DFGNode *> *m_predNodes;
  list<DFGNode *> *m_patternNodes;
  list<int> *m_cycleID;
  bool m_isMapped;
  int m_numConst;
  string m_optType;
  string m_fuType;
  bool m_combined;
  bool m_isConst;
  bool m_hasmemory;
  bool m_isPatternRoot;
  bool m_critical;
  int m_level;
  int m_execLatency;
  bool m_pipelinable;
  // "m_predicated" indicates whether the execution of the node depends on
  // predication or not (i.e., the predecessor probably is a "branch").
  bool m_isPredicatee;
  list<DFGNode *> *m_predicatees;
  bool m_isPredicater;
  DFGNode *m_patternRoot;
  void setPatternRoot(DFGNode *);

public:
  DFGNode(int, bool, Instruction *, StringRef);
  DFGNode(int, bool, Value *, bool);
  DFGNode();
  string getOptType();
  void setOptType(string t_optType);
  int getID();
  void setID(int);
  bool getPrecisionAware();
  void setPrecisionAware(bool);
  Value *getValue();
  void setValue(Value *);
  void setInst(Instruction *);
  StringRef getStringRef();
  void setSringRef(StringRef);
  string getOpcodeName();
  void setOpcodeName(string);
  void initPredNodes(list<DFGNode *> *predNodes = NULL);
  void addPredNode(DFGNode *);
  void initSuccNodes(list<DFGNode *> *succNodes = NULL);
  void addSuccNode(DFGNode *);
  string getFuType();
  void setFuType(string);
  void setLevel(int);
  int getLevel();
  bool isMapped();
  void setMapped(bool Mapped = true);
  void clearMapped();
  bool isLoad();
  bool isStore();
  bool isReturn();
  bool isCall();
  bool isBranch();
  bool isPhi();
  bool isAdd();
  bool isMul();
  bool isCmp();
  bool isBitcast();
  bool isGetptr();
  bool isSel();
  bool isMAC();
  bool isLogic();
  bool isOpt(string);
  bool isVectorized();
  bool hasCombined();
  void sethasMemory(bool);
  bool hasMemory();
  void setCombine(bool combined = true);
  void addPatternPartner(DFGNode *);
  void initPatternNodes();
  Instruction *getInst();
  list<DFGNode *> *getPredNodes();
  list<DFGNode *> *getSuccNodes();
  bool isSuccessorOf(DFGNode *);
  bool isPredecessorOf(DFGNode *);
  bool isOneOfThem(list<DFGNode *> *);
  void setInEdge(DFGEdge *);
  void setOutEdge(DFGEdge *);
  void cutEdges();
  string getJSONOpt();
  void setConst(int);
  void addConst();
  void removeConst();
  int getNumConst();
  void initType();
  bool isPatternRoot();
  void setIsPatternRoot(bool);
  DFGNode *getPatternRoot();
  void initPatternRoot();
  list<DFGNode *> *getPatternNodes();
  void addCycleID(int);
  void setCritical(bool critical = true);
  bool isCritical();
  list<int> *getCycleIDs();
  void addPredicatee(DFGNode *);
  list<DFGNode *> *getPredicatees();
  void setIsPredicatee(bool ispredicatee = true);
  bool isPredicatee();
  void setIsPredicater(bool ispredicater = true);
  bool isPredicater();
  void initPredicatees();
  bool shareSameCycle(DFGNode *);
  void setExecLatency(int t_execLatency = 1);
  bool isMultiCycleExec();
  int getExecLatency();
  void setPipelinable(bool pipelinable = true);
  bool isPipelinable();
  bool shareFU(DFGNode *);
};

#endif
