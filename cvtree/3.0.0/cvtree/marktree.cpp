/*
 * Copyright (c) 2022
 * Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-11-18 19:23:11
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-23 16:28:00
 */

#include "marktree.h"

/*******************************************************************/
/********** Basic Functions For Node Class *************************/
/*******************************************************************/
// the initial/reproduct function
MarkNode *MarkNode::initial() { return new MarkNode; };
Node *MarkNode::reproduct() { return new MarkNode; };
Node *MarkNode::reproduct(size_t n) {
  Node *p = new MarkNode;
  p->id = n;
  return p;
};

Node *MarkNode::reproduct(size_t n, const string &str) {
  Node *p = new MarkNode;
  p->id = n;
  p->name = str;
  return p;
};

Node *MarkNode::reproduct(size_t n, const vector<Node *> &vn) {
  Node *p = new MarkNode;
  p->id = n;
  p->children = vn;
  p->children.shrink_to_fit();
  return p;
};

/*******************************************************************/
/********* Member Functions For Node Class *************************/
/*******************************************************************/
void MarkNode::setOneContent(const size_t len, const size_t ndx) {
  content.resize(len);
  content.set(ndx);
};

void MarkNode::flipContent() { content.flip(); };

void MarkNode::_unionChildren() {
  auto iter = children.begin();
  content = dynamic_cast<MarkNode *>(*iter)->content;
  for (++iter; iter != children.end(); ++iter)
    content ^= dynamic_cast<MarkNode *>(*iter)->content;
};

void MarkNode::setBranchContents() {
  if (!isLeaf()) {
    for (auto &nd : children)
      dynamic_cast<MarkNode *>(nd)->setBranchContents();
    _unionChildren();
  }
};

void MarkNode::initContent(map<string, SetSym>& mgi, bool unroot) {
  // set the leaf content map
  vector<Node *> allLeafs;
  getLeafs(allLeafs);
  size_t index(0);
  size_t nTotal = allLeafs.size();
  for (auto &leaf : allLeafs) {
    MarkNode *mleaf = dynamic_cast<MarkNode *>(leaf);
    mleaf->setOneContent(nTotal, index++);
    mgi[mleaf->name] = mleaf->content;
  }

  // flip a set for unroot tree
  if (unroot) {
    MarkNode *mleaf = dynamic_cast<MarkNode *>(allLeafs.front());
    mleaf->flipContent();
    mgi[mleaf->name] = mleaf->content;
  }

  // update leaf sets of branche
  setBranchContents();
};

bool MarkNode::setAllContents(const map<string, SetSym> &mgi) {
  vector<Node *> leafs;
  getLeafs(leafs);
  for (auto &leaf : leafs) {
    auto iter = mgi.find(leaf->name);
    if (iter == mgi.end()) {
      cerr << "Cannot find the species " << leaf->name << " in tree ";
      return false;
    } else {
      dynamic_cast<MarkNode *>(leaf)->content = iter->second;
    }
  }
  setBranchContents();
  return true;
};

void MarkNode::getBranchContents(set<SetSym> &bset) {
  vector<Node *> branches;
  getBranches(branches);
  for (auto &nd : branches)
    bset.insert(dynamic_cast<MarkNode *>(nd)->content);
};

void MarkNode::bootTree(const set<SetSym> &bset) {
  vector<Node *> branches;
  getBranches(branches);
  for (auto &nd : branches)
    if (bset.find(dynamic_cast<MarkNode *>(nd)->content) != bset.end())
      nd->bootstrap += 1.0;
};