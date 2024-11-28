/*
 * ======================================================================
 * Refinement.h
 * ======================================================================
 * MemoryArchitecture Refinement implementation header file.
 *
 * Author : Shangkun LI
 *   Date : Nov 27, 2024
 */

// #include "DFG.h"
// #include "CGRA.h"
#include "Mapper.h"

class Refinement
{
private:
    double m_cost;
    list<int> m_clusterSizeSpace;
    list<int> m_memorySizeSpace;

    map<string, list<int> *> *m_additionalFunc;
    bool m_diagonalVectorization;
    bool m_heterogeneity;
    bool m_parameterizableCGRA;
    int regConstraint;
    int ctrlMemConstraint;
    int bypassConstraint;

    int m_II;

public:
    Refinement(Mapper *, CGRA *, DFG *, int, bool, bool, bool, map<string, list<int> *> *, int, int, int);
    Mapper *m_mapper;
    CGRA *m_cgra;
    DFG *m_dfg;

    int m_bestClusterSize;
    int m_bestMemorySize;
    int m_bestII;
    int memoryRefinement(Mapper *, CGRA *, DFG *, int, bool);
    double calculateCost(CGRA *, int);
};