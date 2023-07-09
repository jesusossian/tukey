//
// Created by florian on 15.12.21.
//

#ifndef HOPS_SIMPLEPATTERNS_H
#define HOPS_SIMPLEPATTERNS_H


#include "DataClasses.h"

class SimplePatterns {
public:
    static GraphStruct Circle(int size, const Labels* labels = nullptr, int num_labels = 2);
    static GraphStruct StarGraph(int size, const Labels* labels = nullptr, int num_labels = 2);
    static GraphStruct Triangle(const Labels* labels = nullptr, int num_labels = 2);

    static GraphStruct FullyConnected(int i, const Labels* labels = nullptr, int num_labels = 2);

    static GraphStruct DoubleTriangle(const Labels *labels = nullptr, int num_labels = 2);

    static GraphStruct Path(int i, Labels *labels = nullptr, int num_labels = 2);
};


#endif //HOPS_SIMPLEPATTERNS_H
