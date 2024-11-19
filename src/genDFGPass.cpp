#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/LoopIterator.h>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include <set>

// #include "DFG.h"
// #include "CGRA.h"
#include "Mapper.h"
#include "json.hpp"

using namespace llvm;
using namespace std;
using json = nlohmann::json;
using namespace chrono;

void addDefaultKernels(map<string, list<int> *> *);

namespace
{
    struct genDFGPass : public FunctionPass
    {
        static char ID;
        Mapper *mapper;
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

            // Initializes input parameters.
            int rows = 4;
            int columns = 4;
            int clusterSize = 1;
            int memorySize = 1024;
            bool supportMemory = false;
            bool targetEntireFunction = false;
            bool targetNested = false;
            bool doCGRAMapping = true;
            bool isStaticElasticCGRA = false;
            bool isTrimmedDemo = true;
            int ctrlMemConstraint = 200;
            int bypassConstraint = 4;
            int regConstraint = 8;
            bool precisionAware = false;
            bool diagonalVectorization = false;
            bool heterogeneity = false;
            bool heuristicMapping = true;
            bool parameterizableCGRA = false;
            bool incrementalMapping = false;
            map<string, int> *execLatency = new map<string, int>();
            list<string> *pipelinedOpt = new list<string>();
            map<string, list<int> *> *additionalFunc = new map<string, list<int> *>();

            // Set the target function and loop.
            map<string, list<int> *> *functionWithLoop = new map<string, list<int> *>();
            addDefaultKernels(functionWithLoop);

            // Read the parameter JSON file.
            ifstream i("./param.json");
            if (!i.good())
            {

                cout << "=============================================================\n";
                cout << "\033[0;31mPlease provide a valid <param.json> in the current directory." << endl;
                cout << "A set of default parameters is leveraged.\033[0m" << endl;
                cout << "=============================================================\n";
            }
            else
            {
                json param;
                i >> param;

                // Check param exist or not.
                set<string> paramKeys;
                paramKeys.insert("row");
                paramKeys.insert("column");
                paramKeys.insert("targetFunction");
                paramKeys.insert("kernel");
                paramKeys.insert("targetNested");
                paramKeys.insert("targetLoopsID");
                paramKeys.insert("isTrimmedDemo");
                paramKeys.insert("doCGRAMapping");
                paramKeys.insert("isStaticElasticCGRA");
                paramKeys.insert("ctrlMemConstraint");
                paramKeys.insert("bypassConstraint");
                paramKeys.insert("regConstraint");
                paramKeys.insert("precisionAware");
                paramKeys.insert("diagonalVectorization");
                paramKeys.insert("heterogeneity");
                paramKeys.insert("heuristicMapping");
                paramKeys.insert("parameterizableCGRA");
                paramKeys.insert("incrementalMapping");
                paramKeys.insert("clusterSize");
                paramKeys.insert("memorySize");
                paramKeys.insert("supportMemory");

                try
                {
                    // try to access a nonexisting key
                    for (auto itr : paramKeys)
                    {
                        param.at(itr);
                    }
                }
                catch (json::out_of_range &e)
                {
                    cout << "Please include related parameter in param.json: " << e.what() << endl;
                    exit(0);
                }

                (*functionWithLoop)[param["kernel"]] = new list<int>();
                json loops = param["targetLoopsID"];
                for (int i = 0; i < loops.size(); ++i)
                {
                    // cout<<"add index "<<loops[i]<<endl;
                    (*functionWithLoop)[param["kernel"]]->push_back(loops[i]);
                }

                // Configuration for customizable CGRA.
                rows = param["row"];
                columns = param["column"];
                targetEntireFunction = param["targetFunction"];
                targetNested = param["targetNested"];
                doCGRAMapping = param["doCGRAMapping"];
                isStaticElasticCGRA = param["isStaticElasticCGRA"];
                isTrimmedDemo = param["isTrimmedDemo"];
                ctrlMemConstraint = param["ctrlMemConstraint"];
                bypassConstraint = param["bypassConstraint"];
                regConstraint = param["regConstraint"];
                precisionAware = param["precisionAware"];
                diagonalVectorization = param["diagonalVectorization"];
                heterogeneity = param["heterogeneity"];
                heuristicMapping = param["heuristicMapping"];
                parameterizableCGRA = param["parameterizableCGRA"];
                incrementalMapping = param["incrementalMapping"];
                clusterSize = param["clusterSize"];
                memorySize = param["memorySize"];
                supportMemory = param["supportMemory"];

                cout << "Initialize opt latency for DFG nodes: " << endl;
                for (auto &opt : param["optLatency"].items())
                {
                    cout << opt.key() << " : " << opt.value() << endl;
                    (*execLatency)[opt.key()] = opt.value();
                }
                json pipeOpt = param["optPipelined"];
                for (int i = 0; i < pipeOpt.size(); ++i)
                {
                    pipelinedOpt->push_back(pipeOpt[i]);
                }
                cout << "Initialize additional functionality on CGRA nodes: " << endl;
                for (auto &opt : param["additionalFunc"].items())
                {
                    (*additionalFunc)[opt.key()] = new list<int>();
                    cout << opt.key() << " : " << opt.value() << ": ";
                    for (int i = 0; i < opt.value().size(); ++i)
                    {
                        (*additionalFunc)[opt.key()]->push_back(opt.value()[i]);
                        cout << opt.value()[i] << " ";
                    }
                    cout << endl;
                }
            }

