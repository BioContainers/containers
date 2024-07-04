/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:21:29
 */

#include "kstring.h"

size_t Kstr::nbase;
char Kstr::cmap[128];
vector<char> Kstr::charSet;

long Kstr::init(const vector<char> &letters) {
  nbase = letters.size() + 1;
  charSet = letters;
  for (long i = 1; i < nbase; ++i) {
    cmap[letters[i - 1]] = i;
    cmap[i] = letters[i - 1];
  }

  float logbs = log2(nbase);
  float sz = sizeof(unsigned long) * 8;
  return sz / logbs;
};

Kstr::Kstr() : ks(0){};

Kstr::Kstr(unsigned long s) { ks = s; };

Kstr::Kstr(const string &str) : ks(0) {
  for (auto &c : str)
    ks = ks * nbase + cmap[c];
};

string Kstr::decode() const {
  string str;
  for (unsigned long s = ks; s != 0; s /= nbase)
    str += char(cmap[s % nbase]);
  reverse(str.begin(), str.end());
  return str;
}

size_t Kstr::length() const {
  size_t n(0);
  unsigned long unit(1);
  while (unit <= ks) {
    ++n;
    unit *= nbase;
  }
  return n;
};

void Kstr::append(char c) {
  ks *= nbase;
  ks += cmap[c];
};

void Kstr::addhead(char c) {
  unsigned long unit(1);
  while (unit <= ks)
    unit *= nbase;
  ks += (unit * cmap[c]);
};

void Kstr::choptail() { ks /= nbase; };

void Kstr::behead() {
  unsigned long unit(1);
  while (unit <= ks)
    unit *= nbase;
  unit /= nbase;
  ks %= unit;
};

void Kstr::forward(char c) {
  behead();
  append(c);
}

void Kstr::backward(char c) {
  choptail();
  addhead(c);
}

bool Kstr::operator<(const Kstr &r) const { return ks < r.ks; };

bool Kstr::operator>(const Kstr &r) const { return ks > r.ks; };

bool Kstr::operator==(const Kstr &r) const { return ks == r.ks; };

bool Kstr::operator!=(const Kstr &r) const { return ks != r.ks; };

bool Kstr::operator()(const Kstr &a, const string &b) const { return a < b; };

ostream &operator<<(ostream &os, const Kstr &ks) {
  os << ks.decode();
  return os;
};

/// output cv in binary file and gzip it
void writecv(const CVmap &cv, const string &file) {

  CVvec kslist(cv.size());
  long index(-1);
  for (const CVdim &cdim : cv)
    kslist[++index] = cdim;
  sort(kslist.begin(), kslist.end(),
       [](const CVdim &a, const CVdim &b) { return a.first < b.first; });
  writecv(kslist, file);
};

// output cv vector file and gzip it
void writecv(const CVvec &cv, const string &file) {
  double inner(0);
  unsigned long size = cv.size();

  for (const CVdim &c : cv)
    inner += c.second * c.second;

  gzFile fp;
  if ((fp = gzopen(file.c_str(), "wb")) == NULL) {
    cerr << "Error happen on write cvfile: " << file << endl;
    exit(1);
  }

  gzwrite(fp, &inner, sizeof(double));
  gzwrite(fp, &size, sizeof(unsigned long));
  gzwrite(fp, cv.data(), size * sizeof(CVdim));
  // for(const CVdim& s : cv)
  // 	gzwrite(fp, &s, sizeof(CVdim));

  gzclose(fp);
}

// Read the cv from binary gz file
// read the cv from operation on the cv vector
// used for the distance calculate
double readcv(const string &filename, CVvec &cv) {
  gzFile fp;
  if ((fp = gzopen(filename.c_str(), "rb")) == NULL) {
    cerr << "CV file not found: \"" << filename << '"' << endl;
    exit(1);
  }

  // get the head (norm & size) of the cv file
  pair<double, mlong> tmp;
  long len = gzread(fp, (char *)&tmp, sizeof(CVdim));
  if(len != sizeof(CVdim)) {
    cerr << "Failed to read cv file " << filename << endl;
    exit(10);
  }
  double norm = sqrt(tmp.first);
  mlong size = tmp.second;

  // read the cv
  cv.resize(size);
  gzread(fp, (char *)cv.data(), size * sizeof(CVdim));
  gzclose(fp);

  return norm;
}

