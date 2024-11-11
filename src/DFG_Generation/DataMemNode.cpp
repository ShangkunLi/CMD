/*
 * ======================================================================
 * DataMemNode.cpp
 * ======================================================================
 * DataMemNode node implementation.
 *
 * Author : Shangkun LI
 *   Date : Oct 31, 2024
 */

#include "DataMemNode.h"

DataMemNode::DataMemNode(int t_id, bool t_precisionAware, Value *t_operand,
                         StringRef t_stringRef)
    : DFGNode() // Call the base class constructor
{
    setID(t_id);
    setPrecisionAware(t_precisionAware);
    setValue(t_operand);
    setSringRef(t_stringRef);
    initPredNodes();
    initSuccNodes();
    setOpcodeName("datamem");
    setMapped(false);
    setConst(0);
    setCombine(false);
    setIsPatternRoot(false);
    initPatternRoot();
    setCritical(false);
    //m_cycleID = new list<int>();
    setLevel(0);
    setExecLatency(1);
    setPipelinable(false);
    setIsPredicatee(false);
    setIsPredicater(false);
    initPredicatees();
    initPatternNodes();
    initType();
}

void DataMemNode::initType()
{
    if (getOpcodeName().compare("datamem") == 0)
    {
        setOptType("OPT_DataMem");
        setFuType("MemUnit");
    }
    else
    {
        setOptType("Unfamiliar: " + getOpcodeName());
        setFuType("Unknown");
    }
}