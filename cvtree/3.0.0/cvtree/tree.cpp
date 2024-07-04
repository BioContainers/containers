/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-24 14:29:00
 */

#include "tree.h"
const size_t N_FORKS(2);

/*******************************************************************/
/********** Basic Functions For Node Class *************************/
/*******************************************************************/

// the constructe function
Node::Node()
    : name(""), id(0), nleaf(1), length(NAN), bootstrap(1.0), parent(NULL) {
  children.reserve(N_FORKS);
};

// the initial/reproduct function
Node *Node::initial() { return new Node(); };
Node *Node::reproduct() { return new Node(); };
Node *Node::reproduct(size_t n) {
  Node *p = new Node();
  p->id = n;
  return p;
};

Node *Node::reproduct(size_t n, const string &str) {
  Node *p = new Node();
  p->id = n;
  p->name = str;
  return p;
};

Node *Node::reproduct(size_t n, const vector<Node *> &vn) {
  Node *p = new Node();
  p->id = n;
  p->children = vn;
  p->children.shrink_to_fit();
  return p;
};

/*******************************************************************/
/********* Member Functions For Node Class *************************/
/*******************************************************************/
bool Node::isLeaf() { return children.empty(); };

void Node::addChild(Node *nd) {
  children.emplace_back(nd);
  (*nd).parent = this;
};

void Node::deleteChild(Node *nd) {
  Children::iterator iter = find(children.begin(), children.end(), nd);
  children.erase(iter);
};

void Node::_initial() {
  children.clear();
  nleaf = 0;
  name.clear();
  id = 0;
  length = 0;
  bootstrap = 1.0;
  parent = NULL;
}

void Node::clear() {
  vector<Node *> nodes;
  getDescendants(nodes);
  for (auto &nd : nodes)
    delete nd;
  _initial();
}

void Node::getDescendants(vector<Node *> &nds) {
  if (!isLeaf()) {
    for (const auto &nd : children) {
      nds.emplace_back(nd);
      (*nd).getDescendants(nds);
    }
  }
};

void Node::getBranches(vector<Node *> &nds) {
  if (!isLeaf()) {
    nds.push_back(this);
    for (auto &nd : children)
      nd->getBranches(nds);
  }
};

void Node::getLeafs(vector<Node *> &nodes) {
  if (isLeaf()) {
    nodes.emplace_back(this);
  } else {
    for (const auto &nd : children)
      (*nd).getLeafs(nodes);
  }
};

Node *Node::resetroot(const string &str) {
  vector<Node *> leafs;
  getLeafs(leafs);
  Node *og = NULL;
  for (Node *nd : leafs) {
    if ((*nd).name == str) {
      og = nd;
      break;
    }
  }

  if (og == NULL)
    return og;
  return resetroot(og);
}

Node *Node::resetroot(Node *np) {
  Node *outgrp = np;
  vector<Node *> nlist;
  while ((*np).parent != NULL) {
    nlist.emplace_back((*np).parent);
    np = (*np).parent;
  }

  for (vector<Node *>::reverse_iterator iter = nlist.rbegin();
       iter != nlist.rend() - 1; ++iter) {
    vector<Node *>::reverse_iterator next = iter + 1;
    (**iter).length = (**next).length;
    (**next).length = NAN;
    (**iter).deleteChild(*next);
    (**next).parent = NULL;
    (**next).addChild(*iter);
  }
  Node *theRoot = nlist.front();

  // set the outgroup as the last child
  Children::reverse_iterator iter = (*theRoot).children.rbegin();
  if ((*iter) != outgrp) {
    for (++iter; iter != (*theRoot).children.rend(); ++iter) {
      if ((*iter) == outgrp) {
        *iter = (*theRoot).children.back();
        (*theRoot).children.back() = outgrp;
      }
    }
  }

  return theRoot;
};

