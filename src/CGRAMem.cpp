/*
 * ======================================================================
 * CGRAMem.cpp
 * ======================================================================
 * CGRA Memory tile implementation.
 *
 * Author : Shangkun LI
 *   Date : Nov 11, 2024
 */

#include "CGRAMem.h"
#include <stdio.h>

CGRAMem::CGRAMem(int t_id, int t_x, int t_y, int t_memorySize, list<CGRANode *> t_CGRANodeCluster)
    : CGRANode()
{
    setID(t_id);
    setLocation(t_x, t_y);
    setMemorySize(t_memorySize);
    setIsMem(true);
    setDisabled(false);
    m_CGRANodeCluster = t_CGRANodeCluster;
}

void CGRAMem::setMemorySize(int t_memorySize)
{
    m_memorySize = t_memorySize;
}

int CGRAMem::getMemorySize()
{
    return m_memorySize;
}