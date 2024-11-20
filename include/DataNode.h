/*
 * ======================================================================
 * DataNode.h
 * ======================================================================
 * DataNode implementation headfile.
 *
 * Author : Shangkun LI
 *   Date : Oct 31, 2024
 */

#ifndef DataNode_H
#define DataNode_H

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

class DataNode;

class DataNode : public DFGNode
{
private:
    int m_size;      // Size in bytes.
    Type *m_memtype; // Type of the data.
    DFGNode *m_ParentNode;

public:
    DataNode(int, bool, Value *, StringRef, int, Type *);
    void initType();
    int getSize();
    void setSize(int);
    Type *getMemType();
    void setMemType(Type *);
    DFGNode *getParentNode();
    void setParentNode(DFGNode *);
};

#endif