void Node::_outnwk(ostream &os) {
  if (!isLeaf()) {
    os << "(";
    Children::const_iterator iter = children.begin();
    (*(*iter))._outnwk(os);
    for (++iter; iter != children.end(); ++iter) {
      os << ",";
      (*(*iter))._outnwk(os);
    }
    os << ")";
  }

  string forename = name.substr(name.find_first_of('|') + 1);
  if (name.find(' ') == std::string::npos)
    os << forename;
  else
    os << '"' << forename << '"';

  if (!std::isnan(length)) {
    os << ":" << fixed << setprecision(5) << length;
    if (!isLeaf())
      os << "[" << fixed << setprecision(3) << bootstrap << "]";
  }
};

void Node::outnwk(ostream &os) {
  _outnwk(os);
  os << ";" << endl;
};

void Node::outnwk(const string &str) {
  mkpath(str);
  ofstream onwk(str.c_str());
  if (!onwk) {
    cerr << "\nCannot found the output file " << str << endl;
    exit(1);
  }

  outnwk(onwk);
  onwk.close();
};

void Node::_nwkItem(const string &str) {
  vector<string> words;
  separateWord(words, str, ":");
  if (isLeaf()) {
    name = words.front();
  } else {
    try {
      bootstrap = str2double(words.front());
    } catch (exception e) {
      name = words.front();
    }
  }

  try {
    length = str2double(words.back());
  } catch (exception e) {
    vector<string> subwords;
    separateWord(subwords, words.back(), "[]");
    length = str2double(subwords.front());
    bootstrap = str2double(subwords.at(1));
  }
};

void Node::_innwk(istream &is) {
  Node *np = reproduct();
  addChild(np);
  string brStr;

  while (is.good()) {
    char c = is.get();
    if (c == ',') {
      if (!brStr.empty()) {
        np->_nwkItem(brStr);
        brStr.clear();
      }

      np = reproduct();
      addChild(np);
    } else if (c == ')') {
      if (!brStr.empty()) {
        np->_nwkItem(brStr);
        brStr.clear();
      }
      break;
    } else if (c == '(') {
      np->_innwk(is);
    } else if (c != '"' && c != '\n' && c != '\t' && c != '\'') {
      brStr.push_back(c);
    }
  }
};

void Node::innwk(istream &is) {

  char c = is.get();
  string brStr;
  while (c != ';') {
    if (c == '(') {
      _innwk(is);
    } else if (c != '"' && c != '\n' && c != '\t' && c != '\'') {
      brStr.push_back(c);
    }

    if (is.good()) {
      c = is.get();
    } else {
      cerr << "some wrong in the nwk file" << endl;
      exit(1);
    }
  }
};

void Node::innwk(const string &str) {
  ifstream inwk(str.c_str());
  if (!inwk) {
    cerr << "\nCannot found the input file " << str << endl;
    exit(1);
  }

  innwk(inwk);
  inwk.close();
};

void Node::resetBootstrap(float bv) {
  bootstrap = bv;
  if (!isLeaf()) {
    for (auto &nd : children)
      nd->resetBootstrap(bv);
  }
}

void Node::ratioBootstrap(float nTree) {
  bootstrap /= nTree;
  if (!isLeaf()) {
    for (auto &nd : children)
      nd->ratioBootstrap(nTree);
  }
}

void Node::renewId(const unordered_map<string, size_t> &mgi) {
  if (isLeaf()) {
    id = mgi.find(name)->second;
  } else {
    for (auto &nd : children)
      (*nd).renewId(mgi);
  }
};

void Node::replaceLeafName(const map<string, string> &nameMap) {
  if (nameMap.empty())
    return;

  // replace the file name to genome name
  vector<Node *> allLeafs;
  getLeafs(allLeafs);
  for (auto &nd : allLeafs) {
    auto iter = nameMap.find(nd->name);
    if (iter != nameMap.end()) {
      nd->name = iter->second;
    }
  }
};
