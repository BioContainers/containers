/*
 * Copyright (c) 2022
 * Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-11-18 10:52:01
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-23 16:16:01
 */

#ifndef MARKTREE_H
#define MARKTREE_H

#include "setsym.h"
#include "tree.h"

struct MarkNode : public Node {
  SetSym content;

  static MarkNode *initial();
  virtual Node *reproduct();
  virtual Node *reproduct(size_t);
  virtual Node *reproduct(size_t, const string &);
  virtual Node *reproduct(size_t, const vector<Node *> &);

  void setOneContent(const size_t nItems, const size_t iItem);
  void flipContent();
  void _unionChildren();
  void setBranchContents();
  void initContent(map<string, SetSym>&, bool rooted=true);
  bool setAllContents(const map<string, SetSym>&);
  void getBranchContents(set<SetSym>&);
  void bootTree(const set<SetSym>&);

protected:
  MarkNode() = default;
};

#endif // !MARKTREE_H