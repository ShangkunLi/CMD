/*
 * ======================================================================
 * CGRA.cpp
 * ======================================================================
 * CGRA implementation.
 *
 * Author : Cheng Tan
 *   Date : Jan 9, 2023
 */

#include <fstream>
#include "CGRA.h"
#include "json.hpp"

using json = nlohmann::json;

CGRA::CGRA(int t_rows, int t_columns, bool t_diagonalVectorization,
           bool t_heterogeneity, bool t_parameterizableCGRA,
           map<string, list<int> *> *t_additionalFunc)
{
  m_rows = t_rows;
  m_columns = t_columns;
  m_FUCount = t_rows * t_columns;
  nodes = new CGRANode **[t_rows];

  if (t_parameterizableCGRA)
  {

    int node_id = 0;
    map<int, CGRANode *> id2Node;
    for (int i = 0; i < t_rows; ++i)
    {
      nodes[i] = new CGRANode *[t_columns];
      for (int j = 0; j < t_columns; ++j)
      {
        nodes[i][j] = new CGRANode(node_id, j, i);
        // nodes[i][j]->disableAllFUs();
        id2Node[node_id] = nodes[i][j];
        node_id += 1;
      }
    }

    ifstream paramCGRA("./paramCGRA.json");
    if (!paramCGRA.good())
    {
      cout << "Parameterizable CGRA design/mapping requires paramCGRA.json" << endl;
      return;
    }
    json param;
    paramCGRA >> param;

    int numOfNodes = t_rows * t_columns;
    for (int nodeID = 0; nodeID < numOfNodes; ++nodeID)
    {
      bool disabled = param["tiles"][to_string(nodeID)]["disabled"];
      if (disabled)
      {
        id2Node[nodeID]->disable();
      }
      else
      {
        bool supportAllFUs = param["tiles"][to_string(nodeID)]["supportAllFUs"];
        if (!supportAllFUs)
        {
          id2Node[nodeID]->disableAllFUs();
        }
        if (param["tiles"][to_string(nodeID)].contains("accessMem"))
        {
          if (param["tiles"][to_string(nodeID)]["accessMem"])
          {
            id2Node[nodeID]->enableLoad();
            id2Node[nodeID]->enableStore();
          }
        }

        // TODO: need to take care of supportedFUs:
        //
      }
    }

    json paramLinks = param["links"];
    m_LinkCount = paramLinks.size();
    links = new CGRALink *[m_LinkCount];

    for (int linkID = 0; linkID < paramLinks.size(); ++linkID)
    {
      int srcNodeID = paramLinks[linkID]["srcTile"];
      int dstNodeID = paramLinks[linkID]["dstTile"];

      links[linkID] = new CGRALink(linkID);
      id2Node[srcNodeID]->attachOutLink(links[linkID]);
      id2Node[dstNodeID]->attachInLink(links[linkID]);
      links[linkID]->connect(id2Node[srcNodeID], id2Node[dstNodeID]);
    }

    // need to perform disable() again, as it will disable the related links
    for (int nodeID = 0; nodeID < numOfNodes; ++nodeID)
    {
      bool disabled = param["tiles"][to_string(nodeID)]["disabled"];
      if (disabled)
      {
        id2Node[nodeID]->disable();
      }
    }
  }
  else
  {

    int node_id = 0;
    for (int i = 0; i < t_rows; ++i)
    {
      nodes[i] = new CGRANode *[t_columns];
      for (int j = 0; j < t_columns; ++j)
      {
        nodes[i][j] = new CGRANode(node_id++, j, i);
      }
    }

    m_LinkCount = 2 * (t_rows * (t_columns - 1) + (t_rows - 1) * t_columns);
    links = new CGRALink *[m_LinkCount];

    // Enable the load/store on specific CGRA nodes based on param.json.
    int loadCount = 0;
    int storeCount = 0;
    for (map<string, list<int> *>::iterator iter = t_additionalFunc->begin();
         iter != t_additionalFunc->end(); ++iter)
    {
      for (int nodeIndex : *(iter->second))
      {
        if (nodeIndex >= m_FUCount)
        {
          cout << "\033[0;31mInvalid CGRA node ID " << nodeIndex << " for operation " << iter->first << "\033[0m" << endl;
          continue;
        }
        else
        {
          int row = nodeIndex / m_columns;
          int col = nodeIndex % m_columns;
          bool canEnable = nodes[row][col]->enableFunctionality(iter->first);
          if (!canEnable)
          {
            cout << "\033[0;31mInvalid operation " << iter->first << " on CGRA node ID " << nodeIndex << "\033[0m" << endl;
          }
          else
          {
            if ((iter->first).compare("store") == 0)
            {
              storeCount += 1;
              errs() << "Add store functionality on CGRA node " << nodeIndex << "\n";
            }
            if ((iter->first).compare("load") == 0)
            {
              loadCount += 1;
              errs() << "Add load functionality on CGRA node " << nodeIndex << "\n";
            }
          }
        }
      }
    }
    if (storeCount == 0)
    {
      cout << "Without customization in param.json, we enable store functionality on the left most column." << endl;
      for (int r = 0; r < t_rows; ++r)
      {
        nodes[r][0]->enableStore();
      }
    }
    if (loadCount == 0)
    {
      cout << "Without customization in param.json, we enable load functionality on the left most column." << endl;
      for (int r = 0; r < t_rows; ++r)
      {
        nodes[r][0]->enableLoad();
      }
    }

    // Some other basic operations that can be indicated in the param.json:
    // Enable the specialized 'call' functionality.
    for (int r = 0; r < t_rows; ++r)
    {
      for (int c = 0; c < t_columns; ++c)
      {
        nodes[r][c]->enableCall();
      }
    }

    // Enable the vectorization.
    if (t_diagonalVectorization)
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          if ((r + c) % 2 == 0)
            nodes[r][c]->enableVectorization();
        }
      }
    }
    else
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableVectorization();
        }
      }
    }

    // Enable the heterogeneity.
    if (t_heterogeneity)
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          if (r % 2 == 1 and c % 2 == 1)
            nodes[r][c]->enableComplex();
        }
      }
    }

    for (int r = 0; r < t_rows; ++r)
    {
      for (int c = 0; c < t_columns; ++c)
      {
        nodes[r][c]->enableReturn();
      }
    }

    // Connect the CGRA nodes with links.
    int link_id = 0;
    for (int i = 0; i < t_rows; ++i)
    {
      for (int j = 0; j < t_columns; ++j)
      {
        if (i < t_rows - 1)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i + 1][j]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i + 1][j]);
          ++link_id;
        }
        if (i > 0)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i - 1][j]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i - 1][j]);
          ++link_id;
        }
        if (j < t_columns - 1)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i][j + 1]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i][j + 1]);
          ++link_id;
        }
        if (j > 0)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i][j - 1]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i][j - 1]);
          ++link_id;
        }
      }
    }

    disableSpecificConnections();
  }

  /*
    cout<<"[connection] horizontal and vertical."<<endl;
    // Connect the CGRA nodes with diagonal links.
    for (int i=0; i<t_rows-1; ++i) {
      for (int j=0; j<t_columns-1; ++j) {
        link = new CGRALink();
        nodes[i][j]->attachOutLink(link, _RIGHT_UP);
        nodes[i+1][j+1]->attachInLink(link, _LEFT_DOWN);
        link->connect(nodes[i][j], nodes[i+1][j+1]);
        m_links.push_back(link);

        link = new CGRALink();
        nodes[i+1][j+1]->attachOutLink(link, _LEFT_DOWN);
        nodes[i][j]->attachInLink(link, _RIGHT_UP);
        link->connect(nodes[i+1][j+1], nodes[i][j]);
        m_links.push_back(link);

        link = new CGRALink();
        nodes[i][j+1]->attachOutLink(link, _RIGHT_DOWN);
        nodes[i+1][j]->attachInLink(link, _LEFT_UP);
        link->connect(nodes[i][j+1], nodes[i+1][j]);
        m_links.push_back(link);

        link = new CGRALink();
        nodes[i+1][j]->attachOutLink(link, _LEFT_UP);
        nodes[i][j+1]->attachInLink(link, _RIGHT_DOWN);
        link->connect(nodes[i+1][j], nodes[i][j+1]);
        m_links.push_back(link);
      }
    }
    cout<<"[connection] diagonal."<<endl;
  */
}