            // Check existance.
            if (functionWithLoop->find(t_F.getName().str()) == functionWithLoop->end())
            {
                cout << "[function \'" << t_F.getName().str() << "\' is not in our target list]\n";
                return false;
            }

            cout << "==================================\n";
            cout << "[function \'" << t_F.getName().str() << "\' is one of our targets]\n";

            // Generate DFG with memory information.
            list<Loop *> *innermostLoops = getInnermostLoops(t_F, functionWithLoop, targetNested);
            cout << "==================================\n";
            cout << "number of innermost loops: " << innermostLoops->size() << "\n";
            cout << "==================================\n";
            DFG *dfg2 = new DFG(innermostLoops, targetEntireFunction, precisionAware,
                                heterogeneity, execLatency, pipelinedOpt);

            // Generate DFG without memory information.
            // list<Loop *> *targetLoops = getTargetLoops(t_F, functionWithLoop, targetNested);
            // DFG *dfg = new DFG(t_F, targetLoops, targetEntireFunction, precisionAware,
            //                    heterogeneity, execLatency, pipelinedOpt);

            // Show the count of different opcodes (IRs).
            cout << "==================================\n";
            cout << "[show opcode count]\n";
            dfg2->showOpcodeDistribution();
            // dfg->showOpcodeDistribution();

            // Generate the DFG dot file.
            cout << "==================================\n";
            cout << "[generate dot for DFG]\n";
            dfg2->generateDot(t_F, isTrimmedDemo);
            // dfg->generateDot(t_F, isTrimmedDemo);

            // Generate the CGRA Architecture.
            // cout << "==================================\n";
            // cout << "[generate CGRA Architecture]\n";
            // Genetrate CGRA with cluster-based memory.
            // CGRA *cgra2 = new CGRA(rows, columns, clusterSize, memorySize, diagonalVectorization, heterogeneity,
            //                        parameterizableCGRA, additionalFunc);
            // cgra2->setRegConstraint(regConstraint);
            // cgra2->setCtrlMemConstraint(ctrlMemConstraint);
            // cgra2->setBypassConstraint(bypassConstraint);

            // Generate CGRA with conventional architecture.
            // CGRA *cgra = new CGRA(rows, columns, diagonalVectorization, heterogeneity,
            //                       parameterizableCGRA, additionalFunc);
            // cgra->setRegConstraint(regConstraint);
            // cgra->setCtrlMemConstraint(ctrlMemConstraint);
            // cgra->setBypassConstraint(bypassConstraint);

            // Generate CGRA with all supported ld/store operations.
            // CGRA *cgra3 = new CGRA(rows, columns, diagonalVectorization, heterogeneity,
            //                        parameterizableCGRA, additionalFunc, supportMemory);
            // cgra3->setRegConstraint(regConstraint);
            // cgra3->setCtrlMemConstraint(ctrlMemConstraint);
            // cgra3->setBypassConstraint(bypassConstraint);

            // Generate the MRRG dot file.
            // cout << "==================================\n";
            // cout << "[generate dot for MRRG]\n";
            // cgra2->generateMRRG(supportMemory);
            // cgra->generateMRRG(supportMemory);
            // cgra3->generateMRRG(!supportMemory);

