/*
 * ======================================================================
 * LoopDFG.h
 * ======================================================================
 * Loop DFG implementation header file.
 *
 * Author : Shangkun LI
 *   Date : Nov 2, 2024
 */

#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
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

#include "DFG.h"

using namespace llvm;
using namespace std;

class LoopsDFG
{
private:
    list<Loop *> m_loops;
    map<Loop *, DFG *> m_loopDFGs;

public:
    DFG *getLoopDFG(Loop *t_loop);
    DFG *MergeLoopsDFG(Loop *t_loop, DFG *t_dfg);
};