// This construct function is used for CGAR demo with infinite size of memory.
CGRA::CGRA(int t_rows, int t_columns, bool t_diagonalVectorization,
           bool t_heterogeneity, bool t_parameterizableCGRA,
           map<string, list<int> *> *t_additionalFunc, bool t_supportMemory)
{
  if (t_supportMemory)
  {
    m_rows = t_rows;
    m_columns = t_columns;
    m_FUCount = t_rows * t_columns;
    nodes = new CGRANode **[t_rows];

    if (t_parameterizableCGRA)
    {

      // int node_id = 0;
      // map<int, CGRANode *> id2Node;
      // for (int i = 0; i < t_rows; ++i)
      // {
      //   nodes[i] = new CGRANode *[t_columns];
      //   for (int j = 0; j < t_columns; ++j)
      //   {
      //     nodes[i][j] = new CGRANode(node_id, j, i);
      //     // nodes[i][j]->disableAllFUs();
      //     id2Node[node_id] = nodes[i][j];
      //     node_id += 1;
      //   }
      // }

      // ifstream paramCGRA("./paramCGRA.json");
      // if (!paramCGRA.good())
      // {
      //   cout << "Parameterizable CGRA design/mapping requires paramCGRA.json" << endl;
      //   return;
      // }
      // json param;
      // paramCGRA >> param;

      // int numOfNodes = t_rows * t_columns;
      // for (int nodeID = 0; nodeID < numOfNodes; ++nodeID)
      // {
      //   bool disabled = param["tiles"][to_string(nodeID)]["disabled"];
      //   if (disabled)
      //   {
      //     id2Node[nodeID]->disable();
      //   }
      //   else
      //   {
      //     bool supportAllFUs = param["tiles"][to_string(nodeID)]["supportAllFUs"];
      //     if (!supportAllFUs)
      //     {
      //       id2Node[nodeID]->disableAllFUs();
      //     }
      //     if (param["tiles"][to_string(nodeID)].contains("accessMem"))
      //     {
      //       if (param["tiles"][to_string(nodeID)]["accessMem"])
      //       {
      //         id2Node[nodeID]->enableLoad();
      //         id2Node[nodeID]->enableStore();
      //       }
      //     }

      //     // TODO: need to take care of supportedFUs:
      //     //
      //   }
      // }

      // json paramLinks = param["links"];
      // m_LinkCount = paramLinks.size();
      // links = new CGRALink *[m_LinkCount];

      // for (int linkID = 0; linkID < paramLinks.size(); ++linkID)
      // {
      //   int srcNodeID = paramLinks[linkID]["srcTile"];
      //   int dstNodeID = paramLinks[linkID]["dstTile"];

      //   links[linkID] = new CGRALink(linkID);
      //   id2Node[srcNodeID]->attachOutLink(links[linkID]);
      //   id2Node[dstNodeID]->attachInLink(links[linkID]);
      //   links[linkID]->connect(id2Node[srcNodeID], id2Node[dstNodeID]);
      // }

      // // need to perform disable() again, as it will disable the related links
      // for (int nodeID = 0; nodeID < numOfNodes; ++nodeID)
      // {
      //   bool disabled = param["tiles"][to_string(nodeID)]["disabled"];
      //   if (disabled)
      //   {
      //     id2Node[nodeID]->disable();
      //   }
      // }
      // TODO: support parameterizable CGRA with cluster-based memory
      errs() << " Unable to support parameterizable CGRA with cluster-based memory for now." << "\n";
    }
    else
    {

      int node_id = 0;
      for (int i = 0; i < t_rows; ++i)
      {
        nodes[i] = new CGRANode *[t_columns];
        for (int j = 0; j < t_columns; ++j)
        {
          nodes[i][j] = new CGRANode(node_id++, j, i);
        }
      }

      m_LinkCount = 2 * (t_rows * (t_columns - 1) + (t_rows - 1) * t_columns);
      links = new CGRALink *[m_LinkCount];

      // Enable the load/store on specific CGRA nodes based on param.json.
      int loadCount = 0;
      int storeCount = 0;
      for (map<string, list<int> *>::iterator iter = t_additionalFunc->begin();
           iter != t_additionalFunc->end(); ++iter)
      {
        for (int nodeIndex : *(iter->second))
        {
          if (nodeIndex >= m_FUCount)
          {
            cout << "\033[0;31mInvalid CGRA node ID " << nodeIndex << " for operation " << iter->first << "\033[0m" << endl;
            continue;
          }
          else
          {
            int row = nodeIndex / m_columns;
            int col = nodeIndex % m_columns;
            bool canEnable = nodes[row][col]->enableFunctionality(iter->first);
            if (!canEnable)
            {
              cout << "\033[0;31mInvalid operation " << iter->first << " on CGRA node ID " << nodeIndex << "\033[0m" << endl;
            }
            else
            {
              if ((iter->first).compare("store") == 0)
              {
                storeCount += 1;
                errs() << "Add store functionality on CGRA node " << nodeIndex << "\n";
              }
              if ((iter->first).compare("load") == 0)
              {
                loadCount += 1;
                errs() << "Add load functionality on CGRA node " << nodeIndex << "\n";
              }
            }
          }
        }
      }
      if (storeCount == 0 || loadCount == 0)
      {
        cout << "Without customization in param.json, we enable store/load functionality on all FUs." << endl;
        for (int r = 0; r < t_rows; ++r)
        {
          for (int c = 0; c < t_columns; ++c)
          {
            nodes[r][c]->enableStore();
            nodes[r][c]->enableLoad();
          }
        }
      }

      // Some other basic operations that can be indicated in the param.json:
      // Enable the specialized 'call' functionality.
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableCall();
        }
      }

      // Enable the vectorization.
      if (t_diagonalVectorization)
      {
        for (int r = 0; r < t_rows; ++r)
        {
          for (int c = 0; c < t_columns; ++c)
          {
            if ((r + c) % 2 == 0)
              nodes[r][c]->enableVectorization();
          }
        }
      }
      else
      {
        for (int r = 0; r < t_rows; ++r)
        {
          for (int c = 0; c < t_columns; ++c)
          {
            nodes[r][c]->enableVectorization();
          }
        }
      }

      // Enable the heterogeneity.
      if (t_heterogeneity)
      {
        for (int r = 0; r < t_rows; ++r)
        {
          for (int c = 0; c < t_columns; ++c)
          {
            if (r % 2 == 1 and c % 2 == 1)
              nodes[r][c]->enableComplex();
          }
        }
      }

      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableReturn();
        }
      }

      // Connect the CGRA nodes with links.
      int link_id = 0;
      for (int i = 0; i < t_rows; ++i)
      {
        for (int j = 0; j < t_columns; ++j)
        {
          if (i < t_rows - 1)
          {
            links[link_id] = new CGRALink(link_id);
            nodes[i][j]->attachOutLink(links[link_id]);
            nodes[i + 1][j]->attachInLink(links[link_id]);
            links[link_id]->connect(nodes[i][j], nodes[i + 1][j]);
            ++link_id;
          }
          if (i > 0)
          {
            links[link_id] = new CGRALink(link_id);
            nodes[i][j]->attachOutLink(links[link_id]);
            nodes[i - 1][j]->attachInLink(links[link_id]);
            links[link_id]->connect(nodes[i][j], nodes[i - 1][j]);
            ++link_id;
          }
          if (j < t_columns - 1)
          {
            links[link_id] = new CGRALink(link_id);
            nodes[i][j]->attachOutLink(links[link_id]);
            nodes[i][j + 1]->attachInLink(links[link_id]);
            links[link_id]->connect(nodes[i][j], nodes[i][j + 1]);
            ++link_id;
          }
          if (j > 0)
          {
            links[link_id] = new CGRALink(link_id);
            nodes[i][j]->attachOutLink(links[link_id]);
            nodes[i][j - 1]->attachInLink(links[link_id]);
            links[link_id]->connect(nodes[i][j], nodes[i][j - 1]);
            ++link_id;
          }
        }
      }

      disableSpecificConnections();
    }

    /*
      cout<<"[connection] horizontal and vertical."<<endl;
      // Connect the CGRA nodes with diagonal links.
      for (int i=0; i<t_rows-1; ++i) {
        for (int j=0; j<t_columns-1; ++j) {
          link = new CGRALink();
          nodes[i][j]->attachOutLink(link, _RIGHT_UP);
          nodes[i+1][j+1]->attachInLink(link, _LEFT_DOWN);
          link->connect(nodes[i][j], nodes[i+1][j+1]);
          m_links.push_back(link);

          link = new CGRALink();
          nodes[i+1][j+1]->attachOutLink(link, _LEFT_DOWN);
          nodes[i][j]->attachInLink(link, _RIGHT_UP);
          link->connect(nodes[i+1][j+1], nodes[i][j]);
          m_links.push_back(link);

          link = new CGRALink();
          nodes[i][j+1]->attachOutLink(link, _RIGHT_DOWN);
          nodes[i+1][j]->attachInLink(link, _LEFT_UP);
          link->connect(nodes[i][j+1], nodes[i+1][j]);
          m_links.push_back(link);

          link = new CGRALink();
          nodes[i+1][j]->attachOutLink(link, _LEFT_UP);
          nodes[i][j+1]->attachInLink(link, _RIGHT_DOWN);
          link->connect(nodes[i+1][j], nodes[i][j+1]);
          m_links.push_back(link);
        }
      }
      cout<<"[connection] diagonal."<<endl;
    */
  }
  else
  {
    errs() << "Unable to Generate CGRA without memory.\n";
  }
}

