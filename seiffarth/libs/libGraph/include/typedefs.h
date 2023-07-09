//
// Created by Florian on 27.04.2021.
//

#ifndef HOPS_TYPEDEFS_H
#define HOPS_TYPEDEFS_H

#include <vector>
#include "Enums.h"

typedef int Label;
typedef std::vector<Label> Labels;
typedef int NodeId;
typedef std::vector<NodeId> Nodes;
typedef std::vector<std::pair<NodeId, NodeId>> EdgesSrcDst;
typedef unsigned long long int UInt64;

#endif //HOPS_TYPEDEFS_H
