/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-23 23:41:15
 */

#ifndef TREE_H
#define TREE_H

#include <algorithm>
#include <cmath>
#include <iomanip>
#include <iostream>
#include <map>
#include <set>
#include <string>
#include <unordered_map>
#include <vector>

#include "kit.h"
using namespace std;

typedef pair<string, string> str2str;

struct Node {
  typedef vector<Node *> Children;

  string name;
  size_t id;
  size_t nleaf;
  double length;
  double bootstrap;
  Node *parent;
  Children children;

  static Node* initial();
  virtual Node* reproduct();
  virtual Node* reproduct(size_t);
  virtual Node* reproduct(size_t, const string &);
  virtual Node* reproduct(size_t, const vector<Node *> &);

  void clear();
  void _initial();
  void addChild(Node *);
  void deleteChild(Node *);
  void getDescendants(vector<Node *> &);
  void getBranches(vector<Node *>&);
  void getLeafs(vector<Node *> &);
  bool isLeaf();

  Node *resetroot(const string &);
  Node *resetroot(Node *);

  void _outnwk(ostream &);
  void outnwk(ostream &);
  void outnwk(const string &);
  void _innwk(istream &);
  void _nwkItem(const string &);
  void innwk(istream &);
  void innwk(const string &);

  void resetBootstrap(float bv=1.0);
  void ratioBootstrap(float fTotal);

  void renewId(const unordered_map<string, size_t> &);
  void replaceLeafName(const map<string, string> &);

protected:
  Node();
};

#endif