// Generate CGRA with distributed memory.
CGRA::CGRA(int t_rows, int t_columns, int t_cgraClusterSize, int t_memorySize, bool t_diagonalVectorization,
           bool t_heterogeneity, bool t_parameterizableCGRA,
           map<string, list<int> *> *t_additionalFunc)
{
  this->m_rows = t_rows;
  this->m_columns = t_columns;
  this->m_FUCount = t_rows * t_columns;
  this->m_clusterSize = t_cgraClusterSize;
  this->m_MemCount = t_rows * t_columns / t_cgraClusterSize;
  if (((t_rows * t_columns) % t_cgraClusterSize != 0))
  {
    errs() << "The number of CGRA nodes should be a multiple of the cluster size.\n";
    return;
  }
  this->nodes = new CGRANode **[t_rows];

  if (t_parameterizableCGRA)
  {
    errs() << "Parameterizable CGRA with distributed memory is not supported yet.\n";
    return;
  }
  else
  {
    errs() << "Generate CGRA with distributed memory in default setting.\n";
    int FU_id = 0;

    // Create CGRA PE nodes
    errs() << "----------------\n";
    errs() << "Create CGRA PE nodes\n";
    for (int i = 0; i < t_rows; ++i)
    {
      this->nodes[i] = new CGRANode *[t_columns];
      for (int j = 0; j < t_columns; ++j)
      {
        this->nodes[i][j] = new CGRANode(FU_id++, j, i);
      }
    }

    // Print out all the PE nodes generated
    for (int i = 0; i < t_rows; ++i)
    {
      for (int j = 0; j < t_columns; ++j)
      {
        errs() << "PE Node ID: " << nodes[i][j]->getID() << " at (row: " << i << ", col: " << j << ")\n";
      }
    }

    errs() << "----------------\n";
    errs() << "Create CGRA memory nodes\n";
    this->createMemNodes(t_memorySize);
    // Print out all the memory nodes generated
    // for (auto const &memNode : MemNodes)
    // {
    //   errs() << "Memory Node ID: " << memNode.first << " at (row: " << memNode.second->getY() << ", col: " << memNode.second->getX() << ")\n";
    // }

    this->m_LinkCount = 2 * (t_rows * (t_columns - 1) + (t_rows - 1) * t_columns);
    this->links = new CGRALink *[m_LinkCount];

    // Enable the load/store on specific CGRA nodes based on cgra cluster
    int loadCount = 0;
    int storeCount = 0;
    if (loadCount == 0)
    {
      errs() << "Without customization in param.json, we enable load functionality on all cgra tiles\n";
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableLoad();
        }
      }
    }
    if (storeCount == 0)
    {
      cout << "Without customization in param.json, we enable store functionality on all cgra tiles\n"
           << endl;
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableStore();
        }
      }
    }

    // Some other basic operations that can be indicated in the param.json:
    // Enable the specialized 'call' functionality.
    for (int r = 0; r < t_rows; ++r)
    {
      for (int c = 0; c < t_columns; ++c)
      {
        nodes[r][c]->enableCall();
      }
    }

    // Enable the vectorization.
    if (t_diagonalVectorization)
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          if ((r + c) % 2 == 0)
            nodes[r][c]->enableVectorization();
        }
      }
    }
    else
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          nodes[r][c]->enableVectorization();
        }
      }
    }

    // Enable the heterogeneity.
    if (t_heterogeneity)
    {
      for (int r = 0; r < t_rows; ++r)
      {
        for (int c = 0; c < t_columns; ++c)
        {
          if (r % 2 == 1 and c % 2 == 1)
            nodes[r][c]->enableComplex();
        }
      }
    }

    for (int r = 0; r < t_rows; ++r)
    {
      for (int c = 0; c < t_columns; ++c)
      {
        nodes[r][c]->enableReturn();
      }
    }

    // Connect the CGRA nodes with links.
    int link_id = 0;
    for (int i = 0; i < t_rows; ++i)
    {
      for (int j = 0; j < t_columns; ++j)
      {
        if (i < t_rows - 1)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i + 1][j]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i + 1][j]);
          ++link_id;
        }
        if (i > 0)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i - 1][j]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i - 1][j]);
          ++link_id;
        }
        if (j < t_columns - 1)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i][j + 1]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i][j + 1]);
          ++link_id;
        }
        if (j > 0)
        {
          links[link_id] = new CGRALink(link_id);
          nodes[i][j]->attachOutLink(links[link_id]);
          nodes[i][j - 1]->attachInLink(links[link_id]);
          links[link_id]->connect(nodes[i][j], nodes[i][j - 1]);
          ++link_id;
        }
        for (map<int, CGRAMem *>::iterator memnode = MemNodes.begin(); memnode != MemNodes.end(); ++memnode)
        {
          if (memnode->second->isInCluster(nodes[i][j]))
          {
            // links[link_id] = new CGRALink(link_id);
            // nodes[i][j]->attachOutLink(links[link_id]);
            // memnode->second->attachInLink(links[link_id]);
            // links[link_id]->connect(nodes[i][j], memnode->second);
            // ++link_id;
            // links[link_id] = new CGRALink(link_id);
            // memnode->second->attachOutLink(links[link_id]);
            // nodes[i][j]->attachInLink(links[link_id]);
            // links[link_id]->connect(memnode->second, nodes[i][j]);
            // ++link_id;
            nodes[i][j]->setClusterId(memnode->first);
          }
        }
      }
    }
    errs() << "link id: " << link_id << "\n";
    errs() << "m_LinkCount: " << this->m_LinkCount << "\n";

    disableSpecificConnections();
  }
}

