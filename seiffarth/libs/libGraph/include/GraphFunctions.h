//
// Created by Florian on 09.03.2021.
//

#ifndef HOPS_GRAPHFUNCTIONS_H
#define HOPS_GRAPHFUNCTIONS_H

#include <random>
#include <unordered_map>
#include <unordered_set>
#include "typedefs.h"


class GraphStruct;

class GraphFunctions {
public:
    static std::unordered_map<Label, int> GetLabelFrequency(std::unordered_map<Label, Nodes>& labelMap);
    static std::unordered_map<Label, Nodes> GetGraphLabelMap(Labels& nodeLabels);
    static void GetNodesByLabel(Labels& nodeLabels, Label label, Nodes& nodesByLabel);
    static Labels GetLabelsByNodes(Nodes& nodeIds, const Labels& graphLabels);
    static std::unordered_set<Label> GetUniqueLabelsByNodes(Nodes& nodeIds, const Labels& GraphLabels);
    static bool CheckSpanningTree(const GraphStruct& spanningTree, GraphStruct& pattern);
    static bool IsTree(const GraphStruct & graph);
    static void BFSDistances(const GraphStruct &graph, NodeId root,std::vector<int> &distances);
    static void GetComponents(const GraphStruct& graph, std::vector<int> & components);
    static void GetComponents(const GraphStruct& graph, std::vector<Nodes> & components);
    static void GetLargestComponent(const GraphStruct& graph, Nodes& nodes);
    static GraphStruct GetLargestComponent(const GraphStruct& graph);
    static GraphStruct SubGraph(const GraphStruct& graph, const Nodes& nodeIds);
    static bool IsConnected(const GraphStruct& graph);
private:
    static bool ReachableNodes(const GraphStruct &graph, NodeId root, std::vector<int> & reachability, int Id, int& number);
};


#endif //HOPS_GRAPHFUNCTIONS_H
