/*
 * Copyright (c) 2018  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2017-09-01 13:03:04
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-29 13:06:33
 */

#include "distmatrix.h"
using namespace std;

int main(int argc, char *argv[]) {

  // checkthe parameters
  if (argc < 3) {
    cerr << "You must input two file names" << endl;
    exit(1);
  }

  // read the two matrix
  Mdist dm1, dm2;

  dm1.readmtx(argv[1]);
  dm2.readmtx(argv[2]);

  if (dm1.size() != dm1.size()) {
    cerr << "The two matrix have different size" << endl;
    exit(2);
  }

  long ndiff(0);
  for (long i = 1; i < dm1.size(); ++i) {
    for (long j = 0; j < i; ++j) {
      if (dm1.getdist(i, j) != dm2.getdist(i, j)) {
        ++ndiff;
        cout << i << "\t" << j << "\t" << dm1.getdist(i, j) << "\t"
             << dm2.getdist(i, j) << "\t"
             << dm1.getdist(i, j) - dm2.getdist(i, j) << endl;
      }
    }
  }

  if (ndiff == 0) {
    cout << "The two matrixes have the same elements" << endl;
  } else {
    cout << "There are " << ndiff << " items are different in two matrixes"
         << endl;
  }
}