void CGRA::disableSpecificConnections()
{
  //  nodes[0][0]->disable();
  //  nodes[0][1]->disable();
  //  nodes[0][2]->disable();
  //  nodes[0][3]->disable();
  //  nodes[0][4]->disable();
  //  nodes[1][0]->disable();
  //  nodes[1][1]->disable();
  //  nodes[1][2]->disable();
  //  nodes[1][4]->disable();
  //  nodes[1][3]->disable();
  //  nodes[2][0]->disable();
  //  nodes[2][1]->disable();
  //  nodes[2][2]->disable();
  //  nodes[2][3]->disable();
  //  nodes[2][4]->disable();
  //  nodes[3][1]->disable();
  //  nodes[3][2]->disable();
  //  nodes[3][2]->disable();
  //  nodes[3][3]->disable();
  //  nodes[3][4]->disable();
  //  nodes[4][1]->disable();
  //  nodes[4][2]->disable();
  //  nodes[4][3]->disable();
  //  nodes[4][4]->disable();
}

void CGRA::setRegConstraint(int t_regConstraint)
{
  for (int i = 0; i < m_rows; ++i)
    for (int j = 0; j < m_columns; ++j)
      nodes[i][j]->setRegConstraint(t_regConstraint);
}

void CGRA::setBypassConstraint(int t_bypassConstraint)
{
  for (int i = 0; i < m_LinkCount; ++i)
    links[i]->setBypassConstraint(t_bypassConstraint);
}

