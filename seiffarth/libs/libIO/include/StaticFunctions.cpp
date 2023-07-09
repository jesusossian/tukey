//
// Created by Florian on 13.04.2021.
//

#include <iostream>
#include <map>
#include "StaticFunctions.h"
#include <filesystem>
#include <fstream>
#include <istream>
#include <sstream>


std::string StaticFunctionsLib::printMap(const std::map<int, int> &map) {
    std::string out = "{";
    for (auto const & [key, value] : map) {
        out += "(";
        out += std::to_string(key);
        out += ":";
        out += std::to_string(value);
        out += ")";
    }
    out += "}";
    return out;
}



void StaticFunctionsLib::save(const std::string &path,const std::vector<double> &values, const std::string& extension) {
    std::string complete_path = path + extension;

    if (extension.find("bin") != std::string::npos){
        std::ofstream file(complete_path, std::ios::out | std::ios::binary);
        size_t size = (values.size());
        file.write((char*) (&size), sizeof(size_t));
        for (auto const val: values) {
            file.write((char*) (&val), sizeof(double));
        }
        file.close();
    }
    else {
        std::ofstream file(complete_path, std::ios::out);
        for (auto const val: values) {
            file << val << std::endl;
        }
        file.close();
    }
}
void StaticFunctionsLib::load(const std::string &path, std::vector<double> &values) {
    std::string extension = std::filesystem::path(path).extension();
    if (extension.find("bin") != std::string::npos){
        std::ifstream file(path, std::ios::in | std::ios::binary);
        size_t size = 0;
        file.read((char*) (&size), sizeof(size_t));
        values = std::vector<double>(size, 0);
        for (auto & val: values) {
            file.read((char*) (&val), sizeof(double));
        }
        file.close();
    }
    else {
        std::ifstream file(path, std::ios::in);
        std::string row, item;
        values.clear();
        while(std::getline(file, row)) {
            std::istringstream ss(row);
            while (std::getline(ss, item)) {
                values.emplace_back(std::stod(item));
            }
        }
        file.close();
    }
}

void StaticFunctionsLib::write_csv(const std::string& path, std::vector<std::vector<std::string>>& data, const char& delimiter)
{
    std::ofstream file;
    file.open(path);
    for (auto const& row : data) {
        for (int i = 0; i < row.size(); ++i) {
            if (i != row.size() - 1){
                file << row[i] << ",";
            }
            else{
                file << row[i];
            }
        }
        file << std::endl;
    }
    file.close();
}

void StaticFunctionsLib::load_csv(const std::string &path, std::vector<std::vector<std::string>>& out, const char& delimiter) {
    std::string row, item;
    std::ifstream in(path);
    std::vector<std::string> R;
    while(std::getline(in, row))
    {
        R.clear();
        std::istringstream ss(row);
        while (std::getline(ss, item, delimiter)) {
            R.push_back(item);
        }
        out.push_back( R );
    }
    in.close();
}

void StaticFunctionsLib::load_csv(const std::string &path, std::map<std::string, std::vector<std::string>>& out, const char& delimiter) {
    std::string row, item;
    std::ifstream in(path);
    std::vector<std::string> R;
    std::vector<std::string> col_names;
    int row_counter = 0;
    while(std::getline(in, row))
    {
        R.clear();
        std::istringstream ss(row);
        int col_counter = 0;
        while (std::getline(ss, item, delimiter)) {
            if (row_counter == 0) {
                col_names.push_back(item);
                out[item] = std::vector<std::string>();
            }
            else{
                out[col_names[col_counter]].push_back(item);
            }
            ++col_counter;
        }
        ++row_counter;
    }
    in.close();
}

void StaticFunctionsLib::PrintStream(std::stringstream& stringstream) {
    std::cout << stringstream.str();
}

void StaticFunctionsLib::get_k_from_n(std::vector<int> &output, int k, int n, int seed, std::vector<int> *input) {
    std::mt19937_64 gen(seed);
    if (input != nullptr && input->size() == n){
        for (int i = 0; i < k; ++i) {
            int rand = std::uniform_int_distribution<int>(i, n-1)(gen);
            output.emplace_back((*input)[rand]);
            std::swap((*input)[rand], (*input)[i]);
        }
    }
    else{
        std::vector<int> vec = std::vector<int>(n, 0);
        std::iota(vec.begin(), vec.end(), 0);
        output.clear();
        for (int i = 0; i < k; ++i) {
            int rand = std::uniform_int_distribution<int>(i, n-1)(gen);
            output.emplace_back(vec[rand]);
            std::swap(vec[rand], vec[i]);
        }
    }
}

size_t StaticFunctionsLib::get_vector_position(const std::vector<size_t>& vector_lengths, const std::vector<int>& positions) {
    if (vector_lengths.size() != positions.size()){
        throw std::range_error("The lengths of the two vectors have to be equal.");
    }
    size_t position = 0;
    for (int i = 0; i < vector_lengths.size(); ++i) {
        size_t result = 1;
        for (int j = i+1; j < vector_lengths.size(); ++j) {
            result *= vector_lengths[j];
        }
        position += positions[i] * result;
    }
    return position;
}

void StaticFunctionsLib::GetkFoldIndices(int kFold, int dataSize, std::vector<std::pair<std::vector<int>, std::vector<int>>>& indices, int seed) {
    std::vector<int> ind = std::vector<int>(dataSize);
    std::iota(ind.begin(), ind.end(), 0);
    std::mt19937_64 gen(0);
    int maxIndex = (int) ind.size() - 1;
    for (int k = 0; k < kFold; ++k) {
        indices.emplace_back(std::pair<std::vector<int>, std::vector<int>>());
        int size = (int) std::round((float) dataSize/(float) kFold);
        int counter = 0;
        while(maxIndex >= 0 && counter < size){
            int rand = std::uniform_int_distribution<int>(0, maxIndex)(gen);
            indices[k].first.emplace_back(ind[rand]);
            std::swap(ind[rand], ind[maxIndex]);
            --maxIndex;
            ++counter;
        }
    }
    for (int k = 0; k < kFold; ++k) {
        for (auto x : ind) {
            if (std::find(indices[k].first.begin(), indices[k].first.end(), x) == indices[k].first.end()){
                indices[k].second.emplace_back(x);
            }
        }
    }
}







