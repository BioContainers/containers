/*
 * Copyright (c) 2024
 * Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2024-04-29 09:09:07
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 10:37:44
 */

#ifndef OMPOPT_H
#define OMPOPT_H

#include <iostream>

using namespace std;

/********************************************************************************
 * @brief options for three angle 
 * 
 ********************************************************************************/

struct OMP4TriAngleLoop{
  long outBeg;
  long outEnd;
  long inBeg;
  long inEnd;

  OMP4TriAngleLoop(long N);
};

#endif //OMPOPT