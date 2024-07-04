/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-23 15:41:28
 */

#include "stringOpt.h"

/********************************************************************************
 * @brief string options
 *
 * @return string
 ********************************************************************************/
int separateWord(vector<string> &w, string t, const string &sep) {

  w.clear();
  // convert all unvisible charater into space;
  for (unsigned ix = 0; ix < t.size(); ++ix) {
    char ch_t = t[ix];
    if (ch_t < 33 or ch_t > 126)
      t[ix] = 32;
  }

  vector<string> words_t;
  string::size_type pos = 0, prev_pos = 0;
  while ((pos = t.find_first_of(sep, pos)) != string::npos) {
    words_t.emplace_back(t.substr(prev_pos, pos - prev_pos));
    prev_pos = ++pos;
  }
  words_t.emplace_back(t.substr(prev_pos, pos - prev_pos));
  for (vector<string>::iterator it = words_t.begin(); it != words_t.end();
       ++it) {
    string s_t = *it;
    if (s_t.size() != 0)
      w.emplace_back(s_t);
  }
  return w.size();
}

/// trim string
string Ltrim(const string &str) {
  size_t pos = str.find_first_not_of(" \n\r\t");
  if (pos != string::npos)
    return str.substr(pos);
  else
    return "";
}

string Rtrim(const string &str) {
  size_t pos = str.find_last_not_of(" \n\r\t");
  if (pos != string::npos)
    return str.substr(0, pos + 1);
  else
    return "";
}

string trim(const string &str) { return Ltrim(Rtrim(str)); }

/// upping and lower the charater
string toUpper(const string &s) {
  string ss(s);
  for (auto &ch : ss)
    ch = toupper(ch);
  return ss;
}

string toLower(const string &s) {
  string ss(s);
  for (auto &ch : ss)
    ch = tolower(ch);
  return ss;
}

/********************************************************************************
 * @brief option on the suffix of file name
 *
 ********************************************************************************/
string chgsuffix(const string &nm, const string &suf) {
  return nm.substr(0, nm.find_last_of('.') + 1) + suf;
}

string getsuffix(const string &nm) {
  return nm.substr(nm.find_last_of('.') + 1);
}

string delsuffix(const string &nm) {
  return nm.substr(0, nm.find_last_of('.'));
}

void addsuffix(string &str, char c) {
  string::iterator iter = str.end();
  if (*(--iter) != c)
    str += c;
}

string addsuffix(const string &str, char c) {
  if (str.back() != c) {
    return str + c;
  } else {
    return str;
  }
};

string addsuffix(const string &str, const string &suff) {
  size_t pos = str.rfind(suff);
  if (pos + suff.size() == str.size()) {
    return str;
  } else {
    return str + suff;
  }
};

string addnamelabel(const string &name, const string &lab) {
  string suffix = getsuffix(name);
  string str = delsuffix(name);
  str += lab;
  str += ".";
  str += suffix;
  return str;
};

bool hasSuffix(const string &filename, const string &suffix) {
  return filename.rfind(suffix) + suffix.size() == filename.size();
};

string getFileName(const string& path){
  return path.substr(path.find_last_of('/') + 1);
};

string getDirName(const string& path){
  return path.substr(0, path.find_last_of('/'));
};

/********************************************************************************
 * @brief option on convert string to number
 *
 ********************************************************************************/
int str2int(const string &str) { return stoi(trim(str)); }

float str2float(const string &str) { return stof(trim(str)); }

double str2double(const string &str) { return stod(trim(str)); }

string int2lenStr(int n, size_t w, char c) {
  string str = to_string(n);
  while (str.size() < w) {
    str.insert(0, 1, c);
  }
  return str;
}
/********************************************************************************
 * @brief options on read file
 *
 ********************************************************************************/
int nColumns(const string &file) {
  ifstream infile(file);
  if (!infile) {
    cerr << "\nCannot found the input file " << file << endl;
    exit(1);
  }

  string line;
  getline(infile, line);
  infile.close();
  line = trim(line);
  vector<string> items;
  separateWord(items, line);
  return items.size();
};

/********************************************************************************
 * @brief Functions by sys state for file state
 * @param filename
 ********************************************************************************/
long getFileSize(const string &filename) {
  struct stat fileInfo;
  if (stat(filename.c_str(), &fileInfo) != 0)
    return -1;
  return fileInfo.st_size;
}

bool fileExists(const string &filename) {
  struct stat buffer;
  return (stat(filename.c_str(), &buffer) == 0);
};

bool isDirectory(const string &filename) {
  struct stat fileInfo;
  if (stat(filename.c_str(), &fileInfo) != 0) {
    cerr << "Cannot find the file/dirctory " << filename << endl;
    exit(6);
  }
  return fileInfo.st_mode & S_IFDIR;
};

/********************************************************************************
 * @brief for color convert
 *
 ********************************************************************************/
//参数入参范围h(0~360),s(0~100),v(0~100),这里要注意，要把s,v缩放到0~1之间
//转换结果R(0~255),G(0~255),B(0~255)
void hsv2rgb(vector<int> &cv) {

  float H = (float)(cv[0]);
  float S = (float)(cv[1]) / 100.0;
  float V = (float)(cv[2]) / 100.0;
  float R, G, B;

  if (S == 0) {
    R = V;
    G = V;
    B = V;
  } else {

    H = H / 60;
    int i = (int)H;
    float C = H - i;
    float X = V * (1 - S);
    float Y = V * (1 - S * C);
    float Z = V * (1 - S * (1 - C));

    switch (i) {
    case 0:
      R = V;
      G = Z;
      B = X;
      break;
    case 1:
      R = Y;
      G = V;
      B = X;
      break;
    case 2:
      R = X;
      G = V;
      B = Z;
      break;
    case 3:
      R = X;
      G = Y;
      B = V;
      break;
    case 4:
      R = Z;
      G = X;
      B = V;
      break;
    case 5:
      R = V;
      G = X;
      B = Y;
      break;
    }
  }

  cv[0] = (int)(R * 255);
  cv[1] = (int)(G * 255);
  cv[2] = (int)(B * 255);
}