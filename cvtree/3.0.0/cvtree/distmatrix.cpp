/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-24 17:12:46
 */

#include "distmatrix.h"

Mdist::Mdist() : ng(0){};

void Mdist::init(const vector<string> &nmlist, bool chk) {
  ng = nmlist.size();
  name = nmlist;
  dist.resize(msize(), NAN);
  if (chk)
    cleanName();
};

// read the tranditional infile for the distance matrix
bool Mdist::readmtx(const string &file) {
  bool done = false;
  if (!fileExists(file)) {
#pragma omp critical
    { theInfo("Cannot find dm file " + file); }
    return done;
  }

#ifdef _HDF5
  if (getsuffix(file) == "h5") {
#pragma omp critical
    done = readmtxh5(file);
    return done;
  }
#endif // _HDF5

#ifdef _NETCDF
  if (getsuffix(file) == "nc") {
#pragma omp critical
    done = readmtxnc(file);
    return done;
  }
#endif // _NETCDF

  if (getsuffix(file) == "txt") {
    return readmtxtxt(file);
  } else {
    return readmtxbin(file);
  }
};

// select the distance matrix file type
void Mdist::writemtx(const string &file) {
#ifdef _NETCDF
  if (getsuffix(file) == "nc") {
#pragma omp critical
    { writemtxnc(file); }
    return;
  }
#endif // _NETCDF

#ifdef _HDF5
  if (getsuffix(file) == "h5") {
#pragma omp critical
    { writemtxh5(file); }
    return;
  }
#endif // _hDF5

  if (getsuffix(file) == "txt") {
    writemtxtxt(file);
  } else {
    writemtxbin(file);
  }

  return;
};

// read the tranditional infile for the distance matrix
bool Mdist::readmtxtxt(const string &file) {
  ifstream dd(file.c_str());
  if (!dd.is_open()) {
    cerr << "Error opening file: " << file << endl;
    exit(1);
  }

  string line;
  getline(dd, line);
  resize(stoi(line));

  long idist(0);
  for (size_t i = 0; i < ng; ++i) {
    string line;
    if (getline(dd, line) && !line.empty()) {
      istringstream iss(line);
      iss >> name[i];
      for (long j = 0; j < i; ++j)
        iss >> dist[idist++];
      idist++;
    }
  }

  return true;
};

// write the tranditional infile for the distance matrix
void Mdist::writemtxtxt(const string &file) {
  mkpath(file);
  ofstream dd(file.c_str());
  if (!dd.is_open()) {
    cerr << "Error opening file: " << file << endl;
    exit(1);
  }

  dd << ng << endl;
  for (size_t i = 0; i < ng; ++i) {
    dd << name[i] << " ";
    for (size_t j = 0; j < ng; ++j)
      dd << left << fixed << setprecision(10) << setw(13) << getdist(i, j);
    dd << endl;
  }
}

// read binary infile for the distance matrix
bool Mdist::readmtxbin(const string &file) {
  gzFile fp;
  if ((fp = gzopen(file.c_str(), "rb")) == NULL) {
    cerr << "matrix file not found: \"" << file << '"' << endl;
    exit(1);
  }

  // read and set the size of matrix
  string head;
  long nsize;
  if (gzline(fp, head) != -1) {
    str2number(head, nsize);
    resize(nsize);
  } else {
    cerr << "Failed to read the number of genomes in " << file << endl;
    exit(10);
  }

  // read the name of genomes
  for (auto i = 0; i < nsize; ++i) {
    string line;
    if (gzline(fp, line) != -1) {
      name[i] = line;
    } else {
      cerr << "Failed to read genome names at line " << i << " of " << file
           << endl;
      exit(8);
    }
  }

  // read the distance
  for(auto& d : dist){
    gzread(fp, (char *)&d, sizeof(d));
  };
  gzclose(fp);

  return true;
};

