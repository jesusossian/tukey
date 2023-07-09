//
// Created by Florian on 15.04.2021.
//

#include "DataClasses.h"
#include <algorithm>
#include <utility>
#include <fstream>
#include <filesystem>
#include <iostream>
#include <map>
#include "LoadSave.h"
#include "GraphFunctions.h"

GraphStruct::GraphStruct(int size, const Labels& labels) {
    CreateGraph(size, labels);
}

void GraphStruct::CreateGraph(int size, const Labels& labels) {
    this->_nodes = size;
    this->_edges = 0;
    this->_labels = labels;
    this->_graph = std::vector<std::vector<int>>(nodes(), std::vector<int>());
    this->_degrees = std::vector<int>(nodes(), 0);
    this->isTree = false;
}

void GraphStruct::UpdateGraphLabels(LABEL_TYPE label) {
    if (label == LABEL_TYPE::LABELED_SPARSE) {
        this->labeledVectorGraph = std::vector<std::vector<std::vector<int>>>(nodes(),std::vector<std::vector<int>>(numLabels,std::vector<int>()));
        this->labeledDegreeVector = std::vector<std::vector<int>>(nodes(), std::vector<int>(numLabels, 0));
    } else if (label == LABEL_TYPE::LABELED_DENSE) {
        this->labeledMapGraph = std::vector<std::unordered_map<Label, Nodes>>(nodes(),std::unordered_map<Label, Nodes>{});
        this->labeledDegreeMap = std::vector<std::unordered_map<Label, int>>(nodes(), std::unordered_map<Label, int>{});
    }
    //set labels of neighbor Nodes
    for (NodeId Id = 0; Id < nodes(); ++Id) {
        for (NodeId neighborId: _graph[Id]) {
            //Create labeled graph
            if (label == LABEL_TYPE::LABELED_DENSE) {
                Label NodeLabel = _labels[neighborId];
                if (this->labeledMapGraph[Id].find(NodeLabel)== this->labeledMapGraph[Id].end()) {
                    Nodes newNodes = Nodes();
                    newNodes.push_back(neighborId);
                    this->labeledMapGraph[Id][NodeLabel] = newNodes;
                    this->labeledDegreeMap[Id][NodeLabel] = 1;
                } else {
                    this->labeledMapGraph[Id][NodeLabel].emplace_back(neighborId);
                    ++this->labeledDegreeMap[Id][NodeLabel];
                }
            } else if (label == LABEL_TYPE::LABELED_SPARSE) {
                Label NodeLabel = _labels[neighborId];
                this->labeledVectorGraph[Id][NodeLabel].emplace_back(neighborId);
                ++this->labeledDegreeVector[Id][NodeLabel];
            }
        }
    }
}

int GraphStruct::degree(NodeId nodeId) const {
    return this->_degrees[nodeId];
}

int GraphStruct::nodes() const {
    return _nodes;
}

int GraphStruct::edges() const {
    return _edges;
}

bool GraphStruct::edge(NodeId source, NodeId destination) const {
    if (this->degree(source) < this->degree(destination)){
        return std::binary_search(_graph[source].begin(), _graph[source].end(), destination);
    }
    else{
        return std::binary_search(_graph[destination].begin(), _graph[destination].end(), source);
    }
}

const Nodes &GraphStruct::get_neighbors(NodeId nodeId) const {
    return _graph[nodeId];
}

Nodes &GraphStruct::neighbors(NodeId nodeId) {
    return _graph[nodeId];
}

bool GraphStruct::add_edge(NodeId source, NodeId destination) {
    if (!edge(source, destination)){
        int ElementId;

        this->_graph[source].emplace_back(destination);
        ElementId = (int) this->_graph[source].size() - 1;
        while (ElementId > 0 && this->_graph[source][ElementId] < this->_graph[source][ElementId - 1]){
            std::swap(this->_graph[source][ElementId], this->_graph[source][ElementId - 1]);
            --ElementId;
        }

        this->_graph[destination].emplace_back(source);
        ElementId = (int) this->_graph[destination].size() - 1;
        while (ElementId > 0 && this->_graph[destination][ElementId] < this->_graph[destination][ElementId - 1]){
            std::swap(this->_graph[destination][ElementId], this->_graph[destination][ElementId - 1]);
            --ElementId;
        }

        ++this->_edges;
        ++this->_degrees[source];
        ++this->_degrees[destination];
        this->maxDegree = std::max(this->maxDegree, std::max(this->degree(source), this->degree(destination)));
        return true;
    }
    return false;
}

