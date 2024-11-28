/*
 * ======================================================================
 * Refinement.cpp
 * ======================================================================
 * MemoryArchitecture Refinement implementation.
 *
 * Author : Shangkun LI
 *   Date : Nov 27, 2024
 */

#include "Refinement.h"
#include "json.hpp"
#include <cmath>
#include <iostream>
#include <string>
#include <list>
#include <map>
#include <vector>
#include <fstream>

// #include <nlohmann/json.hpp>
using json = nlohmann::json;
using namespace std;

Refinement::Refinement(Mapper *t_mapper, CGRA *t_cgra, DFG *t_dfg, int t_II, bool t_diagonalVectorization, bool t_heterogeneity, bool t_parameterizableCGRA, map<string, list<int> *> *t_additionalFunc, int t_regConstraint, int t_ctrlMemConstraint, int t_bypassConstraint)
{
    this->m_mapper = t_mapper;
    this->m_cgra = t_cgra;
    this->m_dfg = t_dfg;
    this->m_II = t_II;
    this->m_diagonalVectorization = t_diagonalVectorization;
    this->m_heterogeneity = t_heterogeneity;
    this->m_parameterizableCGRA = t_parameterizableCGRA;
    this->m_additionalFunc = t_additionalFunc;
    this->m_cost = calculateCost(t_cgra, t_II);
    this->regConstraint = t_regConstraint;
    this->ctrlMemConstraint = t_ctrlMemConstraint;
    this->bypassConstraint = t_bypassConstraint;
    this->m_clusterSizeSpace = {1, 2, 4, 6};
    int memorySize = t_cgra->MemNodes[0]->getMemorySize();
    for (int i = 1; i <= memorySize / 1024; ++i)
    {
        this->m_memorySizeSpace.push_back(i * 1024);
    }
}

double Refinement::calculateCost(CGRA *t_cgra, int t_II)
{
    int allmemorySizeinKB = 0;
    int usedmemorySize = 0;
    int allusedmemorySize = 0;
    // memory efficiency = used memory size / all memory size of used memory units
    double memoryEfficiency = 0;

    for (auto mem : t_cgra->MemNodes)
    {
        usedmemorySize += (mem.second->getMemorySize() - mem.second->getAvailableMemSize());
        if (mem.second->getMemorySize() != mem.second->getAvailableMemSize())
        {
            allusedmemorySize += mem.second->getMemorySize();
        }
        allmemorySizeinKB = allmemorySizeinKB + mem.second->getMemorySize() / 1024;
    }

    memoryEfficiency = double(usedmemorySize) / double(allusedmemorySize);

    if (t_II == -1)
    {
        return 1000000;
    }
    else
    {
        // return 100 * t_II + 0.5 / memoryEfficiency + 0.8 * allmemorySizeinKB;
        return 500 * t_II + 50 / memoryEfficiency + 20 * allmemorySizeinKB;
    }
}

int Refinement::memoryRefinement(Mapper *t_mapper, CGRA *t_cgra, DFG *t_dfg, int t_II, bool t_isStaticElasticCGRA)
{
    this->m_bestII = t_II;
    this->m_bestClusterSize = t_cgra->m_clusterSize;
    this->m_bestMemorySize = t_cgra->MemNodes[0]->getMemorySize();
    CGRA *cgra = NULL;
    Mapper* mapper= NULL;
    // int clusterSize = 0;
    // int memorySize = 0;
    for (int clusterSize : this->m_clusterSizeSpace)
    {
        for (int memorySize : this->m_memorySizeSpace)
        {
            cgra = new CGRA(t_cgra->getRows(), t_cgra->getColumns(), clusterSize, memorySize, this->m_diagonalVectorization, this->m_heterogeneity, this->m_parameterizableCGRA, this->m_additionalFunc);
            cgra->setRegConstraint(regConstraint);
            cgra->setCtrlMemConstraint(ctrlMemConstraint);
            cgra->setBypassConstraint(bypassConstraint);
            // Initialize the Mapper.
            mapper = new Mapper();

            // Initialize the II.
            int ResMII = mapper->getResMII(this->m_dfg, cgra);
            cout << "==================================\n";
            cout << "[ResMII: " << ResMII << "]\n";
            int RecMII = mapper->getRecMII(this->m_dfg);
            cout << "==================================\n";
            cout << "[RecMII: " << RecMII << "]\n";
            // II = max(ResMII, RecMII)
            int II = ResMII;
            if (II < RecMII)
                II = RecMII;

            II = mapper->heuristicMapwithMemory(cgra, this->m_dfg, II, t_isStaticElasticCGRA);
            double cost = this->calculateCost(cgra, II);

            errs() << "Cluster Size: " << clusterSize << "\n";
            errs() << "Memory Size: " << memorySize << "\n";
            errs() << "II: " << II << "\n";
            errs() << "Cost: " << cost << "\n";
            errs() << "Best Cost: " << this->m_cost << "\n";
            if (cost <= this->m_cost)
            {
                this->m_cost = cost;
                this->m_bestII = II;
                this->m_bestClusterSize = clusterSize;
                this->m_bestMemorySize = memorySize;
            }
        }
    }
    errs() << "Best Cluster Size: " << this->m_bestClusterSize << "\n";
    errs() << "Best Memory Size: " << this->m_bestMemorySize << "\n";
    errs() << "Best II: " << this->m_bestII << "\n";
    return this->m_bestII;
}