// write the binary file for the distance matrix
void Mdist::writemtxbin(const string &file) {
  mkpath(file);
  gzFile fp;
  if ((fp = gzopen(addsuffix(file, ".gz").c_str(), "wb")) == NULL) {
    cerr << "Error write binary matrix file: " << file << endl;
    exit(1);
  }

  // write the size of matrix
  string head = to_string(ng) + "\n";
  gzputs(fp, head.c_str());

  // output the data into a string stream at first
  for (auto &gn : name) {
    string line = gn + "\n";
    gzputs(fp, line.c_str());
  }

  // write the distance
  int  nWidth = 1048576; 
  long nTotal = msize() * sizeof(double);
  char* pos = (char *)dist.data();
  long nBlock = nTotal / nWidth;
  for(auto i=0; i<nBlock; ++i){ 
    gzwrite(fp, pos, nWidth);
    pos += nWidth;
  }
  int nTail = nTotal % nWidth;
  if(nTail != 0)
    gzwrite(fp, pos, nTail);
  // for(auto& d : dist){
  //   gzwrite(fp, &d, sizeof(d));
  // }

  gzclose(fp);
}

#ifdef _NETCDF
// read the netcdf file for the distance matrix
bool Mdist::readmtxnc(const string &file) {
  NcFile mtxFile(file.c_str(), NcFile::ReadOnly);
  if (!mtxFile.is_valid())
    return false;

  // get the dim information
  long lenWord = mtxFile.get_dim("word")->size();
  long ngenome = mtxFile.get_dim("genome")->size();
  long nmtx = mtxFile.get_dim("matrix")->size();

  // resize the matrix
  resize(ngenome);

  // read the space name
  NcVar *spname = mtxFile.get_var("spname");
  long counts[2] = {1, lenWord};
  char aname[lenWord];
  for (long i = 0; i < ngenome; ++i) {
    spname->set_cur(i, 0);
    spname->get(aname, counts);
    name[i] = aname;
  }

  // read the distance matrix
  float *fdist = new float[nmtx];
  NcVar *distance = mtxFile.get_var("distance");
  distance->get(fdist, nmtx);

  // set the distance
  if (nmtx == ngenome * (ngenome - 1) / 2) {
    for (long i = 0; i < nmtx; ++i)
      dist[i] = fdist[i];
  } else {
    // when the size is ng*(ng+1)/2
    size_t ndx(0);
    for (long i = 1; i < ng; ++i) {
      long m = (i + 1) * i / 2;
      for (long j = 0; j < i; ++j) {
        dist[ndx++] = fdist[m + j];
      }
    }
  }
  delete[] fdist;

  mtxFile.close();
  return true;
};

// write netcdf format distance matrix
void Mdist::writemtxnc(const string &file) {
  mkpath(file);
  NcFile mtxFile(file.c_str(), NcFile::Replace);
  if (!mtxFile.is_valid()) {
    cout << "Couldn't open file!\n";
    cerr << NC_ERR << endl;
  }

  // output the space name
  size_t wlength(0);
  for (const auto &str : name)
    if (str.size() > wlength)
      wlength = str.size();
  ++wlength;

  NcDim *lenWord = mtxFile.add_dim("word", wlength);
  NcDim *ngenome = mtxFile.add_dim("genome", name.size());
  NcVar *spname = mtxFile.add_var("spname", ncChar, ngenome, lenWord);
  for (long i = 0; i < name.size(); ++i) {
    long nameSize = name[i].size() + 1;
    long counts[2] = {1, nameSize};
    spname->set_cur(i, 0);
    spname->put(name[i].c_str(), counts);
  }

  // output the distance matrix
  NcDim *mtxdist = mtxFile.add_dim("matrix", dist.size());
  NcVar *distance = mtxFile.add_var("distance", ncFloat, mtxdist);
  float *vdm = new float[dist.size()];
  for (long i = 0; i < dist.size(); ++i)
    vdm[i] = dist[i];
  distance->put(vdm, dist.size());
  delete[] vdm;

  mtxFile.close();
}
#endif // NETCDF

