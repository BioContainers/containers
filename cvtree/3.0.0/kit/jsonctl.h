/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:18:19
 */

#ifndef JSONCTL
#define JSONCTL

#include <fstream>
#include <iomanip>
#include <nlohmann/json.hpp>
#include <string>
using Json = nlohmann::json;
using namespace std;

struct JsonCtl {
  bool format{false};

  void operator()(const string &, const string &);
  void operator()(ostream &, const string &);
};
#endif // !JSONCTL

#ifndef THEJSON
#define THEJSON
extern JsonCtl theJson;
#endif //.!THEJSON
