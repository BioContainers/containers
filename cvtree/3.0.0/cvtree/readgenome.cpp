/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of Sciences.
 * See the accompanying Manual for the contributors and the way to cite this work.
 * Comments and suggestions welcome. Please contact
 * Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
 * 
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-03-16 12:20:55
 */

#include "readgenome.h"

GeneType::GeneType(const string &str) { init(str); };

void GeneType::init(const string &str) {
  if (str.compare("faa") == 0)
    aainit();
  else if (str.compare("ffn") == 0)
    nainit();
  else if (str.compare("fna") == 0)
    nainit();
  else {
    cerr << "unknown genome file type!\n" << endl;
    exit(1);
  }

  // use the upper case letters
  for(long i=97; i<123; ++i)
    mc[i] = mc[i-32];
};

void GeneType::aainit() {
  string aa = "ACDEFGHIKLMNPQRSTVWY";
  // set the default char
  for (auto &c : mc)
    c = aa[0];
  for (auto &c : aa) {
    mc[c] = c;
    letters.emplace_back(c);
  }

  // for the unfomrated aa
  mc['B'] = 'D';
  mc['U'] = 'C';
  mc['X'] = 'G';
  mc['Z'] = 'E';
};

void GeneType::nainit() {
  string na = "ACGT";
  for (auto &c : mc)
    c = na[0];
  for (auto &c : na) {
    mc[c] = c;
    letters.emplace_back(c);
  }

  // for RNA Sequence
  mc['U'] = 'T';

  // for the unfomrated na
  mc['R'] = 'A'; // AG
  mc['Y'] = 'T'; // CT
  mc['M'] = 'A'; // AC
  mc['K'] = 'T'; // TG
  mc['S'] = 'C'; // CG
  mc['W'] = 'A'; // AT

  mc['B'] = 'T'; // TCG
  mc['D'] = 'A'; // ATG
  mc['H'] = 'A'; // ATC
  mc['V'] = 'A'; // ACG

  mc['N'] = 'A'; // ACGT
  mc['X'] = 'A'; // ACGT
};

size_t GeneType::readgene(string &file, Genome &genome) const {
  ifstream infile(file.c_str());
  if (!infile) {
    cerr << "Cannot found the input file " << file << endl;
    exit(4);
  }
  // cout << " Read file: " << file << endl;

  for (string line; getline(infile, line);) {
    line = trim(line);
    if (line.empty() || line[0] == ';') {

    } else if (line[0] == '>') {
      genome.emplace_back();
    } else if (!genome.empty()) {
      genome.back().append(line);
    }
  }
  infile.close();

  if (genome.size() <= 0) {
    cerr << "The genome of " << file << " is empty!" << endl;
    exit(5);
  }

  size_t len(0);
  for (auto &gene : genome) {
    if (gene.size() == 0) {
      cerr << "Some empty gene in your genome file: " << file << endl;
    } else {
      checkgene(gene);
      len += gene.size();
    }
  }
  return len;
}

void GeneType::checkgene(string &str) const {
  if (*(str.rbegin()) == '*' || *(str.rbegin()) == '-')
    str.pop_back();
  for (auto &c : str)
    c = mc[c];
};
