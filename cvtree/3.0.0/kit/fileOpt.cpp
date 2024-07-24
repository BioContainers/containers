/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-22 13:03:56
 */

#include "fileOpt.h"

/********************************************************************************
 * @brief Options on tar and zlib files
 *
 ********************************************************************************/

size_t oct2size(char *cstr) {
  size_t nsize(0);
  size_t nbase = 1;
  for (int i = 10; i > 0; i--) {
    nsize += nbase * (cstr[i] - 48);
    nbase *= 8;
  }

  return nsize;
};

void tgzReadFile(gzFile &fp, size_t nsize, string &str) {
  char buf[RECORDSIZE];
  for (size_t i = 0; i < nsize; i += RECORDSIZE) {
    gzread(fp, buf, sizeof(buf));
    str.append(buf, sizeof(buf));
  }
  str.resize(nsize);
  str.shrink_to_fit();
};

// get line from gz file
int gzline(gzFile &fp, string &line) {
  line.clear();
  char ch = gzgetc(fp);
  for (; ch != -1; ch = gzgetc(fp)) {
    if (ch == '\n') {
      return ch;
    } else {
      line += ch;
    }
  }
  return ch;
};

// check whether a gzip file is exist and not emtpy
bool gzvalid(const string &filename) {
  if (fileExists(filename)) {
    gzFile fp;
    if ((fp = gzopen(filename.c_str(), "rb")) != NULL) {
      if (gzgetc(fp) != -1) {
        gzclose(fp);
        return true;
      }
      gzclose(fp);
    }
  }
  return false;
};

// read list file for list and name map
void readNameMap(const string &file, vector<string> &nmlist,
                 map<string, string> &nameMap) {
  ifstream infile(file.c_str());
  if (!infile) {
    cerr << "\nCannot found the input file " << file << endl;
    exit(1);
  }

  for (string line; getline(infile, line);) {
    if (!line.empty()) {
      vector<string> items;
      separateWord(items, line);
      nmlist.emplace_back(items[0]);
      if (items.size() > 1) {
        nameMap.insert({items[0], items[1]});
      }
    }
  }
};

// make path recursively
void mkpath(const string &nm) {
  size_t npos = 0;
  while ((npos = nm.find("/", npos)) != std::string::npos) {
    string dir = nm.substr(0, npos);
#ifdef _WIN32
    mkdir(dir.c_str());
#else
    mkdir(dir.c_str(), 0755);
#endif
    npos++;
  }
}

// replace $ with k value in file name
string nameWithK(const string &str, size_t k) {

  string kstr = to_string(k);
  // if (str.empty())
  //   return kstr;

  // if (str.find("$", 0) == std::string::npos)
  //   return str + "$";

  string sstr = str;
  size_t npos = 0;
  while ((npos = sstr.find("$", npos)) != std::string::npos) {
    sstr.replace(npos, 1, kstr);
    npos += kstr.length();
  }
  return sstr;
}