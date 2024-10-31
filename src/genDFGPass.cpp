#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/LoopIterator.h>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include <set>

#include "DFG.h"

using namespace llvm;
using namespace std;
using namespace chrono;

void addDefaultKernels(map<string, list<int> *> *);

namespace
{
    struct genDFGPass : public FunctionPass
    {
        static char ID;
        genDFGPass() : FunctionPass(ID) {}

        void getAnalysisUsage(AnalysisUsage &AU) const override
        {
            AU.addRequired<LoopInfoWrapperPass>();
            AU.addPreserved<LoopInfoWrapperPass>();
            AU.setPreservesAll();
        }

        bool runOnFunction(Function &t_F) override
        {
            cout << "==================================\n";
            cout << "[function \'" << t_F.getName().str() << "\' is being analyzed]\n";
            bool targetNested = false;
            bool targetEntireFunction = false;
            bool precisionAware = false;
            bool heterogeneity = false;
            bool isTrimmedDemo = false;

            map<string, int> *execLatency = new map<string, int>();
            execLatency->insert(pair<string, int>("load", 2));
            execLatency->insert(pair<string, int>("store", 2));

            list<string> *pipelinedOpt = new list<string>();
            pipelinedOpt->push_back("load");
            pipelinedOpt->push_back("store");

            // Set the target function and loop.
            map<string, list<int> *> *functionWithLoop = new map<string, list<int> *>();
            addDefaultKernels(functionWithLoop);

            // Check existance.
            if (functionWithLoop->find(t_F.getName().str()) == functionWithLoop->end())
            {
                cout << "[function \'" << t_F.getName().str() << "\' is not in our target list]\n";
                return false;
            }

            cout << "==================================\n";
            cout << "[function \'" << t_F.getName().str() << "\' is one of our targets]\n";

            // list<Loop *> *targetLoops = getTargetLoops(t_F, functionWithLoop, targetNested);
            // DFG *dfg = new DFG(t_F, targetLoops, targetEntireFunction, precisionAware,
            //                    heterogeneity, execLatency, pipelinedOpt);

            // // Show the count of different opcodes (IRs).
            // cout << "==================================\n";
            // cout << "[show opcode count]\n";
            // dfg->showOpcodeDistribution();

            // // Generate the DFG dot file.
            // cout << "==================================\n";
            // cout << "[generate dot for DFG]\n";
            // dfg->generateDot(t_F, isTrimmedDemo);

            // // Generate the DFG dot file.
            // cout << "==================================\n";
            // cout << "[generate JSON for DFG]\n";
            // dfg->generateJSON();

            list<Loop *> *innermostLoops = getInnermostLoops(t_F, functionWithLoop, targetNested);
            cout << "==================================\n";
            cout << "number of innermost loops: " << innermostLoops->size() << "\n";
            cout << "==================================\n";
            DFG *dfg2 = new DFG(innermostLoops, targetEntireFunction, precisionAware,
                                heterogeneity, execLatency, pipelinedOpt);
        }

        /*
         * Add the loops of each kernel. Target nested-loops if it is indicated.
         */
        list<Loop *> *getTargetLoops(Function &t_F, map<string, list<int> *> *t_functionWithLoop, bool t_targetNested)
        {
            int targetLoopID = 0;
            list<Loop *> *targetLoops = new list<Loop *>();
            // Since the ordering of the target loop id could be random, I use O(n^2) to search the target loop.
            while ((*t_functionWithLoop).at(t_F.getName().str())->size() > 0)
            {
                targetLoopID = (*t_functionWithLoop).at(t_F.getName().str())->front();
                (*t_functionWithLoop).at(t_F.getName().str())->pop_front();
                LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
                int tempLoopID = 0;
                Loop *current_loop = NULL;
                for (LoopInfo::iterator loopItr = LI.begin();
                     loopItr != LI.end(); ++loopItr)
                {
                    // targetLoops->push_back(*loopItr);
                    current_loop = *loopItr;
                    if (tempLoopID == targetLoopID)
                    {
                        // Targets innermost loop if the param targetNested is not set.
                        if (!t_targetNested)
                        {
                            while (!current_loop->getSubLoops().empty())
                            {
                                errs() << "[explore] nested loop ... subloop size: " << current_loop->getSubLoops().size() << "\n";
                                // TODO: might change '0' to a reasonable index
                                // If this loop is a nested loop, we target the innermost loop.
                                current_loop = current_loop->getSubLoops()[0];
                            }
                        }
                        targetLoops->push_back(current_loop);
                        errs() << "*** reach target loop ID: " << tempLoopID << "\n";
                        break;
                    }
                    ++tempLoopID;
                }
                if (targetLoops->size() == 0)
                {
                    errs() << "... no loop detected in the target kernel ...\n";
                }
            }
            errs() << "... done detected loops.size(): " << targetLoops->size() << "\n";
            return targetLoops;
        }