// read the cv file into a map
double readcv(const string &filename, CVmap &cv) {
  gzFile fp;
  if ((fp = gzopen(filename.c_str(), "rb")) == NULL) {
    cerr << "CV file not found: \"" << filename << '"' << endl;
    exit(1);
  }

  // get the head (norm & size) of the cv file
  pair<double, mlong> tmp;
  gzread(fp, (char *)&tmp, sizeof(CVdim));
  double norm = sqrt(tmp.first);
  mlong size = tmp.second;

  // read the cv
  for (long i = 0; i < size; ++i) {
    CVdim cd;
    gzread(fp, (char *)&cd, sizeof(CVdim));
    cv.insert(cv.end(), cd);
  }
  gzclose(fp);

  return norm;
}

size_t cvsize(const string &filename) {
  gzFile fp;
  if ((fp = gzopen(filename.c_str(), "rb")) == NULL) {
    cerr << "CV file not found: \"" << filename << '"' << endl;
    exit(1);
  }

  double inner;
  gzread(fp, (char *)&inner, sizeof(double));
  size_t size;
  gzread(fp, (char *)&size, sizeof(size_t));
  gzclose(fp);

  return size * (sizeof(long) + sizeof(double));
};

double module(const CVvec &cv) {
  CViter iter = cv.begin();
  CViter iterEnd = cv.end();
  double mm(0);
  for (; iter != iterEnd; ++iter)
    mm += ((*iter).second) * ((*iter).second);
  return sqrt(mm);
}

void normalize(CVvec &cv) {
  double m = module(cv);
  CVvec::iterator iter = cv.begin();
  CVvec::iterator iterEnd = cv.end();
  for (; iter != iterEnd; ++iter)
    (*iter).second /= m;
}

// Function for CVblock
CVblock::CVblock(const CViter &a, const CViter &b) : begin(a), end(b){};

bool CVblock::empty() const { return begin == end; };

long CVblock::length() const { return distance(begin, end); };

CViter CVblock::last() const { return end - 1; };

CViter CVblock::mid() const { return begin + length() / 2; };

CViter CVblock::getLower(const CViter &obj) const {
  return lower_bound(begin, end, *obj, [](const CVdim &a, const CVdim &b) {
    return a.first < b.first;
  });
};

CViter CVblock::getUpper(const CViter &obj) const {
  return upper_bound(begin, end, *obj, [](const CVdim &a, const CVdim &b) {
    return a.first < b.first;
  });
};

bool CVblock::pop() {
  ++begin;
  return empty();
};

bool CVblock::resetBegin(CViter &obj) {
  begin = getLower(obj);
  return empty();
};

bool CVblock::resetEnd(CViter &obj) {
  end = getUpper(obj);
  return empty();
};

bool fitBegin(CVblock &block1, CVblock &block2) {

  // fit the begin terminal
  if (block1.begin->first < block2.begin->first) {
    if (block1.resetBegin(block2.begin))
      return false;
  } else if (block1.begin->first > block2.begin->first) {
    if (block2.resetBegin(block1.begin))
      return false;
  }

  return true;
}

bool fitEnd(CVblock &block1, CVblock &block2) {

  // get the upper bound
  CViter iter1Last = block1.last();
  CViter iter2Last = block2.last();
  if (iter1Last->first < iter2Last->first) {
    if (block2.resetEnd(iter1Last))
      return false;
  } else if (iter1Last->first > iter2Last->first) {
    if (block1.resetEnd(iter2Last))
      return false;
  }
  return true;
}

bool fitBoundary(CVblock &block1, CVblock &block2) {
  // get the lower bound
  if (!fitBegin(block1, block2))
    return false;

  // get the upper bound
  if (!fitEnd(block1, block2))
    return false;

  return true;
}

// get dot product by shrink the begin by binary search
double shrink(CVblock &block1, CVblock &block2) {

  double d(0);
  for (;;) {
    if (block1.begin->first == block2.begin->first) {
      d += block1.begin->second * block2.begin->second;
      if (block1.pop())
        return d;
      if (block2.pop())
        return d;
    } else {
      if (block1.begin->first < block2.begin->first) {
        if (block1.resetBegin(block2.begin))
          return d;
      } else {
        if (block2.resetBegin(block1.begin))
          return d;
      }
    }
  }
}

