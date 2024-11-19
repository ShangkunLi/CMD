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
                         StringRef t_stringRef, int t_size, Type *t_memtype)
    : DFGNode() // Call the base class constructor
{
    this->setID(t_id);
    this->setPrecisionAware(t_precisionAware);
    this->setValue(t_operand);
    this->setInst(NULL);
    this->setSringRef(t_stringRef);
    this->initPredNodes();
    this->initSuccNodes();
    this->setOpcodeName("datamem");
    this->setMapped(false);
    this->setConst(0);
    this->setCombine(false);
    this->setIsPatternRoot(false);
    this->initPatternRoot();
    this->setCritical(false);
    // m_cycleID = new list<int>();
    this->setLevel(0);
    this->setExecLatency(1);
    this->setPipelinable(false);
    this->setIsPredicatee(false);
    this->setIsPredicater(false);
    this->initPredicatees();
    this->initPatternNodes();
    this->setSize(t_size);
    this->setMemType(t_memtype);
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

void DataMemNode::setSize(int t_size)
{
    m_size = t_size;
}

int DataMemNode::getSize()
{
    return m_size;
}

void DataMemNode::setMemType(Type *t_memtype)
{
    m_memtype = t_memtype;
}

Type *DataMemNode::getMemType()
{
    return m_memtype;
}