        list<Loop *> *getInnermostLoops(Function &t_F, map<string, list<int> *> *t_functionWithLoop, bool t_targetNested)
        {
            int targetLoopID = 0;
            list<Loop *> *innermostLoops = new list<Loop *>();
            list<Loop *> *nestedLoops = new list<Loop *>();
            // Since the ordering of the target loop id could be random, I use O(n^2) to search the target loop.
            LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
            Loop *current_loop = NULL;
            for (LoopInfo::iterator loopItr = LI.begin();
                 loopItr != LI.end(); ++loopItr)
            {
                current_loop = *loopItr;
                if (!t_targetNested)
                {
                    if (current_loop->getSubLoops().empty())
                    {
                        innermostLoops->push_back(current_loop);
                        errs() << "Innermost loop detected: "<< current_loop->getName() << "\n";
                        continue;
                    }
                    else
                    {
                        nestedLoops->push_back(current_loop);
                        errs() << "Nested loop detected: "<< current_loop->getName() << "\n";
                    }

                    while (!nestedLoops->empty())
                    {
                        for(Loop* subloop: nestedLoops->front()->getSubLoops())
                        {
                            if(subloop->getSubLoops().empty())
                            {
                                innermostLoops->push_back(subloop);
                                errs() << "Innermost loop detected: "<< subloop->getName() << "\n";
                            }
                            else
                            {
                                nestedLoops->push_back(subloop);
                                errs() << "Nested loop detected: "<< subloop->getName() << "\n";
                            }
                        }
                        nestedLoops->pop_front();
                    }
                }
            }
            errs() << "... done detected innermost loops.size(): " << innermostLoops->size() << "\n";
            return innermostLoops;
        }
    };
}

char genDFGPass::ID = 0;
static RegisterPass<genDFGPass> X("genDFGPass", "DFG Pass Analyse", false, false);

/*
 * Add the kernel names of some popular applications.
 * Assume each kernel contains single loop.
 */
void addDefaultKernels(map<string, list<int> *> *t_functionWithLoop)
{

    (*t_functionWithLoop)["_Z12ARENA_kerneliii"] = new list<int>();
    (*t_functionWithLoop)["_Z12ARENA_kerneliii"]->push_back(0);
    (*t_functionWithLoop)["_Z4spmviiPiS_S_"] = new list<int>();
    (*t_functionWithLoop)["_Z4spmviiPiS_S_"]->push_back(0);
    (*t_functionWithLoop)["_Z4spmvPiii"] = new list<int>();
    (*t_functionWithLoop)["_Z4spmvPiii"]->push_back(0);
    (*t_functionWithLoop)["adpcm_coder"] = new list<int>();
    (*t_functionWithLoop)["adpcm_coder"]->push_back(0);
    (*t_functionWithLoop)["adpcm_decoder"] = new list<int>();
    (*t_functionWithLoop)["adpcm_decoder"]->push_back(0);
    (*t_functionWithLoop)["kernel_gemm"] = new list<int>();
    (*t_functionWithLoop)["kernel_gemm"]->push_back(0);
    (*t_functionWithLoop)["kernel"] = new list<int>();
    (*t_functionWithLoop)["kernel"]->push_back(0);
    (*t_functionWithLoop)["_Z6kernelPfS_S_"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPfS_S_"]->push_back(0);
    (*t_functionWithLoop)["_Z6kerneliPPiS_S_S_"] = new list<int>();
    (*t_functionWithLoop)["_Z6kerneliPPiS_S_S_"]->push_back(0);
    (*t_functionWithLoop)["_Z6kernelPPii"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPPii"]->push_back(0);
    (*t_functionWithLoop)["_Z6kernelP7RGBType"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelP7RGBType"]->push_back(0);
    (*t_functionWithLoop)["_Z6kernelP7RGBTypePi"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelP7RGBTypePi"]->push_back(0);
    (*t_functionWithLoop)["_Z6kerneli"] = new list<int>();
    (*t_functionWithLoop)["_Z6kerneli"]->push_back(0);
    (*t_functionWithLoop)["_Z6kernelP7RGBTypeP4Vect"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelP7RGBTypeP4Vect"]->push_back(0);
    (*t_functionWithLoop)["fir"] = new list<int>();
    (*t_functionWithLoop)["fir"]->push_back(0);
    (*t_functionWithLoop)["spmv"] = new list<int>();
    (*t_functionWithLoop)["spmv"]->push_back(0);
    // (*functionWithLoop)["fir"].push_back(1);
    (*t_functionWithLoop)["latnrm"] = new list<int>();
    (*t_functionWithLoop)["latnrm"]->push_back(1);
    (*t_functionWithLoop)["fft"] = new list<int>();
    (*t_functionWithLoop)["fft"]->push_back(0);
    (*t_functionWithLoop)["BF_encrypt"] = new list<int>();
    (*t_functionWithLoop)["BF_encrypt"]->push_back(0);
    (*t_functionWithLoop)["susan_smoothing"] = new list<int>();
    (*t_functionWithLoop)["susan_smoothing"]->push_back(0);

    (*t_functionWithLoop)["_Z9LUPSolve0PPdPiS_iS_"] = new list<int>();
    (*t_functionWithLoop)["_Z9LUPSolve0PPdPiS_iS_"]->push_back(0);

    // For LU:
    // init
    (*t_functionWithLoop)["_Z6kernelPPdidPi"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPPdidPi"]->push_back(0);

    // solver0 & solver1
    (*t_functionWithLoop)["_Z6kernelPPdPiS_iS_"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPPdPiS_iS_"]->push_back(0);

    // determinant
    (*t_functionWithLoop)["_Z6kernelPPdPii"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPPdPii"]->push_back(0);

    // invert
    (*t_functionWithLoop)["_Z6kernelPPdPiiS0_"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPPdPiiS0_"]->push_back(0);

    // For AutoSA test:
    (*t_functionWithLoop)["lu_cpu"] = new list<int>();
    (*t_functionWithLoop)["lu_cpu"]->push_back(0);

    // nested
    // (*t_functionWithLoop)["_Z6kernelPfS_S_"] = new list<int>();
    // (*t_functionWithLoop)["_Z6kernelPfS_S_"]->push_back(0);
}