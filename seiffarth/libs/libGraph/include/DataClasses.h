//
// Created by Florian on 15.04.2021.
//

#ifndef HOPS_DATACLASSES_H
#define HOPS_DATACLASSES_H
#include <vector>
#include "typedefs.h"
#include <set>
#include <random>
#include <unordered_map>

enum class GraphType{
    GENERAL,
    TREE,
    OUTERPLANAR,
};

enum class GraphFormat{
    BINARY,
    PEREGRINE_DATA,
    PEREGRINE_SMALL,
};

struct DGraphStruct;


struct GraphStruct{
public:
    GraphStruct()= default;
    explicit GraphStruct(const std::string & graphPath, bool relabeling = true, bool withLabels = false, const std::string& labelPath = "");
    GraphStruct(NodeId size, const Labels& labels);
//    Peregrine::DataGraph to_peregrine_data_graph() const;
//    Peregrine::SmallGraph to_peregrine_pattern_graph() const;
    void save(const std::string & graphPath, bool Labeled = false, bool OnlyGraph = true, GraphFormat Format = GraphFormat::BINARY, const std::string& Name = "") const;
    void CreateGraph(NodeId size, const Labels& labels);
    void UpdateGraphLabels(LABEL_TYPE label);
    bool IsTree() const;
    DGraphStruct getBFSTree(NodeId rootNodeId) const;
    std::string name;
    GraphType graphType = GraphType::GENERAL;

    //Graph attributes for faster access
    int maxDegree = -1;
    LABEL_TYPE labelType = LABEL_TYPE::UNLABELED;
    int numLabels = -1;
    bool isTree = false;

    //for labels
    std::unordered_map<Label, Nodes> labelMap{};
    std::unordered_map<Label, int> labelFrequencyMap{};

    const std::vector<Nodes>& graph() const {return _graph;};
    int nodes() const;
    int edges() const;
    int degree(NodeId nodeId) const;
    int degree(NodeId nodeId, Label label);
    const std::vector<int>& degreeByLabel(NodeId nodeId);
    const std::vector<Label>& labels() const;
    Label label(NodeId nodeId) const;
    void set_labels(const Labels *Labels);
    const Nodes& get_neighbors(NodeId nodeId) const;
    Nodes& neighbors(NodeId nodeId);
    NodeId neighbor(NodeId nodeId, int neighborIdx) const;
    NodeId neighbor(NodeId nodeId, int neighborIdx, Label label);
    NodeId random_neighbor_in_range(NodeId nodeId, int minIdx, std::mt19937_64& gen);
    virtual bool edge(NodeId source, NodeId destination) const;
    virtual bool add_edge(NodeId source, NodeId destination);
    NodeId add_node(int number = 1, Labels* labels = nullptr);
    //Get get_neighbors by []
    const Nodes& operator[](NodeId nodeId){return _graph[nodeId];};
    void sortNeighborIds();
    bool has_neighbor_label(NodeId nodeId, Label label);

    //Static functions
    //compare the given labeled degree vector with the labeled degree vector of the node with Id:nodeId of this graph
    bool isBigger(const std::vector<int>& labeledDegree, NodeId nodeId);

    //Iterators
    struct NodeIterator{
        // Prefix increment
        void operator++() { ++nodeId;};
        const Nodes& operator*() const { return _graph->get_neighbors(nodeId); }
        friend bool operator== (const NodeIterator& a, int b) { return a.nodeId == b;};
        friend bool operator!= (const NodeIterator& a, int b) { return a.nodeId != b;};

        const GraphStruct* _graph{};
        NodeId nodeId{};
    };
    [[nodiscard]] NodeIterator begin() const { return NodeIterator{this, 0}; }
    [[nodiscard]] int end() const   { return this->nodes(); }

    struct NeighborIterator{
        // Prefix increment
        void operator++() { ++_idx;};
        NodeId operator*() const {
            if (gen == nullptr) {
                return _graph->neighbor(_nodeId, _idx);
            }
            else{
                return _graph->random_neighbor_in_range(_nodeId, _idx, *gen);
            }
        }
        friend bool operator== (const NeighborIterator& a, int b) { return a._idx == b;};
        friend bool operator!= (const NeighborIterator& a, int b) { return a._idx != b;};

        GraphStruct* _graph;
        std::mt19937_64* gen;
        NodeId _nodeId;
        int _idx;
    };

    NeighborIterator beginN(NodeId nodeId, std::mt19937_64* gen = nullptr) { return NeighborIterator{this, gen, nodeId, 0}; }
    [[nodiscard]] int endN(NodeId nodeId, int maxIdx = -1) const   {
        if (maxIdx == -1) {
            return this->degree(nodeId);
        }
        else{
            return maxIdx;
        }
    }


protected:
    int _nodes = 0;
    int _edges = 0;
    std::vector<Nodes> _graph;
    std::vector<int> _degrees;
    Labels _labels = Labels();
    std::vector<std::unordered_map<Label, int>> labeledDegreeMap{};
    std::vector<std::vector<int>> labeledDegreeVector{};
    std::vector<std::vector<Nodes>> labeledVectorGraph{};
    std::vector<std::unordered_map<Label, Nodes>> labeledMapGraph{};
};

struct DGraphStruct : public GraphStruct{
    DGraphStruct(){};
    explicit DGraphStruct(GraphStruct& graph);
    explicit DGraphStruct(int size);
    explicit DGraphStruct(int size, const Labels& labels);
    bool edge(NodeId source, NodeId destination) const override;
    bool edge(NodeId source, NodeId destination, bool directed) const;
    bool add_edge(NodeId source, NodeId destination) override;

    //TODO out and in degree
};


class GraphData {
public:
    GraphData(){};
    GraphData(const std::string& GraphPath, const std::string& LabelPath = "", const std::string& extension = "edges", std::set<int>* graphSizes = nullptr, int patternNum = -1);
    explicit GraphData(const std::vector<GraphStruct>& graphs);
    explicit GraphData(const GraphStruct& graph);
    void add_graph(const std::string& graphPath, bool withLabels = false);
    void add(const GraphStruct& graph);
    void add(const std::vector<GraphStruct>& graphs);
    void add(const std::string& graphPath, const std::string& labelPath = "", const std::string& extension = ".edges", std::set<int>* graphSizes = nullptr, int patternNum = -1);

    std::vector<GraphStruct> graphData;
    GraphStruct& operator[](size_t index){return graphData[index];};
    int size() const{return static_cast<int>(graphData.size());};
};


#endif //HOPS_DATACLASSES_H