#ifdef _HDF5
// read hdf5 format distance matrix
bool Mdist::readmtxh5(const string &fname) {
  // check file
  if (!H5::H5File::isHdf5(fname.c_str()))
    return false;

  H5::H5File file(fname, H5F_ACC_RDONLY);
  // get the name list
  H5::DataSet nmset = file.openDataSet("Name");
  H5::DataSpace nmspace = nmset.getSpace();
  hsize_t nmdims[1];
  nmspace.getSimpleExtentDims(nmdims, NULL);
  H5::StrType nmtype(H5::PredType::C_S1, H5T_VARIABLE);
  H5::DataSpace mnspace(1, nmdims);
  vector<const char *> cstrs(nmdims[0]);
  nmset.read(cstrs.data(), nmtype, mnspace, nmspace);

  // set matrix size and the name
  resize(cstrs.size());
  for (size_t i = 0; i < cstrs.size(); ++i)
    name[i] = cstrs[i];

  // for distance
  H5::DataSet dset = file.openDataSet("Distance");
  H5::DataSpace dspace = dset.getSpace();
  hsize_t ddims[1];
  dspace.getSimpleExtentDims(ddims, NULL);
  H5::DataSpace mdspace(1, ddims);

  dset.read(dist.data(), H5::PredType::NATIVE_DOUBLE, mdspace, dspace);

  return true;
};

// write hdf5 format distance matrix
void Mdist::writemtxh5(const string &fname) {
  // open a h5 file to write
  mkpath(fname);
  H5::H5File file(fname, H5F_ACC_TRUNC);

  // for the name list
  vector<const char *> cstrs;
  for (auto &str : name)
    cstrs.push_back(str.c_str());
  hsize_t nmdim[1]{cstrs.size()};
  H5::DataSpace nmspace(1, nmdim);
  H5::StrType nmtype(H5::PredType::C_S1, H5T_VARIABLE);
  H5::DataSet nmset = file.createDataSet("Name", nmtype, nmspace);
  nmset.write(cstrs.data(), nmtype);

  // for the distance
  hsize_t ddim[1]{dist.size()};
  H5::DataSpace dspace(1, ddim);
  H5::FloatType dtype(H5::PredType::NATIVE_FLOAT);
  H5::DataSet dset = file.createDataSet("Distance", dtype, dspace);
  dset.write(dist.data(), H5::PredType::NATIVE_DOUBLE);

  file.close();
};
#endif // _HDF5

// readjust the distance matrix and their name by the index list
void Mdist::reduce(const vector<size_t> &ndx) {

  // put the name and distance in the tmp vector
  vector<double> tmpDist(dist);
  vector<string> tmpName(name);

  // resize the matrix
  resize(ndx.size());
  for (long i = 0; i < ng; ++i) {
    if (ndx[i] >= tmpName.size()) {
      cerr << "The index " << ndx[i] << " is out the size of matrix "
           << tmpName.size() << endl;
      exit(3);
    }

    name[i] = tmpName[ndx[i]];
    for (long j = 0; j <= i; ++j) {
      size_t itmp = ndx[i] < ndx[j] ? ndx[i] + ndx[j] * (ndx[j] - 1) / 2
                                    : ndx[j] + ndx[i] * (ndx[i] - 1) / 2;
      _setdist(j, i, tmpDist[itmp]);
    }
  }
}

// readjust the distance matrix and their name by the name list
void Mdist::reduce(const vector<string> &nlist) {

  // get the index map of the name
  unordered_map<string, size_t> mapMI;
  for (size_t i = 0; i < name.size(); ++i)
    mapMI[name[i]] = i;

  // resize the matrix
  vector<size_t> ndx;
  for (const auto &str : nlist)
    if (mapMI.find(str) == mapMI.end()) {
      cerr << "\nCannot find the genome " << str << "in the matrix file\n"
           << endl;
      exit(3);
    } else
      ndx.emplace_back(mapMI[str]);
  reduce(ndx);
};

