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
private:
    int m_size;      // Size in bytes.
    Type *m_memtype; // Type of the data.

public:
    DataMemNode(int, bool, Value *, StringRef, int, Type *);
    void initType();
    int getSize();
    void setSize(int);
    Type *getMemType();
    void setMemType(Type *);
};

#endif