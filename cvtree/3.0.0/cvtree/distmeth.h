/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 11:16:15
 */

#ifndef DISTMETH_H
#define DISTMETH_H

#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <regex>
#include <set>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

#ifdef _OPENMP
#include <omp.h>
#endif

#include "distmatrix.h"
#include "info.h"
#include "kstring.h"
#include "memory.h"
#include "stringOpt.h"

using namespace std;

// read arguments
enum LPnorm { L0, L1, L2 };
struct CVitem {
  size_t ndx;
  string fname;
  double norm;
  CVvec cv;

  CVitem() = default;
  CVitem(size_t i, const string &str) : ndx(i), fname(str){};
  void fill();
  void clear() {
    CVvec().swap(cv);
    norm = 0;
  };
};

struct DistMeth {
  static bool normalize;
  static LPnorm lp;
  vector<CVitem> cvlist;
  vector<CVitem *> introBlock;
  vector<CVitem *> interBlock;
  float maxM;

  // the create function
  static DistMeth *create(const string &, bool normal = false);

  // the base function
  void setMaxMem(float, size_t, size_t);
  void setflist(const vector<string> &);

  // divided task in steps
  float setStep(const Mdist &);
  string infoStep(long, float);
  size_t length() const;
  void cleanStep();

  // execute calculation
  void fillBlock();
  void setdist4NAN(Mdist &, const CVitem &, const CVitem &);
  void calcInDist(Mdist &);
  void calcOutDist(Mdist &);
  void execute(const vector<string> &, Mdist &);

  // the virtual function for different methods
  virtual double dist(const CVitem &, const CVitem &) = 0;
};

// ... son class for different method
// ... distance scaling at L2
struct Cosine : public DistMeth {
  Cosine() { normalize = true; };
  double dist(const CVitem &, const CVitem &) override;
};

struct Euclidean : public DistMeth {
  Euclidean() { normalize = true; };
  double dist(const CVitem &, const CVitem &) override;
  double ddTail(CVblock &);
};

// ... distance scaling at L1
struct InterList : public DistMeth {
  InterList() { lp = L1; };
  double dist(const CVitem &, const CVitem &) override;
};

struct Min2Max : public DistMeth {
  Min2Max() { lp = L1; };
  double dist(const CVitem &, const CVitem &) override;
};

// ... distance scaling at L0
struct InterSet : public DistMeth {
  InterSet() { lp = L0; };
  double dist(const CVitem &, const CVitem &) override;
};

struct Dice : public DistMeth {
  Dice() { lp = L0; };
  double dist(const CVitem &, const CVitem &) override;
};

struct ItoU : public DistMeth {
  ItoU() { lp = L0; };
  double dist(const CVitem &, const CVitem &) override;
};

#endif