// ... extend the matrix
void Mdist::extend(const vector<string> &nlist, const vector<double> &dd) {

  long orgSize = ng;
  long orgDistSize = dist.size();
  long newSize = ng + nlist.size();
  long newDistsize = msize(newSize);

  if (dd.size() != newDistsize - orgDistSize) {
    cerr << "Error: the number of the append vector is unmatched!!" << endl;
    exit(4);
  }

  // resize the matrix
  resize(newSize);

  // add the name
  for (long i = 0; i < nlist.size(); ++i)
    name[orgSize + i] = nlist[i];

  // add the distance
  for (long i = 0; i < dd.size(); ++i)
    dist[orgDistSize + i] = dd[i];
};

// ... extend matrix by name list
void Mdist::extend(const vector<string> &nlist) {
  long orgSize = ng;
  long newSize = ng + nlist.size();

  resize(newSize);
  for (long i = 0; i < nlist.size(); ++i)
    name[orgSize + i] = nlist[i];
};

// ... translate genome to the index of the matrix
bool Mdist::name2ndx(const vector<string> &nm, vector<size_t> &ndx) const {

  // get the index map of the name
  unordered_map<string, size_t> mapMI;
  for (size_t i = 0; i < name.size(); ++i)
    mapMI[name[i]] = i;

  // resize the matrix
  ndx.resize(name.size());
  for (long i = 0; i < nm.size(); ++i) {
    if (mapMI.find(nm[i]) == mapMI.end()) {
      cerr << "\nCannot find the genome " << nm[i] << "in the matrix file\n"
           << endl;
      exit(3);
    } else {
      ndx[i] = mapMI[nm[i]];
    }
  }
  return true;
};

bool Mdist::ndx2name(const vector<size_t> &ndx, vector<string> &nm) const {
  nm.resize(ndx.size());
  for (long i = 0; i < ndx.size(); ++i)
    nm[i] = getname(i);
  return true;
};

// for check NAN distance
long Mdist::chkNAN(const vector<string> &gname,
                   vector<pair<size_t, size_t>> &nandist) const {

  vector<size_t> ndx;
  name2ndx(gname, ndx);
  return chkNAN(ndx, nandist);
};

long Mdist::chkNAN(const vector<size_t> &ndx,
                   vector<pair<size_t, size_t>> &nandist) const {

  for (size_t i = 0; i < ndx.size(); ++i) {
    if (ndx[i] >= ng) {
      cerr << "The index " << ndx[i] << " is out the size of matrix " << ng
           << endl;
      exit(3);
    }

    for (size_t j = 0; j < i; ++j) {
      if (std::isnan(getdist(ndx[i], ndx[j])))
        nandist.emplace_back(ndx[i], ndx[j]);
    }
  }

  return nandist.size();
};

long Mdist::chkAllNAN(vector<pair<size_t, size_t>> &nandist) const {
  for (size_t i = 0; i < ng; ++i) {
    for (size_t j = 0; j < i; ++j) {
      if (std::isnan(_getdist(j, i)))
        nandist.emplace_back(i, j);
    }
  }
  return nandist.size();
};

//.... the number of NAN of ith line
long Mdist::nNAN(size_t i) const {
  long n(0);
  size_t j = 0;
  for (; j < i; ++j) {
    if (std::isnan(_getdist(j, i)))
      ++n;
  }

  for (++j; j < ng; ++j) {
    if (std::isnan(_getdist(i, j)))
      ++n;
  }
  return n;
};

//.... number of NAN in the matrix
long Mdist::nNAN() const {
  long n(0);
  for (size_t i = 0; i < ng; ++i) {
    for (size_t j = i + 1; j < ng; ++j) {
      if (std::isnan(_getdist(i, j)))
        ++n;
    }
  }
  return n;
};

bool Mdist::isNAN(size_t i, size_t j) const {
  return std::isnan(getdist(i, j));
};