            // // Initialize the mapper
            // mapper = new Mapper();
            // // Initialize the II.
            // int ResMII = mapper->getResMII(dfg, cgra3);
            // cout << "==================================\n";
            // cout << "[ResMII: " << ResMII << "]\n";
            // int RecMII = mapper->getRecMII(dfg);
            // cout << "==================================\n";
            // cout << "[RecMII: " << RecMII << "]\n";
            // // II = max(ResMII, RecMII)
            // int II = ResMII;
            // if (II < RecMII)
            //     II = RecMII;
            // if (!doCGRAMapping)
            // {
            //     cout << "==================================\n";
            //     return false;
            // }
            // Heuristic algorithm (hill climbing) to get a valid mapping within
            // a acceptable II.
            // bool success = false;
            // if (!isStaticElasticCGRA)
            // {
            //     cout << "==================================\n";
            //     typedef std::chrono::high_resolution_clock Clock;
            //     ofstream mappingTime("MappingTime.txt");
            //     auto t1 = Clock::now();

            //     if (heuristicMapping)
            //     {
            //         if (supportMemory)
            //         {
            //             II = mapper->heuristicMapwithMemory(cgra3, dfg, II);
            //         }
            //         else
            //         {
            //             if (incrementalMapping)
            //             {
            //                 II = mapper->incrementalMap(cgra3, dfg, II);
            //                 cout << "[Incremental]\n";
            //             }
            //             else
            //             {
            //                 cout << "[heuristic]\n";
            //                 II = mapper->heuristicMap(cgra3, dfg, II, isStaticElasticCGRA);
            //             }
            //         }
            //     }
            //     else
            //     {
            //         if (supportMemory)
            //         {
            //             cout << "[exhaustive]\n";
            //             II = mapper->exhaustiveMap(cgra3, dfg, II, isStaticElasticCGRA);
            //         }
            //         else
            //         {
            //             errs() << "Unsupport exhaustive map on CGRA with cluster-based memory.\n";
            //             return false;
            //         }
            //     }

            //     auto t2 = Clock::now();
            //     int elapsedTime = std::chrono::duration_cast<std::chrono::nanoseconds>(t2 - t1).count() / 1000000;
            //     mappingTime << "Mapping algorithm elapsed time=" << elapsedTime << "ms" << '\n';
            // }

            // Partially exhaustive search to try to map the DFG onto
            // the static elastic CGRA.

            // if (isStaticElasticCGRA and !success)
            // {
            //     cout << "==================================\n";
            //     cout << "[exhaustive]\n";
            //     II = mapper->exhaustiveMap(cgra3, dfg, II, isStaticElasticCGRA);
            // }

            // // Show the mapping and routing results with JSON output.
            // if (II == -1)
            //     cout << "[fail]\n";
            // else
            // {
            //     mapper->showSchedule(cgra3, dfg, II, isStaticElasticCGRA, parameterizableCGRA);
            //     cout << "==================================\n";
            //     cout << "[Mapping Success]\n";
            //     cout << "==================================\n";
            //     mapper->generateJSON(cgra3, dfg, II, isStaticElasticCGRA);
            //     cout << "[Output Json]\n";

            //     // // save mapping results json file for possible incremental mapping
            //     // if (!incrementalMapping)
            //     // {
            //     //     mapper->generateJSON4IncrementalMap(cgra3, dfg);
            //     //     cout << "[Output Json for Incremental Mapping]\n";
            //     // }
            // }
            // cout << "==================================" << endl;

            // return false;
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
                        errs() << "Innermost loop detected: " << current_loop->getName() << "\n";
                        continue;
                    }
                    else
                    {
                        nestedLoops->push_back(current_loop);
                        errs() << "Nested loop detected: " << current_loop->getName() << "\n";
                    }

                    while (!nestedLoops->empty())
                    {
                        for (Loop *subloop : nestedLoops->front()->getSubLoops())
                        {
                            if (subloop->getSubLoops().empty())
                            {
                                innermostLoops->push_back(subloop);
                                errs() << "Innermost loop detected: " << subloop->getName() << "\n";
                            }
                            else
                            {
                                nestedLoops->push_back(subloop);
                                errs() << "Nested loop detected: " << subloop->getName() << "\n";
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

    // For Array_add:
    (*t_functionWithLoop)["_Z6kernelv"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelv"]->push_back(0);

    // For Polybench:
    (*t_functionWithLoop)["_Z6kernelPfS_S_S_S_"] = new list<int>();
    (*t_functionWithLoop)["_Z6kernelPfS_S_S_S_"]->push_back(0);

    // nested
    // (*t_functionWithLoop)["_Z6kernelPfS_S_"] = new list<int>();
    // (*t_functionWithLoop)["_Z6kernelPfS_S_"]->push_back(0);
}