const std::vector<Label>& GraphStruct::labels() const {
    return _labels;
}

Label GraphStruct::label(NodeId nodeId) const{
    return _labels[nodeId];
}

bool GraphStruct::IsTree() const {
    for (NodeId nodeId = 0; nodeId < nodes(); ++nodeId) {
        if (degree(nodeId) == 0){
            return false;
        }
    }
    return nodes() == edges() + 1;
}

DGraphStruct GraphStruct::getBFSTree(NodeId rootNodeId) const {
    DGraphStruct BFSTree = DGraphStruct(nodes(), labels());
    std::vector<bool> VisitedNodes = std::vector<bool>(nodes(), false);
    VisitedNodes[rootNodeId] = true;
    std::vector<NodeId> CurrentNodes;
    CurrentNodes.push_back(rootNodeId);
    while (!CurrentNodes.empty()){
        NodeId NextNodeId = CurrentNodes.back();
        CurrentNodes.pop_back();
        for (NodeId neighborId : get_neighbors(NextNodeId)) {
            if (!VisitedNodes[neighborId]){
                VisitedNodes[neighborId] = true;
                CurrentNodes.insert(CurrentNodes.begin(), neighborId);
                BFSTree.add_edge(NextNodeId, neighborId);
            }
        }
    }
    return BFSTree;
}

NodeId GraphStruct::neighbor(NodeId nodeId, int neighborIdx) const {
    return _graph[nodeId][neighborIdx];
}

NodeId GraphStruct::neighbor(NodeId nodeId, int neighborIdx, Label label) {
    if (labelType == LABEL_TYPE::UNLABELED){
        return neighbor(nodeId, neighborIdx);
    }
    else if (labelType == LABEL_TYPE::LABELED_SPARSE){
        return this->labeledVectorGraph[nodeId][label][neighborIdx];
    }
    else if(labelType == LABEL_TYPE::LABELED_DENSE){
        return this->labeledMapGraph[nodeId][label][neighborIdx];
    }
    return -1;
}

bool GraphStruct::isBigger(const std::vector<int>& labeledDegree, NodeId nodeId) {
    for (Label label = 0; label < labeledDegree.size(); ++label) {
        if (labeledDegreeVector[nodeId][label] > labeledDegree[label]){
            return true;
        }
    }
    return false;
}

void GraphStruct::sortNeighborIds() {
    for (Nodes& nodes1 : this->_graph) {
        std::sort(nodes1.begin(), nodes1.end());
    }
    for (auto& [label, nodes1] : this->labelMap){
        std::sort(nodes1.begin(), nodes1.end());
    }
    for (std::unordered_map<Label, Nodes>& nodeLabelMap : this->labeledMapGraph){
        for (auto& [label, nodes1] : nodeLabelMap) {
            std::sort(nodes1.begin(), nodes1.end());
        }
    }
    for(std::vector<Nodes>& nodeLabelVector : this->labeledVectorGraph){
        for(Nodes& nodes1 : nodeLabelVector){
            std::sort(nodes1.begin(), nodes1.end());
        }
    }
}

int GraphStruct::degree(NodeId nodeId, Label label) {
    if (labelType == LABEL_TYPE::LABELED_DENSE){
        return this->labeledDegreeMap[nodeId][label];
    }
    else if (labelType == LABEL_TYPE::LABELED_SPARSE){
        return this->labeledDegreeVector[nodeId][label];
    }
    return -1;
}

const std::vector<int> &GraphStruct::degreeByLabel(NodeId nodeId) {
    return this->labeledDegreeVector[nodeId];
}



