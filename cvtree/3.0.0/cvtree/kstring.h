/*
 * Copyright (c) 2018  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2017-03-17 15:39:23
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2018-07-26 22:01:05
 */

#ifndef KSTRING_H
#define KSTRING_H

#include <iostream>
#include <fstream>
#include <string>
#include <set>
#include <map>
#include <list>
#include <vector>
#include <algorithm>
#include <iterator>
#include <cmath>
#include <zlib.h>
#include <unordered_map>

#include "readgenome.h"

typedef unsigned long mlong;

struct Kstr{
    static vector<char> charSet;
    unsigned long ks;

    Kstr();
    Kstr(const string&);
    Kstr(unsigned long);
    static long init(const vector<char>&);

    string decode() const;
    size_t length() const;

    void append(char);
    void addhead(char);

    void behead();
    void choptail();

    void forward(char);
    void backward(char);

    bool operator<(const Kstr&) const;
    bool operator>(const Kstr&) const;
    bool operator==(const Kstr&) const;
    bool operator!=(const Kstr&) const;
    bool operator()(const Kstr&, const string&) const;

    friend ostream& operator<<(ostream&, const Kstr&);

private:
    static char cmap[128];
    static size_t nbase;
};

struct Kstr_Hash{
    size_t operator()(const Kstr& r) const{
	return size_t(r.ks);
    };
};

typedef pair<Kstr,double> CVdim;
typedef unordered_map<Kstr,double,Kstr_Hash> CVmap;
typedef vector<CVdim> CVvec;

double module(const CVvec&);
void normalize(CVvec&);

// CVblock: a segment of the CVvec
typedef CVvec::const_iterator CViter;
struct CVblock{
    CViter begin, end;

    CVblock(const CViter& a, const CViter& b);
    
    bool empty()  const;
    CViter last() const;
    CViter mid() const;
    CViter getLower(const CViter&) const;
    CViter getUpper(const CViter&) const;
    long length() const;

    bool pop();
    bool resetBegin(CViter&);
    bool resetEnd(CViter&);
};

bool fitBoundary(CVblock&, CVblock&);
bool fitBegin(CVblock&, CVblock&);
bool fitEnd(CVblock&, CVblock&);
double align(CVblock&, CVblock&);
size_t nInterSection(CVblock&, CVblock&);
double overlap(CVblock&, CVblock&);
double shrink(CVblock&, CVblock&);
double binaryAlign(CVblock&, CVblock&);
void _binaryAlign(CVblock&, CVblock&, double& d);

void writecv(const CVmap&, const string&);
void writecv(const CVvec&, const string&);
double readcv(const string&, CVvec&);
double readcv(const string&, CVmap&);
size_t cvsize(const string&);

void readvk(const string&, vector<Kstr>&);
void writevk(const string&, const vector<Kstr>&);

#endif
