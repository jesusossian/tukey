//
// Created by florian on 15.12.21.
//

#include "SimplePatterns.h"

GraphStruct SimplePatterns::Triangle(const Labels* labels, int num_labels) {
    return Circle(3, labels, num_labels);
}

GraphStruct SimplePatterns::DoubleTriangle(const Labels* labels, int num_labels) {
    GraphStruct G = GraphStruct(4, Labels());
    G.add_edge(0, 1);
    G.add_edge(0, 2);
    G.add_edge(1, 2);
    G.add_edge(1, 3);
    G.add_edge(2,3);
    G.name = "double_triangle";
    if (labels != nullptr){
        G.numLabels = num_labels;
        G.set_labels(labels);
        G.name += "_labels_";
        for (auto l : *labels) {
            G.name += std::to_string(l);
        }
    }


    return G;
}

GraphStruct SimplePatterns::FullyConnected(int i, const Labels* labels, int num_labels) {
    GraphStruct G = GraphStruct(i, Labels());
    for (int j = 0; j < i; ++j) {
        for (int k = j + 1; k < i; ++k) {
            G.add_edge(j, k);
        }
    }
    G.name = "fully_connected";
    if (labels != nullptr){
        G.numLabels = num_labels;
        G.set_labels(labels);
        G.name += "_labels_";
        for (auto l : *labels) {
            G.name += std::to_string(l);
        }
    }
    return G;
}

GraphStruct SimplePatterns::Path(int i, Labels *labels, int num_labels) {
    GraphStruct G = GraphStruct(i + 1, Labels());
    for (int j = 0; j < i; ++j) {
            G.add_edge(j, j + 1);
    }
    G.name = "path_" + std::to_string(i);

    if (labels != nullptr){
        G.numLabels = num_labels;
        G.set_labels(labels);
        G.name += "_labels_";
        for (auto l : *labels) {
            G.name += std::to_string(l);
        }
    }
    return G;
}

GraphStruct SimplePatterns::Circle(int size, const Labels *labels, int num_labels) {
    GraphStruct G = GraphStruct(size, Labels());
    for (int i = 0; i < size; ++i) {
        G.add_edge(i, (i + 1) % size);
    }
    G.name = "circle_" + std::to_string(size);
    if (labels != nullptr){
        G.numLabels = num_labels;
        G.set_labels(labels);
        G.name += "_labels_";
        for (auto l : *labels) {
            G.name += std::to_string(l);
        }
    }
    return G;
}

GraphStruct SimplePatterns::StarGraph(int size, const Labels *labels, int num_labels) {
    GraphStruct G = GraphStruct(size, Labels());
    for (int i = 0; i < size - 1; ++i) {
        G.add_edge(0, i + 1);
    }
    G.name = "star_" + std::to_string(size);
    if (labels != nullptr){
        G.numLabels = num_labels;
        G.set_labels(labels);
        G.name += "_labels_";
        for (auto l : *labels) {
            G.name += std::to_string(l);
        }
    }
    return G;
}