bool GraphStruct::has_neighbor_label(NodeId nodeId, Label label) {
    if (labelType == LABEL_TYPE::LABELED_SPARSE){
        return this->labeledVectorGraph[nodeId].size() > label;
    }
    else if(labelType == LABEL_TYPE::LABELED_DENSE){
        return this->labeledMapGraph[nodeId].find(label) != this->labeledMapGraph[nodeId].end();
    }
    return false;
}

NodeId GraphStruct::random_neighbor_in_range(NodeId nodeId, int minIdx,  std::mt19937_64& gen) {
    int randIdx = std::uniform_int_distribution<int>(minIdx, this->degree(nodeId) - 1)(gen);
    std::swap(this->neighbors(nodeId)[randIdx], this->neighbors(nodeId)[0]);
    return this->neighbors(nodeId)[0];
}

GraphStruct::GraphStruct(const std::string &graphPath,bool relabeling, bool withLabels, const std::string & labelPath) {
    if (std::filesystem::is_regular_file(graphPath)) {
        std::string extension = std::filesystem::path(graphPath).extension().string();
        if (extension == ".bin") {
            std::ifstream In(graphPath, std::ios::in | std::ios::binary);
            std::string Name;
            unsigned int stringLength;
            In.read((char *) (&stringLength), sizeof(stringLength));
            Name.resize(stringLength);
            In.read((char *) Name.c_str(), stringLength);
            this->name = Name;
            In.read((char *) (&this->graphType), sizeof(GraphType));
            In.read((char *) (&this->_nodes), sizeof(int));
            In.read((char *) (&this->_edges), sizeof(int));
            for (int i = 0; i < nodes(); ++i) {
                this->_graph.emplace_back(Nodes());
            }
            for (int i = 0; i < edges(); ++i) {
                int Src = 0;
                int Dst = 0;
                In.read((char *) (&Src), sizeof(int));
                In.read((char *) (&Dst), sizeof(int));
                if (this->_graph.size() > std::max(Src, Dst)) {
                    this->_graph[Src].emplace_back(Dst);
                    this->_graph[Dst].emplace_back(Src);
                }
                else{
                    int x = std::max(Src, Dst);
                }
            }
            this->_degrees = std::vector<int>(nodes(), 0);
            int Id = 0;
            for (auto const &graphNode: this->_graph) {
                this->_degrees[Id] = (int) graphNode.size();
                if (this->_degrees[Id] > this->maxDegree) {
                    this->maxDegree = this->_degrees[Id];
                }
                ++Id;
            }
            bool Labeled;
            In.read((char *) (&Labeled), sizeof(bool));
            if (Labeled && withLabels) {
                Label L;
                for (int i = 0; i < nodes(); ++i) {
                    In.read((char *) (&L), sizeof(Label));
                    this->_labels.emplace_back(L);
                }
                if (this->_labels.size() == this->_graph.size()) {
                    labelMap = GraphFunctions::GetGraphLabelMap(_labels);
                    labelFrequencyMap = GraphFunctions::GetLabelFrequency(labelMap);
                    this->numLabels = (this->numLabels == -1) ? static_cast<int>(labelMap.size()) : this->numLabels;
                    if (this->numLabels >= 10) {
                        labelType = LABEL_TYPE::LABELED_DENSE;
                    } else {
                        labelType = LABEL_TYPE::LABELED_SPARSE;
                    }
                    UpdateGraphLabels(labelType);
                } else {
                    //TODO throw exception
                }

            }
            bool OnlyGraph;
            In.read((char *) (&OnlyGraph), sizeof(bool));
            if (!OnlyGraph) {
            }
            In.close();
        } else if (extension == ".edges" || extension == ".txt") {
            std::string graph_name = std::filesystem::path(graphPath).stem().string();
            NodeId src;
            NodeId dest;
            std::string a, b;
            std::string line;
            std::ifstream infile(graphPath);
            std::map<NodeId, int> NodeIdMap;
            std::unordered_map<int, NodeId> InverseNodeIdMap;
            int EdgeNum = 0;
            int MaxNodeId = 0;
            while (std::getline(infile, line)) {
                std::istringstream iss(line);
                iss >> a;
                if (a == "#") {
                    continue;
                }
                iss >> b;
                if (b.empty()) {
                    for (int i = 0; i < std::stoi(a); ++i) {
                        this->_graph.emplace_back(std::vector<NodeId>());
                    }
                } else {
                    src = std::stoi(a);
                    dest = std::stoi(b);
                    if (NodeIdMap.find(src) == NodeIdMap.end()) {
                        NodeIdMap.insert({src, _nodes});
                        InverseNodeIdMap.insert({_nodes, src});
                        ++_nodes;
                        this->_graph.emplace_back(Nodes());
                        this->_degrees.emplace_back(0);
                    }
                    if (NodeIdMap.find(dest) == NodeIdMap.end()) {
                        NodeIdMap.insert({dest, _nodes});
                        InverseNodeIdMap.insert({_nodes, dest});
                        ++_nodes;
                        this->_graph.emplace_back(Nodes());
                        this->_degrees.emplace_back(0);
                    }
                    MaxNodeId = std::max(MaxNodeId, std::max(NodeIdMap[src], NodeIdMap[dest]));
                    ++EdgeNum;
                    //std::cout << " Loading: " << std::to_string((int) (EdgeNum/28511807.0 * 100)) << "%" << std::endl;
                    GraphStruct::add_edge(NodeIdMap[src], NodeIdMap[dest]);
                }
            }
            if (relabeling){
                std::vector<Nodes> tmp_graph;
                std::vector<int> tmp_degrees;
                tmp_graph.resize(_nodes, Nodes());
                tmp_degrees.resize(_nodes, 0);
                std::unordered_map<NodeId, int> index_map;
                int index = 0;
                for (auto const& x : NodeIdMap) {
                    index_map.insert({x.first, index});
                    ++index;
                }
                index = 0;
                for (auto const& x : NodeIdMap) {
                    for (auto const y : this->_graph[x.second]) {
                        tmp_graph[index].emplace_back(index_map[InverseNodeIdMap[y]]);
                    }
                    tmp_degrees[index] = this->_degrees[x.second];
                    ++index;
                }
                this->_graph = tmp_graph;
                this->_degrees = tmp_degrees;
            }
            this->name = graph_name;
            if (!labelPath.empty() && withLabels) {
                std::string label_extension = std::filesystem::path(labelPath).extension().string();
                std::ifstream label_file(labelPath);
                if (label_extension == ".vertexids"){
                    std::string label_line;
                    _labels = Labels(nodes(), 0);
                    Label label = 0;
                    while(std::getline(label_file, label_line)){
                        std::istringstream iss(label_line);
                        std::string token;
                        while (std::getline(iss, token, ' ')){
                            _labels[NodeIdMap[std::stoi(token)]] = label;
                        }
                        ++label;
                    }
                }
                else {
                    try {
                        std::ifstream label_file(labelPath);
                        NodeId id;
                        Label label;
                        while (label_file >> id >> label) {
                            _labels.push_back(label);
                        }
                    }
                    catch (...) {
                    }
                }
                if (this->_labels.size() == this->_graph.size()) {
                    labelMap = GraphFunctions::GetGraphLabelMap(_labels);
                    labelFrequencyMap = GraphFunctions::GetLabelFrequency(labelMap);
                    this->numLabels = (this->numLabels == -1) ? static_cast<int>(labelMap.size()) : this->numLabels;
                    if (this->numLabels >= 10) {
                        labelType = LABEL_TYPE::LABELED_DENSE;
                    } else {
                        labelType = LABEL_TYPE::LABELED_SPARSE;
                    }
                    UpdateGraphLabels(labelType);
                } else {
                    //TODO throw exception
                }
            }

        }
    }

    this->sortNeighborIds();
    this->isTree = IsTree();
}