bool Mdist::isNAN(size_t m) const { return std::isnan(dist[m]); };

//.... has NAN in the ith line
bool Mdist::hasNAN(size_t i) const {
  size_t j = 0;
  for (; j < i; ++j) {
    if (std::isnan(_getdist(j, i)))
      return true;
  }

  for (++j; j < ng; ++j) {
    if (std::isnan(_getdist(i, j)))
      return true;
  }
  return false;
};

//.... has NAN in the matrix
bool Mdist::hasNAN() const {
  size_t m = msize();
  for (size_t i = 0; i < msize(); ++i) {
    if (std::isnan(dist[i]))
      return true;
  }
  return false;
};

// .. the infomation of matrix
string Mdist::info() const {

  string str("The dimension of the distance matrix is: ");
  str += to_string(ng);

  long n = nNAN();
  long m = msize();
  if (n == 0) {
    str += "\nAll distances are filled";
  } else if (n < m) {
    str += "\n" + to_string(n) + "/" + to_string(m) + " distances are blank";
  } else {
    str += "\nAll " + to_string(n) + " distances are blank";
  }

  return str;
}

// .. reset the size of the matrix
void Mdist::resize(size_t n) {
  ng = n;
  name.resize(n);
  dist.resize(msize(), NAN);
};

// option on sigle item
double Mdist::getdist(size_t i, size_t j) const {
  if (i < j) {
    if (j >= ng) {
      cerr << "Error: the index out of matrix" << endl;
      exit(4);
    }
    return _getdist(i, j);
  } else if (i > j) {
    if (i >= ng) {
      cerr << "Error: the index out of matrix" << endl;
      exit(4);
    }
    return _getdist(j, i);
  } else {
    if (j >= ng) {
      cerr << "Error: the index out of matrix" << endl;
      exit(4);
    }
    return 0.0;
  }
};

double Mdist::_getdist(size_t i, size_t j) const {
  return dist[i + (j - 1) * j / 2];
};

pair<size_t, size_t> Mdist::getIndex(size_t ndx) const {
  if (ndx >= dist.size()) {
    cerr << "Error: the index out of distance of matrix!" << endl;
    exit(4);
  }

  size_t i = 1;
  while (ndx > (i + 2) * (i - 1) / 2)
    i++;
  size_t j = ndx - (i - 1) * i / 2;

  return make_pair(j, i);
};

void Mdist::setdist(size_t i, size_t j, double d) {
  if (i < j) {
    if (j >= ng) {
      cerr << "Error: the index out of matrix" << endl;
      exit(4);
    }
    return _setdist(i, j, d);
  } else {
    if (i >= ng) {
      cerr << "Error: the index out of matrix" << endl;
      exit(4);
    }
    return _setdist(j, i, d);
  }
};

void Mdist::_setdist(size_t i, size_t j, double d) {
  dist[i + j * (j - 1) / 2] = d;
};

void Mdist::setdist(size_t i, double d) { dist[i] = d; };

string Mdist::getname(size_t i) const { return name[i]; };
string Mdist::getcode(size_t i) const {
  return name[i].substr(0, name[i].find_first_of('-'));
}

void Mdist::setname(size_t i, const string &str) { name[i] = str; };

vector<string> Mdist::getNameList() const { return name; };

// format the genome name
void Mdist::cleanName() {
  for (long i = 0; i < ng; ++i) {
    name[i] = name[i].substr(name[i].find_last_of("/>") + 1);
  }
};

// reinitial the distance to a value(default is NAN)
void Mdist::resetDist(double dd) {
  for (auto &d : dist)
    d = dd;
}

// set the distance by a vector
void Mdist::resetDist(const vector<double>& vd) {
  if(dist.size() == vd.size()){
    dist = vd;
  } else {
    cerr << "Error: The length of two vector is not equal in resetDist" << endl;
    exit(1);
  }
}

