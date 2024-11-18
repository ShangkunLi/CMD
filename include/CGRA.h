/*
 * ======================================================================
 * CGRA.h
 * ======================================================================
 * CGRA implementation header file.
 *
 * Author : Cheng Tan
 *   Date : July 16, 2019
 */

// #include "llvm/Pass.h"
#include "CGRANode.h"
#include "CGRAMem.h"
#include "CGRALink.h"
#include <iostream>
// #include <llvm/Support/raw_ostream.h>

using namespace llvm;

class CGRA
{
private:
  int m_FUCount;   // number of functional units
  int m_LinkCount; // number of links
  int m_rows;      // number of rows
  int m_columns;   // number of columns
  int m_MemCount;  // number of memory tiles
  int m_clusterSize;
  void disableSpecificConnections();

public:
  CGRA(int, int, bool, bool, bool, map<string, list<int> *> *);
  CGRA(int, int, bool, bool, bool, map<string, list<int> *> *, bool);
  CGRA(int, int, int, int, bool, bool, bool, map<string, list<int> *> *);
  CGRANode ***nodes;                     // 2D array of CGRANode pointers
  CGRALink **links;                      // 1D array of CGRALink pointers
  int getFUCount() { return m_FUCount; } // get the number of functional units
  map<int, CGRAMem *> MemNodes;          // 2D array of CGRAMem pointers
  int getLinkCount() { return m_LinkCount; }
  int getMemCount() { return m_MemCount; }
  void getRoutingResource();
  void constructMRRG(int);
  int getRows() { return m_rows; }
  int getColumns() { return m_columns; }
  CGRALink *getLink(CGRANode *, CGRANode *);
  void setBypassConstraint(int);
  void setCtrlMemConstraint(int);
  void setRegConstraint(int);
  void generateMRRG(bool);
  void createMemNodes(int);
};