void GraphStruct::save(const std::string &graphPath, bool Labeled, bool OnlyGraph, GraphFormat Format, const std::string& Name) const {
    std::string SaveName = graphPath + this->name;
    if (!Name.empty()){
        SaveName = graphPath + Name;
    }
    switch (Format) {
        case GraphFormat::BINARY: {
            std::ofstream Out(SaveName + ".bin", std::ios::out | std::ios::binary);
            const std::string Name = this->name;
            unsigned int stringLength = Name.length();
            GraphType Type = this->graphType;
            Out.write((char *) (&stringLength), sizeof(stringLength));
            Out.write(Name.c_str(), stringLength);
            Out.write((char *) (&Type), sizeof(GraphType));
            int Size = (int) this->nodes();
            int Edges = this->edges();
            Out.write((char *) (&Size), sizeof(int));
            Out.write((char *) (&Edges), sizeof(int));
            int Src = 0;
            for (auto const &edges: this->_graph) {
                for (auto Dst: edges) {
                    if (Dst > Src) {
                        Out.write((char *) (&Src), sizeof(int));
                        Out.write((char *) (&Dst), sizeof(int));
                    }
                }
                ++Src;
            }
            Out.write((char *) (&Labeled), sizeof(bool));
            if (Labeled) {
                for (auto const &L: labels()) {
                    Out.write((char *) (&L), sizeof(Label));
                }
            }
            Out.write((char *) (&OnlyGraph), sizeof(bool));
            if (!OnlyGraph) {
            }
            Out.close();
            break;
        }
        case GraphFormat::PEREGRINE_SMALL:{
            std::cout << SaveName + ".peregrine";
            std::ofstream Out(SaveName + ".peregrine", std::ios::out);
            int id = 0;
            if (labelType != LABEL_TYPE::UNLABELED) {
                NodeId NodeCounter = 0;
                int EdgeCounter = 0;
                for (auto const & Nodes : this->_graph) {
                    for (auto Node : Nodes) {
                        if (NodeCounter < Node){
                            if(EdgeCounter > 0){
                                Out << std::endl;
                            }
                            Out << NodeCounter << " " << label(NodeCounter) << " " << Node << " " << label(Node);
                            ++EdgeCounter;
                        }
                    }
                    ++NodeCounter;
                }
            }
            else{
                NodeId NodeCounter = 0;
                int EdgeCounter = 0;
                for (auto const & Nodes : this->_graph) {
                    for (auto Node : Nodes) {
                        if(EdgeCounter > 0){
                            Out << std::endl;
                        }
                        if (NodeCounter < Node){
                            Out << NodeCounter << " " << Node;
                        }
                        ++EdgeCounter;
                    }
                    ++NodeCounter;
                }

            }
            Out.close();
            break;
        }
        case GraphFormat::PEREGRINE_DATA:{
            std::cout << SaveName + ".peregrine" << std::endl;
            std::ofstream Out(SaveName + ".peregrine", std::ios::out);
            int id = 0;
            if (labelType != LABEL_TYPE::UNLABELED) {
                std::ofstream OutLabels(graphPath + this->name + ".peregrine_label", std::ios::out);
                NodeId NodeCounter = 0;
                int EdgeCounter = 0;
                for (auto const & Nodes : this->_graph) {
                    OutLabels << NodeCounter << label(NodeCounter) << std::endl;
                    for (auto Node : Nodes) {
                        if (NodeCounter < Node){
                            if(EdgeCounter > 0){
                                Out << std::endl;
                            }
                            Out << NodeCounter << " " << Node;
                            ++EdgeCounter;
                        }
                    }
                    ++NodeCounter;
                }
            }
            else{
                NodeId NodeCounter = 0;
                int EdgeCounter = 0;
                for (auto const & Nodes : this->_graph) {
                    for (auto Node : Nodes) {
                        if (NodeCounter < Node){
                            if(EdgeCounter > 0){
                                Out << std::endl;
                            }
                            Out << NodeCounter << " " << Node;
                            std::cout << NodeCounter << " " << Node << std::endl;
                            ++EdgeCounter;
                        }
                    }
                    ++NodeCounter;
                }
            }
            Out.close();
            break;
        }

    }
}

