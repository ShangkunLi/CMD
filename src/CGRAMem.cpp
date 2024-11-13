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

void CGRAMem::setMemorySize(int t_memorySize)
{
  m_memorySize = t_memorySize;
}

int CGRAMem::getMemorySize()
{
  return m_memorySize;
}
