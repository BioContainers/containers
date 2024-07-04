/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 16:00:48
 */

#include "dm2tree.h"

int main(int argc, char *argv[]) {
  // set a timer
  Timer mytimer;

  // get the input arguments
  Args myargs(argc, argv);

  // init the distance matrix and name list
  Mdist dm;
  dm.readmtx(myargs.distfile);
  theInfo("Read the distance matrix with " + to_string(dm.size()) + " items");

  // made the star tree by listfile
  // if no, all items in distance matrix are used
  if (!myargs.splist.empty()){
    dm.reduce(myargs.splist);
    theInfo(to_string(dm.size()) + " items are selected for tree");
  }

  // do the NJ algorithm and return the NJ tree
  Node* aTree = Node::initial();
  myargs.meth->tree(aTree, dm);

  // output the Tree
  ofstream nwk(myargs.outfile.c_str());
  (*aTree).outnwk(nwk);
  nwk.close();
}

Args::Args(int argc, char **argv) : distfile("infile"), outfile("Tree.nwk") {

  program = argv[0];
  string wkdir("");
  string listfile;
  string methStr("NJ");

  char ch;
  while ((ch = getopt(argc, argv, "i:d:o:D:m:Tqh")) != -1) {
    switch (ch) {
    case 'i':
      listfile = optarg;
      break;
    case 'd':
      distfile = optarg;
      break;
    case 'o':
      outfile = optarg;
      break;
    case 'D':
      wkdir = optarg;
      break;
    case 'm':
      methStr = optarg;
      break;
    case 'q':
      theInfo.quiet = true;
      break;
    case 'h':
      usage();
    case '?':
      usage();
    }
  }

  if (wkdir != "") {
    addsuffix(wkdir, '/');
    distfile = wkdir + distfile;
    outfile = wkdir + outfile;
  }

  // read list file and name map
  if (!listfile.empty())
    readlist(listfile, splist, 1);

  meth = TreeMeth::create(methStr);
}

void Args::usage() {
  cerr << "\nProgram Usage: \n\n"
       << program << "\n"
       << " [ -d infile ]     Input distance matrix, default: dist.matrix\n"
       << " [ -o Tree.nwk ]   Output newick tree, default: Tree.nwk\n"
       << " [ -m NJ ]         Select the tree method, NJ or UPGMA, default: NJ\n"
       << " [ -i <list> ]     selection index list of the distance matrix,\n"
       << "                   if no defined, whole distance matrix are used\n"
       << " [ -C ]            Use the netcdf input format, default false\n"
       << " [ -q ]            Run command in quiet mode\n"
       << " [ -h ]            Display this information\n"
       << endl;
  exit(1);
}
