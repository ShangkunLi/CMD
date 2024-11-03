/*
 * ======================================================================
 * DataMemNode.cpp
 * ======================================================================
 * DataMem node implementation.
 *
 * Author : Shangkun LI
 *   Date : Oct 31, 2024
 */

#ifndef DataMemNode_H
#define DataMemNode_H

#include <llvm/IR/Value.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

#include <string>
#include <list>
#include <stdio.h>
#include <iostream>

#include "DFGEdge.h"
#include "DFGNode.h"

using namespace llvm;
using namespace std;

class DataMemNode;

class DataMemNode : public DFGNode
{
public:
    DataMemNode(int, bool, Value *, StringRef);
    void initType();
};

#endif