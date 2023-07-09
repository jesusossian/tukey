//
// Created by Florian on 13.04.2021.
//

#ifndef IOLIB_STATICFUNCTIONS_H
#define IOLIB_STATICFUNCTIONS_H


#include <string>
#include <map>
#include <math.h>
#include <numeric>
#include <algorithm>
#include "iostream"
#include <random>
#include <filesystem>

class GraphParams;


class StaticFunctionsLib {
public:
    template<class T>
    static T mean(const std::vector<T>& vector);

    template<class T>
    static T standard_deviation(const std::vector<T>& vector);

    template<class T>
    static T median(std::vector<T>& vector);

    template<class T1, class T2>
    static std::string print(T1 &Object);

    template<class T1, class T2>
    static std::string print(T1 &Object, bool pair);

    template<class T2>
    static std::string pairToString(const T2 &object);

    static std::string printMap(const std::map<int, int> &map);
    static void write_csv(const std::string& path, std::vector<std::vector<std::string>>& data, const char& delimiter = ',');
    static void load_csv(const std::string &path, std::vector<std::vector<std::string>>& out, const char& delimiter = ',');
    static void load_csv(const std::string &path, std::map<std::string, std::vector<std::string>>& out, const char& delimiter = ',');

    static void get_k_from_n(std::vector<int>& output, int k, int n, int seed = 0, std::vector<int>* input = nullptr);

    static size_t get_vector_position(const std::vector<size_t>& vector_lengths, const std::vector<int>& positions);

    // Comparison function to sort the vector elements
    // by second element of tuples
    static bool sortbysecond(const std::tuple<std::string, int>& a,
                      const std::tuple<std::string, int>& b)
    {
        return (std::get<1>(a) < std::get<1>(b));
    }

    static auto above(double threshold) {
        // This captures a copy of threshold
        return [=](double value) {
            return value >= threshold;
        };
    };

    static void save(const std::string &path, const std::vector<double> &values, const std::string &extension);

    static void load(const std::string &path, std::vector<double> &values);

    static void PrintStream(std::stringstream& stringstream);

    static void GetkFoldIndices(int kFold, int dataSize, std::vector<std::pair<std::vector<int>, std::vector<int>>>& indices, int seed);
};

template <class T1, class T2>
std::string StaticFunctionsLib::print(T1& Object) {
    return std::accumulate(std::begin(Object),
                           std::end(Object),
                           std::string{},
                           [](const std::string &a, const T2 &b) {
                               return a.empty() ? '"' + std::to_string(b)
                                                : a + "|" + std::to_string(b) + '"';
                           });
}

template<class T1, class T2>
std::string StaticFunctionsLib::print(T1 &Object, bool pair) {
    if (pair) {
        return std::accumulate(std::begin(Object),
                               std::end(Object),
                               std::string{},
                               [](const std::string &a, const T2 &b) {
                                   return a.empty() ? '"' + pairToString(b) + '"'
                                                    : a + ", " + '"' + pairToString(b) + '"';
                               });
    }
    return "";
}

template<class T2>
std::string StaticFunctionsLib::pairToString(const T2 &object) {
    return "(" + std::to_string(object.first) + "," + std::to_string(object.second) + ")";
}

template<class T>
T StaticFunctionsLib::mean(const std::vector<T> &vector) {
    return std::accumulate(vector.begin(),  vector.end(), 0.0)/(double) vector.size();
}

template<class T>
T StaticFunctionsLib::standard_deviation(const std::vector<T> &vector) {
    T m = StaticFunctionsLib::mean(vector);
    double accum = 0.0;
    std::for_each (vector.begin(),  vector.end(), [&](const double d) {
        accum += (d - m) * (d - m);
    });
    return std::sqrt(accum / (vector.size()-1));
}

template<class T>
T StaticFunctionsLib::median(std::vector<T> &vector) {
    if (vector.size() % 2 == 0) {
        const auto median_it1 = vector.begin() + vector.size() / 2 - 1;
        const auto median_it2 = vector.begin() + vector.size() / 2;

        std::nth_element(vector.begin(), median_it1 , vector.end());
        const auto e1 = *median_it1;

        //std::nth_element(vector.begin(), median_it2 , vector.end());
        const auto e2 = *median_it2;

        return (e1 + e2) / 2;

    } else {
        const auto median_it = vector.begin() + vector.size() / 2;
        //std::nth_element(vector.begin(), median_it , vector.end());
        return *median_it;
    }
}


#endif //IOLIB_STATICFUNCTIONS_H
