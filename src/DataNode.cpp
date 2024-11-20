/*
 * ======================================================================
 * DataNode.cpp
 * ======================================================================
 * DataNode node implementation.
 *
 * Author : Shangkun LI
 *   Date : Oct 31, 2024
 */

#include "DataNode.h"

DataNode::DataNode(int t_id, bool t_precisionAware, Value *t_operand,
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
    this->setParentNode(NULL);
    initType();
}

void DataNode::initType()
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

void DataNode::setSize(int t_size)
{
    m_size = t_size;
}

int DataNode::getSize()
{
    return m_size;
}

void DataNode::setMemType(Type *t_memtype)
{
    m_memtype = t_memtype;
}

Type *DataNode::getMemType()
{
    return m_memtype;
}

DFGNode *DataNode::getParentNode()
{
    return m_ParentNode;
}

void DataNode::setParentNode(DFGNode *t_ParentNode)
{
    m_ParentNode = t_ParentNode;
}