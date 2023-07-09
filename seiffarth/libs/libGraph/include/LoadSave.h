//
// Created by Florian on 16.03.2021.
//

#ifndef HOPS_LOADSAVE_H
#define HOPS_LOADSAVE_H

#include <string>
#include "DataClasses.h"

class LoadSave {
public:
    static void LoadGraphsFromPath(const std::string& graphPath, const std::string& labelPath, std::vector<GraphStruct> &graphs, const std::string & extension, std::set<int>* graphSizes = nullptr, int patternNum = -1);

    static bool LoadLabels(const std::string& Path, Labels &Labels);

    static void LoadLabelsFromPath(const std::string& Path, std::vector<Labels> &Labels, std::unordered_map<size_t, std::string> &LabelNames, std::set<int>* graphSizes = nullptr, int patternNum = -1);

    static void LoadTUDortmundGraphData(const std::string& path, const std::string& dbName, GraphData& graphs, std::vector<int>& graphLabels, std::vector<std::vector<int>>* graphsEdgeLabels= nullptr, std::vector<std::vector<int>>* graphsNodeAttributes= nullptr, std::vector<std::vector<int>>* graphsEdgeAttributes= nullptr);

};

#endif //HOPS_LOADSAVE_H
