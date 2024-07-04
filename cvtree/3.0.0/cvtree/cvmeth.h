/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-21 15:13:19
 */

#ifndef CVMETH_H
#define CVMETH_H

#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <random>
#include <regex>
#include <set>
#include <sstream>
#include <string>
#include <sys/types.h>
#include <unordered_map>
#include <vector>

#include "kit.h"
#include "kstring.h"
#include "readgenome.h"
#include "stringOpt.h"

struct CVmeth {

  GeneType theg;
  string gsuff = ".faa";
  string cvsuff = ".cv";
  string ksuff = ".K";
  string cvdir;
  long kmin = 1;
  long kmax = 14;

  // the create function
  static CVmeth *create(const string &, const string &, const string &);

  // initial method
  void init(const string &, const string &);
  void setCVdir(const string &);
  void setg(const string &);

  // get the cvname for diffent cvdir
  function<string(const string &, size_t)> getCVname;

  // from genome to cv
  void checkK(const vector<size_t> &);

  // execute the caculate
  void execute(const string &, const vector<size_t> &, bool chk = true);

  // bootstrap genome
  Genome bootGenome(const Genome &);
  string bootCVname(const string&, const string&, size_t);
  void bootstrap(const string &, const vector<size_t> &, const vector<string> &,
                 bool chk = true);

  // basic function for the method
  size_t count(const Genome &, size_t, CVmap &);

  // virtual function for different
  virtual void cv(const Genome &, vector<pair<int, CVmap>> &) = 0;
};

// son class for Hao method
struct HaoMethod : public CVmeth {
  HaoMethod() { kmin = 3; };
  void cv(const Genome &, vector<pair<int, CVmap>> &) override;
  void markov(const CVmap &, const CVmap &, const CVmap &, double, CVmap &);
};

// son class for Li method
struct Counting : public CVmeth {
  Counting() { cvsuff = ".ncv"; };
  void cv(const Genome &, vector<pair<int, CVmap>> &) override;
};

#endif