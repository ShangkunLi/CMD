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

CGRAMem::CGRAMem(int t_id, int t_x, int t_y, int t_memorySize)
    : CGRANode()
{
    setID(t_id);
    // cout << "Memory Node ID: " << t_id << endl;
    setLocation(t_x, t_y);
    // cout << "Memory Node at (" << t_x << ", " << t_y << ")" << endl;
    setMemorySize(t_memorySize);
    // cout << "Memory size: " << t_memorySize << " bytes" << endl;
    setIsMem(true);
    setDisabled(false);
    setAvailableMemSize(t_memorySize);
    // m_CGRANodeCluster = NULL;
    // cout << "Memory node created\n";
}

void CGRAMem::setMemorySize(int t_memorySize)
{
    m_memorySize = t_memorySize;
}

int CGRAMem::getMemorySize()
{
    return m_memorySize;
}

bool CGRAMem::isInCluster(CGRANode *t_node)
{
    for (CGRANode *node : m_CGRANodeCluster)
    {
        if (node == t_node)
        {
            return true;
        }
    }
    return false;
}

list<CGRANode *> CGRAMem::getCluster()
{
    return m_CGRANodeCluster;
}

void CGRAMem::addNodeToCluster(CGRANode *t_node)
{
    m_CGRANodeCluster.push_back(t_node);
}

int CGRAMem::getAvailableMemSize()
{
    return this->m_availableMemSize;
}

void CGRAMem::setAvailableMemSize(int t_availableMemSize)
{
    this->m_availableMemSize = t_availableMemSize;
}

void CGRAMem::constructMRRG()
{
    this->setAvailableMemSize(getMemorySize());
}