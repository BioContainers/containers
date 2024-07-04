/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-21 12:05:29
 */

#ifndef G2CV_H
#define G2CV_H

#include "cvmeth.h"
#include "info.h"
struct Args {
  string program;
  vector<string> flist;
  vector<size_t> klist;
  vector<string> btdirs;
  CVmeth* meth;

  Args(int, char **);
  void usage();
};

#endif
