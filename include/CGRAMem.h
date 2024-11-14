/*
 * ======================================================================
 * CGRAMem.h
 * ======================================================================
 * CGRA Memory tile implementation header file.
 *
 * Author : Shangkun LI
 *   Date : Nov 11, 2024
 */

#ifndef CGRAMem_H
#define CGRAMem_H

#include "CGRALink.h"
#include "DFGNode.h"
#include "CGRANode.h"
#include <iostream>
// #include <llvm/IR/Function.h>
// #include <llvm/IR/Value.h>
// #include <llvm/Support/raw_ostream.h>
// #include <llvm/Support/FileSystem.h>
#include <list>
#include <string>

using namespace std;
using namespace llvm;

class CGRALink;
class DFGNode;
class CGRAMem;

class CGRAMem : public CGRANode
{
private:
  int m_memorySize; // memory size in bytes
  list<CGRANode *> m_CGRANodeCluster;

public:
  CGRAMem(int t_id, int t_x, int t_y, int t_memorySize, list<CGRANode *> t_CGRANodeCluster);
  void setMemorySize(int);
  int getMemorySize();
  void addCGRANode(CGRANode *);
};

#endif
