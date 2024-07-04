/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-23 10:21:45
 */

#include "distmatrix.h"
#include "stringOpt.h"
#include <array>
#include <map>
#include <regex>
using namespace std;

void usage(string &program) {
  cerr << "\nProgram Usage: \n\n"
       << program << "\n"
       << " [ -d infile ]   distance matrix files separate by:,\n"
       << " [ -i selfile ]  the select genomes, default: none\n"
       << " [ -T taxfile ]  Replace the file name by taxon name\n"
       << " [ -H ]          Whether output html table, default: false\n"
       << " [ -l ]          Get the list of species of distance matrix\n"
       << " [ -h ]          Display this information\n"
       << endl;
  exit(1);
}

void getIndex(const string &file, const vector<string> &nmlist,
              vector<size_t> &ndxlist) {

  Mdist dm;
  dm.readmtx(file);
  map<string, int> names;

  for (long i = 0; i < dm.size(); ++i) {
    string str = dm.getname(i);
    size_t pos = str.find_last_of('>');
    if (pos != string::npos) {
      string sstr = str.substr(pos + 1);
      names[sstr] = i;
    } else {
      names[str] = i;
    }
  }

  for (auto &n : nmlist) {
    if (names.find(n) == names.end()) {
      cerr << "Cannot find genome named " << n << " in the distance matrix"
           << endl;
      exit(2);
    } else {
      ndxlist.emplace_back(names[n]);
    }
  }
}

int main(int argc, char *argv[]) {

  // get the name of file
  vector<string> dmfile{"infile"};
  string spfile;
  string strlist;
  string taxfile;
  bool html(false);
  bool list(false);
  string program = argv[0];

  char ch;
  while ((ch = getopt(argc, argv, "d:i:T:Hlh")) != -1) {
    switch (ch) {
    case 'i':
      spfile = optarg;
      break;
    case 'd':
      separateWord(dmfile, optarg, ":");
      break;
    case 'H':
      html = true;
      break;
    case 'l':
      list = true;
      break;
    case 'T':
      taxfile = optarg;
      break;
    case 'h':
      usage(program);
    case '?':
      usage(program);
    }
  }

  // for output the list
  if (list) {
    Mdist dm;
    dm.readmtx(dmfile[0]);
    for (size_t i = 0; i < dm.size(); ++i) {
      string str = dm.getname(i);
      size_t pos = str.find_last_of('>');
      if (pos != string::npos)
        str = str.substr(pos + 1);
      cout << str << endl;
    }
    return 0;
  }

  // get the specias list
  vector<string> splist;
  if (!spfile.empty()) {
    readlist(spfile, splist);
  } else if (stdin) {
    string str;
    while (cin >> str)
      splist.emplace_back(str);
  }

  // read the taxonomy map
  map<string, string> taxmap;
  if (!taxfile.empty()) {
    ifstream tax(taxfile.c_str());
    if (!tax) {
      cerr << "\nCannot found the input file " << taxfile << endl;
      exit(1);
    }

    regex matchReg("([^; ]+)[; ]+([^; ]+)");
    for (string line; getline(tax, line);) {
      if (!line.empty()) {
        smatch matchs;
        regex_search(line, matchs, matchReg);
        if (!matchs.empty()) {
          string theName = matchs[1].str();
          string theTax = matchs[2].str();
          auto pos = theTax.find("<T>");
          if (pos != string::npos)
            taxmap[theName] = theTax.substr(pos + 3);
        } else {
          cerr << "Error parse in " << line << endl;
        }
      }
    }
    tax.close();
  }

  if (splist.size() > 1) {
    // get the index
    vector<size_t> ndxlist;
    getIndex(dmfile[0], splist, ndxlist);

    // get the distance
    vector<Mdist> dmlist;
    for (auto &fname : dmfile) {
      Mdist dm;
      dm.readmtx(fname);
      dm.reduce(ndxlist);
      dmlist.emplace_back(dm);
    }

    // replace the file name by taxonomy name
    for (auto &gname : splist) {
      if (taxmap.find(gname) != taxmap.end())
        gname = taxmap[gname];
    }

    if (html) {
      for (long i = 0; i < splist.size(); ++i) {
        for (long j = i + 1; j < splist.size(); ++j) {
          cout << "<tr>"
               << "<td>" << splist[i] << "</td>"
               << "<td>" << splist[j] << "</td>";
          for (auto &dm : dmlist)
            cout << "<td>" << dm.getdist(i, j) << "</td>";
          cout << "</tr>" << endl;
        }
      }
    } else {
      for (long i = 0; i < splist.size(); ++i) {
        for (long j = i + 1; j < splist.size(); ++j) {
          cout << splist[i] << "\t" << splist[j] << "\t";
          for (auto &dm : dmlist)
            cout << dm.getdist(i, j) << "\t";
          cout << endl;
        }
      }
    }
  }
}
