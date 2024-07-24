/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:22:28
 */

#ifndef DM2TREE_H
#define DM2TREE_H

#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <list>
#include <map>
#include <regex>
#include <string>
#include <vector>
//#include <omp.h>

#include "kit.h"
#include "distmatrix.h"
#include "treemeth.h"
#include "stringOpt.h"
#include "tree.h"
using namespace std;

// read arguments
struct Args {
  string program, distfile, outfile;
  vector<string> splist;
  TreeMeth* meth;

  Args(int, char **);
  void usage();
};

#endif
