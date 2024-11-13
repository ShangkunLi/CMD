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

CGRAMem::CGRAMem(int t_id, int t_x, int t_y, int t_memorySize, int t_numPorts)
    : CGRANode()
{
    setID(t_id);
    setLocation(t_x, t_y);
    setMemorySize(t_memorySize);
    setNumPorts(t_numPorts);
    setIsMem(true);
    setDisabled(false);
    m_CGRANodeCluster= list<CGRANode *>();
}

void CGRAMem::setNumPorts(int t_numPorts)
{
    m_numPorts = t_numPorts;
}

int CGRAMem::getNumPorts()
{
    return m_numPorts;
}

void CGRAMem::setMemorySize(int t_memorySize)
{
    m_memorySize = t_memorySize;
}

int CGRAMem::getMemorySize()
{
    return m_memorySize;
}

void CGRAMem::addCGRANode(CGRANode *t_CGRANode)
{
    m_CGRANodeCluster.push_back(t_CGRANode);
}
