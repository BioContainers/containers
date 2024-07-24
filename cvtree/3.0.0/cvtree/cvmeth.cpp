/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2022-11-24 12:50:36
 */

#include "cvmeth.h"

CVmeth *CVmeth::create(const string &methStr, const string &cvdir,
                       const string &gtype) {

  CVmeth *meth;
  if (methStr == "Hao") {
    meth = new HaoMethod;
  } else if (methStr == "Count") {
    meth = new Counting;
  } else {
    cerr << "Unknow CV Method: " << methStr << endl;
    exit(3);
  }

  meth->setCVdir(cvdir);
  meth->setg(gtype);

  return meth;
};

void CVmeth::setg(const string &gtype) {
  // set the genome type
  gsuff = "." + gtype;
  cvsuff = gsuff + cvsuff;

  // init genome type read file
  theg.init(gtype);

  // get the genome letters map to check the sequcne
  kmax = Kstr::init(theg.letters);
};

void CVmeth::checkK(const vector<size_t> &klist) {
  if (*(klist.begin()) < kmin || *(--klist.end()) > kmax) {
    cerr << "The range of k value is [" << kmin << "," << kmax << "]" << endl;
    exit(3);
  }
}

void CVmeth::setCVdir(const string &str) {
  cvdir = str;
  if (str.empty()) {
    getCVname = [this](const string &str, size_t k) {
      return str + cvsuff + to_string(k) + ".gz";
    };
  } else {
    mkpath(cvdir);
    getCVname = [this](const string &str, size_t k) {
      return cvdir + getFileName(str) + cvsuff + to_string(k) + ".gz";
    };
  }
}

void CVmeth::execute(const string &gname, const vector<size_t> &klist,
                     bool chk) {

  vector<pair<int, CVmap>> mcv;
  // check the existed cvfile
  if (chk) {
    for (auto k : klist) {
      string cvfile = getCVname(gname, k);
      if (!gzvalid(cvfile)) {
        CVmap cv;
        mcv.emplace_back(make_pair(k, cv));
      }
    }
  } else {
    for (auto k : klist) {
      CVmap cv;
      mcv.emplace_back(make_pair(k, cv));
    }
  }

  // calculate the CV
  if (!mcv.empty()) {
    // read genomes
    string gfile = gname + gsuff;
    Genome genome;
    theg.readgene(gfile, genome);

    // get the cv of all K of the genome
    cv(genome, mcv);

    // write down CVs
    for (auto item : mcv) {
      string outfile = getCVname(gname, item.first);
      writecv(item.second, outfile);
    }
  }
};

/** do bootstrape */
void CVmeth::bootstrap(const string &gname, const vector<size_t> &klist,
                       const vector<string> &btdirs, bool chk) {
  // read genomes
  string gfile = gname + gsuff;
  Genome genome;
  theg.readgene(gfile, genome);

  // get cv for samples
  for (auto &dir : btdirs) {
    // initial cv container
    vector<pair<int, CVmap>> mcv;
    if (chk) {
      for (auto k : klist) {
        string cvfile = bootCVname(dir, gname, k);
        if (!gzvalid(cvfile)) {
          CVmap cv;
          mcv.emplace_back(make_pair(k, cv));
        }
      }
    } else {
      for (auto k : klist) {
        CVmap cv;
        mcv.emplace_back(make_pair(k, cv));
      }
    }

    // get the cv of all K for the bootstrap genome
    cv(bootGenome(genome), mcv);

    // write down CVs
    for (auto item : mcv) {
      string outfile = bootCVname(dir, gname, item.first);
      writecv(item.second, outfile);
    }
  }
};

Genome CVmeth::bootGenome(const Genome &org) {
  long ng = org.size();
  random_device rd;
  mt19937 gen(rd());
  uniform_int_distribution<> distrib(0, ng - 1);

  Genome gs(ng);
  for (auto &g : gs){
    long ndx = distrib(gen);
    g = org[ndx];
  }
  
  return gs;
};

string CVmeth::bootCVname(const string &sdir, const string &gname, size_t k) {
  return sdir + getFileName(gname) + cvsuff + to_string(k) + ".gz";
}

// count the kmers
size_t CVmeth::count(const Genome &genome, size_t k, CVmap &cv) {
  size_t n(0);
  for (const auto &gene : genome) {
    // the number of kstring of the gene
    n += (gene.size() - k + 1);

    // get the first k string
    Kstr ks(gene.substr(0, k));
    CVmap::iterator iter = cv.find(ks);
    if (iter == cv.end()) {
      cv[ks] = 1.0;
    } else {
      ++(iter->second);
    }

    // get the next kstring
    for (long i = k; i < gene.size(); ++i) {
      ks.behead();
      ks.append(gene[i]);
      CVmap::iterator iter = cv.find(ks);
      if (iter == cv.end()) {
        cv[ks] = 1.0;
      } else {
        ++(iter->second);
      }
    }
  }
  return n;
};

// The Markov Method
void Counting::cv(const Genome &genome, vector<pair<int, CVmap>> &vcv) {
  for (auto &item : vcv) {
    count(genome, item.first, item.second);
  }
};

// Hao method based the Markov Model
void HaoMethod::cv(const Genome &genome, vector<pair<int, CVmap>> &vcv) {

  // require k to count
  set<int> slist;
  for (auto &item : vcv) {
    slist.insert(item.first);
    slist.insert(item.first - 1);
    slist.insert(item.first - 2);
  }

  // count k string
  map<int, CVmap> mvc;
  map<int, double> nstr;
  for (auto &k : slist) {
    CVmap cv;
    nstr[k] = count(genome, k, cv);
    mvc[k] = cv;
  }

  // get the cv with subtract
  for (auto &item : vcv) {
    long k = item.first;
    double factor = nstr[k] * nstr[k - 2] / (nstr[k - 1] * nstr[k - 1]);
    markov(mvc[k], mvc[k - 1], mvc[k - 2], factor, item.second);
  }
};

void HaoMethod::markov(const CVmap &mck, const CVmap &mckM1, const CVmap &mckM2,
                       double factor, CVmap &cv) {

  CVmap::const_iterator iter;
  for (const auto &cd : mckM2) {
    Kstr ksM2 = cd.first;
    double nksM2 = cd.second;
    for (auto &c : ksM2.charSet) {
      Kstr ksM1A = ksM2;
      ksM1A.append(c);
      iter = mckM1.find(ksM1A);
      if (iter != mckM1.end()) {
        double nksM1A = iter->second;

        for (auto &d : ksM2.charSet) {
          Kstr ksM1B = ksM2;
          ksM1B.addhead(d);
          iter = mckM1.find(ksM1B);
          if (iter != mckM1.end()) {
            double nksM1B = iter->second;
            double nks0 = factor * nksM1B * nksM1A / nksM2;

            Kstr ks = ksM1B;
            ks.append(c);
            iter = mck.find(ks);
            double nks = 0;
            if (iter != mck.end())
              nks = iter->second;
            cv[ks] = (nks - nks0) / nks0;
          }
        }
      }
    }
  }
};