// get dot product by sequentially align
double align(CVblock &block1, CVblock &block2) {

  double d(0);
  for (;;) {
    if (block1.begin->first == block2.begin->first) {
      d += block1.begin->second * block2.begin->second;
      if (block1.pop())
        return d;
      if (block2.pop())
        return d;
    } else {
      if (block1.begin->first < block2.begin->first) {
        if (block1.pop())
          return d;
      } else {
        if (block2.pop())
          return d;
      }
    }
  }
};

// get the number of intersection
size_t nInterSection(CVblock &block1, CVblock &block2) {

  // the number record
  size_t nI(0);

  // get the distance after reset bound with binary search
  if (fitBegin(block1, block2)) {
    for (;;) {
      if (block1.begin->first == block2.begin->first) {
        nI++;
        if (block1.pop())
          break;
        if (block2.pop())
          break;
      } else {
        if (block1.begin->first < block2.begin->first) {
          if (block1.pop())
            break;
        } else {
          if (block2.pop())
            break;
        }
      }
    }
  }

  return nI;
};

// get the overlap of kmer
double overlap(CVblock &block1, CVblock &block2) {

  double sumMin(0);
  if (fitBegin(block1, block2)) {
    for (;;) {
      if (block1.begin->first == block2.begin->first) {
        sumMin += min(block1.begin->second, block1.begin->second);
        if (block1.pop())
          break;
        else if (block2.pop())
          break;
      } else if (block1.begin->first < block2.begin->first) {
        if (block1.pop())
          break;
      } else {
        if (block2.pop())
          break;
      }
    }
  }
  return sumMin;
};

// get dot product by binary segment align
double binaryAlign(CVblock &block1, CVblock &block2) {

  double d(0.0);
  if (block1.length() < block2.length()) {
    _binaryAlign(block1, block2, d);
  } else {
    _binaryAlign(block2, block1, d);
  }
  return d;
};

void _binaryAlign(CVblock &block1, CVblock &block2, double &d) {

  CViter iter1mid = block1.mid();
  while (iter1mid->first > block2.last()->first) {
    if (iter1mid == block1.begin)
      return;
    block1.end = iter1mid;
    iter1mid = block1.mid();
  }

  while (iter1mid->first < block2.begin->first) {
    if (iter1mid == block1.last())
      return;
    block1.begin = iter1mid + 1;
    iter1mid = block1.mid();
  }

  CVblock upper1(block1.begin, iter1mid);
  CVblock lower1(iter1mid + 1, block1.end);

  CViter iter2mid = block2.getLower(iter1mid);
  CVblock upper2(block2.begin, iter2mid);
  CVblock lower2(iter2mid, block2.end);

  if (iter1mid->first == iter2mid->first) {
    d += iter1mid->second * iter2mid->second;
    lower2.pop();
  }

  if (!upper1.empty() && !upper2.empty())
    d += binaryAlign(upper1, upper2);

  if (!lower1.empty() && !lower2.empty())
    d += binaryAlign(lower1, lower2);
}

// operation for kstr vector
// used for the missing K string
void readvk(const string &filename, vector<Kstr> &vk) {
  gzFile fp;
  if ((fp = gzopen(filename.c_str(), "rb")) == NULL) {
    cerr << "CV file not found: \"" << filename << '"' << endl;
    exit(1);
  }

  double inner;
  gzread(fp, (char *)&inner, sizeof(double));

  mlong size;
  gzread(fp, (char *)&size, sizeof(mlong));

  CVdim cdim;
  while (gzread(fp, (char *)&cdim, sizeof(CVdim)) > 0)
    vk.emplace_back(cdim.first);
  gzclose(fp);
}

void writevk(const string &file, const vector<Kstr> &vk) {

  unsigned long size = vk.size();
  double inner(1.0);

  gzFile fp;
  if ((fp = gzopen(file.c_str(), "wb")) == NULL) {
    cerr << "Error happen on write cvfile: " << file << endl;
    exit(1);
  }

  gzwrite(fp, &inner, sizeof(double));
  gzwrite(fp, &size, sizeof(unsigned long));

  for (const auto &s : vk) {
    CVdim cv(s, 1.0);
    gzwrite(fp, &cv, sizeof(CVdim));
  }
  gzclose(fp);
}
