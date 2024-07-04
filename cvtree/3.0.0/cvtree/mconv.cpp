/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-23 21:51:15
 */

#include "distmatrix.h"
#include "kit.h"
#include <array>
#include <map>
#include <regex>
using namespace std;

void usage(string &program) {
  cerr << "\nProgram Usage: \n\n"
       << program << "\n"
       << " [ -i input ]     Input matrix file, format determined by suffix\n"
       << " [ -o output ]    Output matrix file, format determined by suffix\n"
       << " [ -n namelist ]  Output name list of dist matrix\n"
       << " [ -r namelist ]  Set the name of matrix by the name list file\n"
       << " [ -h ]           Display this information\n"
       << endl;
  exit(1);
}

int main(int argc, char *argv[]) {

  // get the name of file
  string infile;
  string outfile = "mdist.txt";
  string namelist;
  string program = argv[0];
  bool check(false);
  bool Input(false);

  char ch;
  while ((ch = getopt(argc, argv, "i:o:r:n:Ch")) != -1) {
    switch (ch) {
    case 'i':
      infile = optarg;
      break;
    case 'o':
      outfile = optarg;
      break;
    case 'n':
      namelist = optarg;
      break;
    case 'r':
      namelist = optarg;
      Input = true;
      break;
    case 'C':
      check = true;
      break;
    case 'h':
      usage(program);
    case '?':
      usage(program);
    }
  }

  Mdist dm;
  dm.readmtx(infile);
  theInfo("Read Distance Matrix from " + infile);
  if(check){
    theInfo(dm.info());
  }else{
    theInfo("The dimension of distance matrix is: " + to_string(dm.size()));
  }

  if (!namelist.empty()) {
    // set the name of matrix by name list file
    vector<string> nmlist;
    if (Input) {
      readlist(namelist, nmlist);
      if(nmlist.size() != dm.size()){
        cerr << "The length of name list is not match size of matrix" << endl;
        exit(3);
      } 
      for (size_t i = 0; i < nmlist.size(); ++i) {
        dm.setname(i, nmlist[i]);
      }
      dm.writemtx(outfile);
    } else {
      // read the name list from matrix
      ofstream fnm(namelist.c_str());
      nmlist = dm.getNameList();
      fnm << strjoin(nmlist.begin(), nmlist.end(), "\n") << endl;
      fnm.close();
    }
  } else {
    // convert the format of distance matrix
    dm.writemtx(outfile);
  }
}
