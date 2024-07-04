/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:24:59
 */

#ifndef CV2DM_H
#define CV2DM_H

#include "distmeth.h"
#include "kit.h"
using namespace std;

// read arguments
struct Args {
  string program, outfile, suffix, refdm;
  vector<string> flist;
  vector<string> glist;
  float maxM, memorySize;
  DistMeth *meth;

  Args(int, char **);
  void usage();
};

#endif
