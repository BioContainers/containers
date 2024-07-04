/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:28
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:18:37
 */

#define THEJSON
#include "jsonctl.h"

JsonCtl theJson;

void JsonCtl::operator()(const string &file, const string &jsonstr) {
  ofstream JSON(file);
  Json json = Json::parse(jsonstr);
  if (format)
    JSON << setw(2) << json << endl;
  else
    JSON << json << endl;
  JSON.close();
};

void JsonCtl::operator()(ostream &os, const string &jsonstr) {
  Json json = Json::parse(jsonstr);
  if (format)
    os << setw(2) << json;
  else
    os << json;
};