void GraphStruct::set_labels(const Labels* labels) {
    this->_labels = *labels;
    if (this->_labels.size() == this->_graph.size()){
        labelMap = GraphFunctions::GetGraphLabelMap(_labels);
        labelFrequencyMap = GraphFunctions::GetLabelFrequency(labelMap);
        this->numLabels = (this->numLabels == -1) ? static_cast<int>(labelMap.size()) : this->numLabels;
        if (this->numLabels >= 10){
            labelType = LABEL_TYPE::LABELED_DENSE;
        }
        else{
            labelType = LABEL_TYPE::LABELED_SPARSE;
        }
        UpdateGraphLabels(labelType);
    }
    else{
        //TODO throw exception
    }
}

NodeId GraphStruct::add_node(int number, Labels* labels) {
    for(int i = 0; i < number; i++) {
        this->_graph.emplace_back(std::vector<NodeId>());
        this->_degrees.emplace_back(0);
        ++this->_nodes;
        if (labels != nullptr && labels->size() == number){
            this->_labels.emplace_back((*labels)[i]);
        }
    }
    if (labels != nullptr && labels->size() == number){
        this->UpdateGraphLabels(LABEL_TYPE::LABELED_SPARSE);
    }
    return (int) this->_graph.size() - 1;
}

//Peregrine::DataGraph GraphStruct::to_peregrine_data_graph() const {
//    this->save("../tmp/", this->labelType != LABEL_TYPE::UNLABELED, true, GraphFormat::PEREGRINE_DATA, "tmp_data");
//    return Peregrine::DataGraph("../tmp/tmp_data.peregrine");
//}
//
//Peregrine::SmallGraph GraphStruct::to_peregrine_pattern_graph() const {
//    this->save("../tmp/", this->labelType != LABEL_TYPE::UNLABELED, true, GraphFormat::PEREGRINE_SMALL, "tmp_small");
//    return Peregrine::SmallGraph("../tmp/tmp_small.peregrine");
//}


