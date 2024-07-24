/*
 * Copyright (c) 2024
 * Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2024-04-29 10:03:57
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 11:33:02
 */

#include "ompOpt.h"

OMP4TriAngleLoop::OMP4TriAngleLoop(long N) {
  inBeg = 0;
  if (N % 2 == 0) {
    // for N is even, block is the block for N-1 case, i.e. [1,N/2)*[0,N-1) 
    // and an extra line for N-1, i.e N-1*[0,N-1)
    outBeg = 0;
    inEnd = N - 1;
    outEnd = N / 2;
  } else {
    // for N is odd, block is [1, N/2+1)*[0, N) 
    outBeg = 1;
    inEnd = N;
    outEnd = N/2 + 1;
  }
}