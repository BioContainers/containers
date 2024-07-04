/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-24 17:10:18
 */

#ifndef DISTMATRIX_H
#define DISTMATRIX_H

#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <set>
#include <string>
#include <vector>

#ifdef _NETCDF
#include <netcdfcpp.h>
#ifndef NCERR
#define NCERR
static const int NC_ERR = 10;
#endif
#endif

#ifdef _HDF5
#include "H5Cpp.h"
#endif

#include "kit.h"
#include "tree.h"

using namespace std;

// ... only distance matrix
class Mdist {
  long ng;
  vector<double> dist;
  vector<string> name;

public:
  Mdist();
  void init(const vector<string> &, bool chk=true);

  void _setdist(size_t, size_t, double);
  double _getdist(size_t, size_t) const;

  // read/write the matrix
  bool readmtx(const string &);
  void writemtx(const string &);

  // bin format
  bool readmtxbin(const string&);
  void writemtxbin(const string&);

  // txt format
  bool readmtxtxt(const string &);
  void writemtxtxt(const string &);

#ifdef _NETCDF
  // netcdf format
  bool readmtxnc(const string &);
  void writemtxnc(const string &);
#endif

#ifdef _HDF5
  // hdf5 format
  bool readmtxh5(const string &);
  void writemtxh5(const string &);
#endif

  // get exchange index and genome name
  bool name2ndx(const vector<string> &, vector<size_t> &) const;
  bool ndx2name(const vector<size_t> &, vector<string> &) const;

  // reduce the matrix by name or index list
  void reduce(const vector<size_t> &);
  void reduce(const vector<string> &);

  // extent the matrix
  void extend(const vector<string> &, const vector<double> &);
  void extend(const vector<string> &);
  void extend(const vector<double> &);

  // get the distance from other distance matrix
  void cleanName();
  void resetDist(double dd=NAN);
  void resetDist(const vector<double>&);
  void assign(const Mdist &, vector<size_t> &);
  void assign(const Mdist &);
  void assignByCode(const Mdist &);
  void assign(const string &);
  void assignByCode(const string &);


  // check NAN distance
  long chkNAN(const vector<size_t> &, vector<pair<size_t, size_t>> &) const;
  long chkNAN(const vector<string> &, vector<pair<size_t, size_t>> &) const;
  long chkAllNAN(vector<pair<size_t, size_t>> &) const;
  long nNAN(size_t) const;
  long nNAN() const;
  bool isNAN(size_t, size_t) const;
  bool isNAN(size_t) const;
  bool hasNAN(size_t) const;
  bool hasNAN() const;
  string info() const;

  // get/set value of matrix
  double getdist(size_t, size_t) const;
  string getname(size_t) const;
  string getcode(size_t) const;
  pair<size_t, size_t> getIndex(size_t) const;
  vector<string> getNameList() const;
  void setdist(size_t, size_t, double);
  void setdist(size_t, double);
  void setname(size_t, const string &);

  // global options
  void resize(size_t);
  size_t size() const;
  size_t msize() const;
  size_t msize(size_t) const;
  size_t capacity() const;
};

#endif
