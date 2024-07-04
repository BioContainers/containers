/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 14:12:51
 */

#ifndef TREEMETH_H
#define TREEMETH_H

#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <list>
#include <string>
#include <vector>

#include "distmatrix.h"
#include "tree.h"

using namespace std;

// the starTree
typedef vector<Node *> StarTree;
struct Neighbor {
  long first, second;
  double dd;

  Neighbor() : first(0), second(0), dd(numeric_limits<double>::max()){};
  void update(long, long, double);
};

struct TreeMeth {
  // the create function
  static TreeMeth *create(const string &);

  // the creat star tree
  void startree(const Mdist&, Node*, StarTree&);

  // virtual function for different methods
  virtual void tree(Node*&, Mdist &) = 0;
};

// The neighbor Joint Method
struct NeighborJoint : TreeMeth {
  void tree(Node*&, Mdist &) override;

  // the distance from the star point
  void lenStar(const StarTree &, const Mdist &);

  // reset the distance of the nearest neighbor
  void njnearest(const Mdist &, StarTree &, Neighbor &);

  // joint the two neighbors
  // reset the distance of the nearest neighbor
  void joint(Mdist &, StarTree &, Neighbor &);
};

// unweighted pair-group method with arithmetic means
struct UPGMA : TreeMeth {
  void tree(Node*&, Mdist &) override;

  // get the the nearest neighbor nodes
  void closest(const Mdist &, StarTree &, Neighbor &);

  // combine the two neighbors into a nodes
  // reset the distance of the nearest neighbor
  void combine(Mdist &, StarTree &, Neighbor &);

  // reset the length of tree
  void resetLength(Node*);
};

#endif