#ifndef FDE20_BONUSPROJECT_3_KNN_HPP
#define FDE20_BONUSPROJECT_3_KNN_HPP

#include "Matrix.hpp"
#include <iostream>
#include <queue>
#include <unordered_map>
#include <iterator>
#include <set>
#include <bits/stdc++.h>

//-----------------------
// ----------------------------------------------------
/// Find the top k neighbors for the node start. The directed graph is stored in
/// matrix m and you can use getNeighbors(node) to get all neighbors of a node.
/// A more detailed description is provided in Matrix.hpp.
/// The function should return the k nearest neighbors in sorted order as vector
/// of Matrix::Entry, where Entry->column is the neighbor node and Entry->weight
/// is the cost to reach the node from the start node.

// this is a structure which implements the operator overloading
struct CompareWeight {
    bool operator()(Matrix::Entry const& e1, Matrix::Entry const& e2)
    {
        // return "true" if "e1" is ordered After "e2", for example:
        return e1.weight > e2.weight;
    }
};

std::vector<Matrix::Entry> getKNN(const Matrix &m, unsigned start, unsigned k) {

  using Entry = Matrix::Entry;
  std::vector<Entry> result;
  result.reserve(k);

  std::priority_queue <Entry, std::vector<Entry>, CompareWeight> pq;
  pq.push({start, 0});

  std::unordered_set <unsigned> visited ;

  while (!pq.empty() && visited.size() <= k){
      Entry top = pq.top();
      visited.insert(top.column);     //popped node from priority queue has been marked visited
      result.push_back(top);    //add the popped node to result
      pq.pop();
      for (auto &n : m.getNeighbors(top.column)) {
          if (visited.find(n.column)==visited.end()){
              //std::cout<<"in";
              pq.push({n.column, n.weight+top.weight});
          }
          //std::cout << n;
      }
  }
  result.erase(result.begin());    //remove the start node itself from result

  return result;
}

//---------------------------------------------------------------------------

#endif // FDE20_BONUSPROJECT_3_KNN_HPP
