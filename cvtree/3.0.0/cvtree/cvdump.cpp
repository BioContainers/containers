/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-24 09:16:11
 */

#include "kstring.h"
#include "readgenome.h"
#include "stringOpt.h"

void usage(string &program) {
  cerr << "\nProgram Usage: \n\n"
       << program << "\n"
       << "  -i <cvfile>        input file name\n"
       << " [ -g faa ]          the type of genome file, default: faa\n"
       << " [ -n ]              output the number code, default: the letters\n"
       << " [ -h ]              Display this information\n"
       << endl;
  exit(1);
}

int main(int argc, char *argv[]) {

  string gtype = "faa";
  string infile;
  string program = argv[0];
  bool kstr = true;

  char ch;
  while ((ch = getopt(argc, argv, "i:g:n")) != -1) {
    switch (ch) {
    case 'i':
      infile = optarg;
      break;
    case 'g':
      gtype = optarg;
      break;
    case 'n':
      kstr = false;
      break;
    case 'h':
      usage(program);
    case '?':
      usage(program);
    }
  }

  // get gene type to read and read gene file
  GeneType mygene(gtype);
  Kstr::init(mygene.letters);

  CVvec cv;
  cout << "The inner of CV: " << readcv(infile, cv) << endl;
  cout << "The size  of CV: " << cv.size() << endl;

  for (const auto &cd : cv)
    cout << cd.first << "\t" << cd.second << endl;
}