void CGRA::setCtrlMemConstraint(int t_ctrlMemConstraint)
{
  for (int i = 0; i < m_rows; ++i)
    for (int j = 0; j < m_columns; ++j)
      nodes[i][j]->setCtrlMemConstraint(t_ctrlMemConstraint);

  for (int i = 0; i < m_LinkCount; ++i)
    links[i]->setCtrlMemConstraint(t_ctrlMemConstraint);
}

void CGRA::constructMRRG(int t_II)
{
  for (int i = 0; i < m_rows; ++i)
    for (int j = 0; j < m_columns; ++j)
      nodes[i][j]->constructMRRG(m_FUCount, t_II);
  for (map<int, CGRAMem *>::iterator mem = MemNodes.begin(); mem != MemNodes.end(); mem++)
    mem->second->constructMRRG();
  for (int i = 0; i < m_LinkCount; ++i)
    links[i]->constructMRRG(m_FUCount, t_II);
}

CGRALink *CGRA::getLink(CGRANode *t_n1, CGRANode *t_n2)
{
  for (int i = 0; i < m_LinkCount; ++i)
  {
    if (links[i]->getSrc() == t_n1 and links[i]->getDst() == t_n2)
    {
      return links[i];
    }
  }

  // cout << "bad query for CGRA link\n";
  return NULL;
}