GraphData::GraphData(const std::string& GraphPath, const std::string& LabelPath, const std::string & extension, std::set<int>* graphSizes, int patternNum) {
    add(GraphPath, LabelPath, extension, graphSizes, patternNum);
}

GraphData::GraphData(const std::vector<GraphStruct> &graphs){
    for (const GraphStruct& graphStruct: graphs) {
        add(graphStruct);
    }
}

GraphData::GraphData(const GraphStruct &graph) {
    graphData.clear();
    graphData.push_back(graph);
}

void GraphData::add(const GraphStruct& graph) {
    graphData.push_back(graph);
}

void GraphData::add_graph(const std::string& graphPath, bool withLabels) {
    this->graphData.emplace_back(GraphStruct(graphPath, withLabels));
}

void
GraphData::add(const std::string &graphPath, const std::string &labelPath, const std::string & extension, std::set<int> *graphSizes, int patternNum) {
    LoadSave::LoadGraphsFromPath(graphPath, labelPath, this->graphData, extension, graphSizes, patternNum);
}

void GraphData::add(const std::vector<GraphStruct> &graphs) {
    this->graphData.insert(this->graphData.end(), graphs.begin(), graphs.end());
}

DGraphStruct::DGraphStruct(GraphStruct & graph) : GraphStruct(graph){}

DGraphStruct::DGraphStruct(int size) : GraphStruct(size, Labels()){
}

DGraphStruct::DGraphStruct(int size, const Labels &labels) : GraphStruct(size, labels) {}

bool DGraphStruct::add_edge(NodeId source, NodeId destination) {
    if (!edge(source, destination)){
        this->_graph[source].emplace_back(destination);
        std::sort(this->_graph[source].begin(), this->_graph[source].end());
        ++this->_edges;
        ++this->_degrees[source];
        this->maxDegree = std::max(this->maxDegree, std::max(this->degree(source), this->degree(destination)));
        return true;
    }
    return false;
}

bool DGraphStruct::edge(NodeId source, NodeId destination) const {
    return DGraphStruct::edge(source, destination, true);
}

bool DGraphStruct::edge(NodeId source, NodeId destination, bool directed) const {
    if (directed){
        return std::binary_search(this->_graph[source].begin(), this->_graph[source].end(), destination);
    }
    else{
        if (std::binary_search(this->_graph[source].begin(), this->_graph[source].end(), destination)){
            return true;
        }
        return std::binary_search(this->_graph[destination].begin(), this->_graph[destination].end(), source);
    }
}




