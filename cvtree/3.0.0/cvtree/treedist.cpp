/*
 * Copyright (c) 2018  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2018-04-26 09:00:28
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-23 10:27:50
 */

#include "treedist.h"

int main(int argc, char *argv[]) {

  // get the input arguments
  Args myargs(argc, argv);

  /// read the first tree
  MarkNode* aTree = MarkNode::initial();
  aTree->innwk(myargs.afile);
  vector<Node *> allLeafs;
  aTree->getLeafs(allLeafs);
  map<string, SetSym> mgi;
  size_t index(0);
  size_t nTotal = allLeafs.size();
  for (auto& leaf : allLeafs) {
    MarkNode* mleaf = dynamic_cast<MarkNode*>(leaf);
    mleaf->setOneContent(nTotal, index++);
    mgi[mleaf->name] = mleaf->content;
  }
  if(myargs.unroot){
    MarkNode* mleaf = dynamic_cast<MarkNode*>(allLeafs.front());
    mleaf->flipContent();
    mgi[mleaf->name] = mleaf->content;
  }
  aTree->setBranchContents();

  // read other tree
  MarkNode* bTree = MarkNode::initial();
  bTree->innwk(myargs.bfile);
  if(bTree->setAllContents(mgi)){
    set<SetSym> aset;
    aTree->getBranchContents(aset);
    set<SetSym> bset;
    bTree->getBranchContents(bset);
    
    for(auto& syb : aset)
      bset.erase(syb);
    long nTotal = aset.size();
    long nDiff  = bset.size();
    cout << nDiff * 2 << " " << float(nDiff)/nTotal << endl;
  }else{
    cerr << myargs.bfile << endl;
  }
}

Args::Args(int argc, char **argv)
    : afile("atree.nwk"), bfile("btree.nwk"), unroot(false) {

  program = argv[0];

  char ch;
  while ((ch = getopt(argc, argv, "a:b:uh")) != -1) {
    switch (ch) {
    case 'a':
      afile = optarg;
      break;
    case 'b':
      bfile = optarg;
      break;
    case 'u':
      unroot = true;
      break;
    case 'h':
      usage();
    case '?':
      usage();
    }
  }
}

void Args::usage() {
  cerr
      << "\nProgram Usage: \n\n"
      << program << "\n"
      << " [ -a btree.nwk ]      the tree file to compare, default: atree.nwk\n"
      << " [ -b btree.nwk ]      the other tree file to compare, default: "
         "btree.nwk\n"
      << " [ -u ]                whether this two tree are unroot, default: "
         "no\n"
      << " [ -h ]                display this information\n"
      << endl;
  exit(1);
}