void CGRA::generateMRRG(bool t_supportMemory)
{
  // Generate MRRG in json format
  json jsonFile;
  // Add nodes to the json file
  for (int i = 0; i < this->m_rows; ++i)
  {
    for (int j = 0; j < this->m_columns; ++j)
    {
      json node;
      node["id"] = this->nodes[i][j]->getID();
      node["x coordinate"] = this->nodes[i][j]->getX();
      node["y coordinate"] = this->nodes[i][j]->getY();
      if (!nodes[i][j]->getIsMem())
      {
        node["node type"] = "PE";
      }
      else
      {
        errs() << "There should not be any memory nodes in the nodes.\n";
        return;
      }
      if (t_supportMemory)
      {
        node["cluster id"] = nodes[i][j]->getClusterId();
      }
      json suppotedFUs;
      if (nodes[i][j]->canReturn())
        suppotedFUs.push_back("return");
      if (nodes[i][j]->canCall())
        suppotedFUs.push_back("call");
      if (nodes[i][j]->canLoad())
        suppotedFUs.push_back("load");
      if (nodes[i][j]->canStore())
        suppotedFUs.push_back("store");
      if (nodes[i][j]->canAdd())
        suppotedFUs.push_back("add");
      if (nodes[i][j]->canBr())
        suppotedFUs.push_back("br");
      if (nodes[i][j]->canCmp())
        suppotedFUs.push_back("cmp");
      if (nodes[i][j]->canMul())
        suppotedFUs.push_back("mul");
      if (nodes[i][j]->canPhi())
        suppotedFUs.push_back("phi");
      if (nodes[i][j]->canSel())
        suppotedFUs.push_back("sel");
      if (nodes[i][j]->canMAC())
        suppotedFUs.push_back("mac");
      if (nodes[i][j]->canLogic())
        suppotedFUs.push_back("logic");
      if (nodes[i][j]->canShift())
        suppotedFUs.push_back("shift");

      node["supported FUs"] = suppotedFUs;
      node["vectorization"] = nodes[i][j]->supportVectorization();
      node["complex"] = nodes[i][j]->supportComplex();
      jsonFile["PE Nodes"].push_back(node);
    }
  }
  if (t_supportMemory)
  {
    for (map<int, CGRAMem *>::iterator mem = MemNodes.begin(); mem != MemNodes.end(); mem++)
    {
      json memnode;
      memnode["id"] = mem->first;
      if (mem->second->getIsMem())
      {
        memnode["node type"] = "Mem";
      }
      else
      {
        errs() << "There should not be any PE nodes in the memory nodes.\n";
        return;
      }
      memnode["cluster id"] = mem->first;
      memnode["memory size"] = mem->second->getMemorySize();
      memnode["x coordinate"] = mem->second->getX();
      memnode["y coordinate"] = mem->second->getY();
      json cluster;
      for (CGRANode *node : (mem->second->getCluster()))
      {
        cluster.push_back(node->getID());
      }
      memnode["cluster"] = cluster;
      jsonFile["Mem Nodes"].push_back(memnode);
    }
  }

  // Add links to the json file
  for (int i = 0; i < m_LinkCount; ++i)
  {
    json link;
    link["id"] = links[i]->getID();
    if (links[i]->getSrc()->getIsMem())
    {
      link["src type"] = "Mem";
    }
    else
    {
      link["src type"] = "PE";
    }
    if (links[i]->getDst()->getIsMem())
    {
      link["dst type"] = "Mem";
    }
    else
    {
      link["dst type"] = "PE";
    }
    link["src"] = links[i]->getSrc()->getID();
    link["dst"] = links[i]->getDst()->getID();
    jsonFile["links"].push_back(link);
  }

  std::ofstream outFile("mrrg.json");
  outFile << jsonFile.dump(4);
  outFile.close();
}