// assign distance by other distance matrix
void Mdist::assign(const Mdist &dm, vector<size_t> &hit) {

  // get the name-index map of the reference DM
  unordered_map<string, size_t> mapMI;
  for (size_t i = 0; i < dm.size(); ++i) {
    mapMI[dm.getname(i)] = i;
  }

  // find the match items
  vector<pair<size_t, size_t>> mlist;
  for (size_t i = 0; i < ng; ++i) {
    auto iter = mapMI.find(name[i]);
    if (iter != mapMI.end()) {
      pair<size_t, size_t> item(i, iter->second);
      mlist.emplace_back(item);
      hit.emplace_back(i);
    }
  }

  // renew the match distance
  for (auto ita = mlist.begin(); ita != mlist.end(); ++ita) {
    for (auto itb = ita + 1; itb != mlist.end(); ++itb) {
      setdist(ita->first, itb->first, dm.getdist(ita->second, itb->second));
    }
  }
};

// assign distance by other distance matrix
void Mdist::assign(const Mdist &dm) {

  // get the name-index map of the reference DM
  unordered_map<string, size_t> mapMI;
  for (size_t i = 0; i < dm.size(); ++i)
    mapMI[dm.getname(i)] = i;

  // find the match items
  vector<pair<size_t, size_t>> mlist;
  for (size_t i = 0; i < ng; ++i) {
    if (hasNAN(i)) {
      auto iter = mapMI.find(name[i]);
      if (iter != mapMI.end())
        mlist.emplace_back(make_pair(i, iter->second));
    }
  }

  // renew the match distance
  for (auto ita = mlist.begin(); ita != mlist.end(); ++ita) {
    for (auto itb = ita + 1; itb != mlist.end(); ++itb) {
      setdist(ita->first, itb->first, dm.getdist(ita->second, itb->second));
    }
  }
};

// assign distance by other distance matrix by code
void Mdist::assignByCode(const Mdist &dm) {

  // get the name-index map of the reference DM
  unordered_map<string, size_t> mapMI;
  for (size_t i = 0; i < dm.size(); ++i)
    mapMI[dm.getcode(i)] = i;

  // find the match items
  vector<pair<size_t, size_t>> mlist;
  for (size_t i = 0; i < ng; ++i) {
    if (hasNAN(i)) {
      auto iter = mapMI.find(getcode(i));
      if (iter != mapMI.end())
        mlist.emplace_back(make_pair(i, iter->second));
    }
  }

  // renew the match distance
  for (auto ita = mlist.begin(); ita != mlist.end(); ++ita) {
    for (auto itb = ita + 1; itb != mlist.end(); ++itb) {
      setdist(ita->first, itb->first, dm.getdist(ita->second, itb->second));
    }
  }
};

// assign distance by alist of distance matrix
void Mdist::assign(const string &refdm) {
  // assign distance by reference DM
  vector<string> dmlist;
  separateWord(dmlist, refdm);
  for (auto &fnm : dmlist) {
    Mdist xdm;
    bool readxdm;
    readxdm = xdm.readmtx(fnm);
    if (readxdm) {
      xdm.cleanName();
      assign(xdm);
      if (!hasNAN())
        return;
    }
  }
};

// assign distance by alist of distance matrix by code
void Mdist::assignByCode(const string &refdm) {
  // assign distance by reference DM
  vector<string> dmlist;
  separateWord(dmlist, refdm);
  for (auto &fnm : dmlist) {
    Mdist xdm;
    bool readxdm;
    readxdm = xdm.readmtx(fnm);
    if (readxdm) {
      xdm.cleanName();
      assignByCode(xdm);
      if (!hasNAN())
        return;
    }
  }
};

// global options
size_t Mdist::size() const { return ng; };

size_t Mdist::msize(size_t n) const { return n * (n - 1) / 2; };
size_t Mdist::msize() const { return msize(ng); };

size_t Mdist::capacity() const {
  return dist.capacity() * sizeof(double) + sizeof(ng);
};
