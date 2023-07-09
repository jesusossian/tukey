//
// Created by Florian on 09.03.2021.
//

#include <vector>
#include "GraphFunctions.h"
#include <algorithm>
#include <deque>
#include "DataClasses.h"
#include <iostream>

std::unordered_map<Label, Nodes> GraphFunctions::GetGraphLabelMap(Labels& nodeLabels) {
    std::unordered_map<Label, Nodes> graphLabelMap;
    for (NodeId i = 0; i < nodeLabels.size(); ++i) {
        if (graphLabelMap.find(nodeLabels[i]) == graphLabelMap.end()){
            graphLabelMap.insert(std::pair<Label, Nodes>(nodeLabels[i], std::vector<NodeId>{i}));
        }
        else{
            graphLabelMap.at(nodeLabels[i]).push_back(i);
        }
    }
    return graphLabelMap;
}

std::unordered_map<Label, int> GraphFunctions::GetLabelFrequency(std::unordered_map<Label, Nodes> &labelMap) {
    std::unordered_map<Label, int> labelFrequencyMap;
    for (auto const& [label, nodes] : labelMap){
        labelFrequencyMap.insert(std::pair<Label, int>(label, nodes.size()));
    }
    return labelFrequencyMap;
}

void GraphFunctions::GetNodesByLabel(Labels& nodeLabels, Label label, Nodes& nodesByLabel) {
    nodesByLabel.clear();
    for (Label i = 0; i < nodeLabels.size(); ++i) {
        if (nodeLabels[i] == label){
            nodesByLabel.push_back(i);
        }
    }
}

Labels GraphFunctions::GetLabelsByNodes(Nodes &nodeIds, const Labels &graphLabels) {
    Labels LabelsByNodes(nodeIds.size(), 0);
    for (int i = 0; i < nodeIds.size(); ++i) {
        LabelsByNodes[i] = graphLabels[nodeIds[i]];
    }
    return LabelsByNodes;
}

std::unordered_set<Label> GraphFunctions::GetUniqueLabelsByNodes(Nodes &nodeIds, const Labels &GraphLabels) {
    std::unordered_set<Label> UniqueLabels = std::unordered_set<Label>{};
    Labels LabelsByNodes(nodeIds.size(), 0);
    for (int i = 0; i < nodeIds.size(); ++i) {
        UniqueLabels.insert(GraphLabels[nodeIds[i]]);
    }
    return UniqueLabels;
}

bool GraphFunctions::CheckSpanningTree(const GraphStruct & spanningTree, GraphStruct& pattern) {
    if (spanningTree.nodes() != pattern.nodes() || !IsTree(spanningTree)) {
        return false;
    }
    NodeId Counter = 0;
    for (auto const & Nodes : spanningTree.graph()) {
        for (auto Node : Nodes) {
            if (!pattern.edge(Counter, Node)) {
                return false;
            }
        }
        ++Counter;
    }
    return true;
}

bool GraphFunctions::IsTree(const GraphStruct & graph) {
    for (int i = 0; i < graph.nodes(); ++i) {
        if(graph.degree(i) == 0){
            return false;
        }
    }
    return graph.nodes() == graph.edges() + 1;
}

void GraphFunctions::BFSDistances(const GraphStruct &graph, NodeId root, std::vector<int> &distances) {
    distances.clear();
    distances.resize(graph.nodes(), -1);
    std::vector<bool> visitedNodes = std::vector<bool>(graph.nodes(), false);
    visitedNodes[root] = true;
    distances[root] = 0;
    std::deque<NodeId> nodes;
    nodes.push_back(root);
    while (!nodes.empty()){
        NodeId currentNode = nodes.back();
        nodes.pop_back();
        for (NodeId i = 0; i < graph.degree(currentNode); ++i) {
            NodeId neighbor = graph.neighbor(currentNode, i);
            if (!visitedNodes[neighbor]){
                visitedNodes[neighbor] = true;
                distances[neighbor] = distances[currentNode] + 1;
                nodes.push_front(neighbor);
            }
        }
    }
}

bool GraphFunctions::ReachableNodes(const GraphStruct &graph, NodeId root, std::vector<int> & reachability, int Id, int& number){
    number = 1;
    reachability[root] = Id;
    std::deque<NodeId> nodes;
    nodes.push_back(root);
    while (!nodes.empty()){
        NodeId currentNode = nodes.back();
        nodes.pop_back();
        for (NodeId i = 0; i < graph.degree(currentNode); ++i) {
            NodeId neighbor = graph.neighbor(currentNode, i);
            if (reachability[neighbor] != Id){
                reachability[neighbor] = Id;
                nodes.push_front(neighbor);
                ++number;
            }
        }
    }
    return number == graph.nodes();
}

bool GraphFunctions::IsConnected(const GraphStruct& graph){
    std::vector<int> reachability = std::vector<int>(graph.nodes(), -1);
    int number;
    return GraphFunctions::ReachableNodes(graph, 0, reachability, 0, number);
}

void GraphFunctions::GetComponents(const GraphStruct& graph, std::vector<int> & components){
    components.clear();
    components.resize(graph.nodes(), -1);
    int number = 0;
    int pos = 0;
    int Id = 0;
    while (number < graph.nodes()){
        int compSize = 0;
        while(components[pos] != -1){
            ++pos;
        }
        GraphFunctions::ReachableNodes(graph, pos, components, Id, compSize);
        number += compSize;
        ++Id;
        ++pos;
    }

}

void GraphFunctions::GetComponents(const GraphStruct& graph, std::vector<Nodes> & components){
    std::vector<int> com;
    GraphFunctions::GetComponents(graph, com);
    for (int i = 0; i < com.size(); ++i) {
        int componentId = com[i];
        if (components.empty() || components.size() <= componentId){
            components.resize(componentId + 1, Nodes());
        }
        components[componentId].emplace_back(i);
    }
}

void GraphFunctions::GetLargestComponent(const GraphStruct& graph, Nodes &nodes) {
    std::vector<Nodes> components;
    GetComponents(graph, components);
    int maxSize = 0;
    int maxIndex = 0;
    for (int i = 0; i < components.size(); ++i) {
        int compSize = (int) components[i].size();
        if (compSize > maxSize){
            maxSize = compSize;
            maxIndex = i;
        }
    }
    nodes = components[maxIndex];
}

GraphStruct GraphFunctions::SubGraph(const GraphStruct& graph, const Nodes& nodeIds){
    GraphStruct g = GraphStruct((int) nodeIds.size(), {});
    std::unordered_map<int, int> idMap = std::unordered_map<int, int>();
    for (int i = 0; i <nodeIds.size(); ++i) {
        idMap[nodeIds[i]] = i;
    }
    for (int srcNode : nodeIds) {
        for (int dstNode : graph.graph()[srcNode]) {
            if (std::find(nodeIds.begin(), nodeIds.end(), dstNode) != nodeIds.end()){
                g.add_edge(idMap[srcNode], idMap[dstNode]);
            }
        }
    }
    return g;
}

GraphStruct GraphFunctions::GetLargestComponent(const GraphStruct& graph){
    Nodes nodes;
    GetLargestComponent(graph, nodes);
    return SubGraph(graph, nodes);
}