void CGRA::createMemNodes(int t_memorySize)
{
  list<CGRANode *> *singleCluster = new list<CGRANode *>();
  int mem_id = 0;

  errs() << "cluster size: " << this->m_clusterSize << "\n";
  errs() << "----------------\n";

  if (this->m_clusterSize == 1)
  {
    mem_id = 0;
    for (int i = 0; i < this->m_rows; ++i)
    {
      for (int j = 0; j < this->m_columns; ++j)
      {
        CGRAMem *memNode = new CGRAMem(mem_id, j, i, t_memorySize);
        this->MemNodes[mem_id] = memNode;
        memNode->addNodeToCluster(this->nodes[i][j]);
        mem_id++;
        errs() << "Memory Node ID: " << memNode->getID() << " at (row: " << memNode->getY() << ", col: " << memNode->getX() << ")\n";
      }
    }
  }
  else if (this->m_clusterSize == 2)
  {
    mem_id = 0;
    singleCluster->clear();
    for (int j = 0; j < this->m_columns; j += 2)
    {
      for (int i = 0; i < this->m_rows; ++i)
      {
        singleCluster->clear();
        if (j + 1 < this->m_columns)
        {
          singleCluster->push_back(this->nodes[i][j]);
          singleCluster->push_back(this->nodes[i][j + 1]);
        }
        else
        {
          errs() << "The number of CGRA nodes should be a multiple of the cluster size.\n";
        }
        CGRAMem *memNode = new CGRAMem(mem_id, j, i, t_memorySize);
        this->MemNodes[mem_id] = memNode;
        for (CGRANode *node : *singleCluster)
        {
          memNode->addNodeToCluster(node);
        }
        mem_id++;
      }
    }
  }
  else if (this->m_clusterSize == 4)
  {
    singleCluster->clear();
    mem_id = 0;
    for (int i = 0; i < this->m_rows; i += 2)
    {
      for (int j = 0; j < this->m_columns; j += 2)
      {
        singleCluster->clear();
        if (i + 1 < this->m_rows && j + 1 < this->m_columns)
        {
          singleCluster->push_back(this->nodes[i][j]);
          singleCluster->push_back(this->nodes[i][j + 1]);
          singleCluster->push_back(this->nodes[i + 1][j]);
          singleCluster->push_back(this->nodes[i + 1][j + 1]);
        }
        else
        {
          errs() << "The number of CGRA nodes should be a multiple of the cluster size.\n";
        }
        CGRAMem *memNode = new CGRAMem(mem_id, j, i, t_memorySize);
        this->MemNodes[mem_id] = memNode;
        for (CGRANode *node : *singleCluster)
        {
          memNode->addNodeToCluster(node);
        }
        mem_id++;
      }
    }
  }
  else if (this->m_clusterSize == 6)
  {
    if (this->m_rows % 3 != 0 || this->m_columns % 2 != 0)
    {
      errs() << "The number of CGRA nodes should be a multiple of the cluster size.\n";
      return;
    }
    singleCluster->clear();
    mem_id = 0;
    for (int i = 0; i < this->m_rows; i += 3)
    {
      for (int j = 0; j < this->m_columns; j += 2)
      {
        singleCluster->clear();
        if (i + 2 < this->m_rows && j + 1 < this->m_columns)
        {
          singleCluster->push_back(this->nodes[i][j]);
          singleCluster->push_back(this->nodes[i][j + 1]);
          singleCluster->push_back(this->nodes[i + 1][j]);
          singleCluster->push_back(this->nodes[i + 1][j + 1]);
          singleCluster->push_back(this->nodes[i + 2][j]);
          singleCluster->push_back(this->nodes[i + 2][j + 1]);
        }
        else
        {
          errs() << "The number of CGRA nodes should be a multiple of the cluster size.\n";
        }
        CGRAMem *memNode = new CGRAMem(mem_id, j, i, t_memorySize);
        this->MemNodes[mem_id] = memNode;
        for (CGRANode *node : *singleCluster)
        {
          memNode->addNodeToCluster(node);
        }
        mem_id++;
      }
    }
  }
  else
  {
    errs() << "The cluster size should be 1, 2, 4 or 6.\n";
    return;
  }
}