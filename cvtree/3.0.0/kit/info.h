/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:28
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-24 00:26:47
 */

#ifndef INFO_H
#define INFO_H

#include <string>
#include <iostream>
#include <chrono>

using namespace std;

/********************************************************************************
 * @brief the timer
 ********************************************************************************/
struct Timer {
  std::chrono::system_clock::time_point start;

  Timer();
  double elapsed();
};

/********************************************************************************
 * @brief The info output
 * 
 ********************************************************************************/
struct Info {
  bool quiet;
  int dep;
  Timer mytimer;

  Info();
  ~Info();

  void operator()(const string&, int idep=0);
  void indent(int n=1);
};
#endif

#ifndef THEINFO
#define THEINFO 
extern Info theInfo;
#endif
