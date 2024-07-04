/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-23 23:03:55
 */

#include "cvtree.h"

int main(int argc, char *argv[]) {
  // get the input arguments
  Args myargs(argc, argv);

  // get the main trees
  maintree(myargs);

  // do the bootstrap
  if (!myargs.blist.empty())
    bootstrap(myargs);
}

/*********************************************************************/
/******************** End of Main programin **************************/
/*********************************************************************/

Args::Args(int argc, char **argv) : treeName(""), dmName("") {

  program = argv[0];
  memorySize = getMemorySize() * 0.8;

  string pdir("cvtree/");
  string listfile("list");
  string methStr("Hao");
  string gtype("faa");
  string gdir("");
  string cvdir(pdir + "cv/");
  string listkval("5 6 7");
  bool refself(false);
  string btdir("resample/");
  long nBoot(0);

  char ch;
  while ((ch = getopt(argc, argv, "i:G:V:P:k:d:t:m:M:r:g:S:b:Rqh")) != -1) {
    switch (ch) {
    case 'i':
      listfile = optarg;
      break;
    case 'V':
      cvdir = optarg;
      if (!cvdir.empty())
        addsuffix(cvdir, '/');
      break;
    case 'G':
      gdir = optarg;
      addsuffix(gdir, '/');
      break;
    case 'P':
      pdir = optarg;
      addsuffix(pdir, '/');
      break;
    case 'r':
      refdm = optarg;
      break;
    case 'R':
      refself = true;
      break;
    case 'M':
      str2number(optarg, memorySize);
      memorySize *= 1073741824;
      break;
    case 'm':
      methStr = optarg;
      break;
    case 'k':
      listkval = optarg;
      break;
    case 'd':
      dmName = optarg;
      break;
    case 't':
      treeName = optarg;
      break;
    case 'q':
      theInfo.quiet = true;
      break;
    case 'g':
      gtype = optarg;
      break;
    case 'S':
      btdir = optarg;
      addsuffix(btdir, '/');
      break;
    case 'b':
      nBoot = str2int(optarg);
      break;
    case 'h':
      usage();
    case '?':
      usage();
    }
  }

  // check the genome type
  if (gtype != "faa" && gtype != "ffn" && gtype != "fna") {
    cerr << "Only faa/ffn/fna are supported!\n" << endl;
    exit(1);
  }

  // set the method
  if (methStr == "Hao" || methStr == "CVTree") {
    cmeth = CVmeth::create("Hao", cvdir, gtype);
    dmeth = DistMeth::create("Cosine");
    tmeth = TreeMeth::create("NJ");
  } else if (methStr == "InterSet") {
    cmeth = CVmeth::create("Count", cvdir, gtype);
    dmeth = DistMeth::create("InterSet");
    tmeth = TreeMeth::create("NJ");
  } else if (methStr == "InterList") {
    cmeth = CVmeth::create("Count", cvdir, gtype);
    dmeth = DistMeth::create("InterList");
    tmeth = TreeMeth::create("NJ");
  } else {
    vector<string> mlist;
    separateWord(mlist, methStr, ":");
    if (mlist.size() > 1) {
      cmeth = CVmeth::create(mlist[0], cvdir, gtype);
      dmeth = DistMeth::create(mlist[1]);
      if (mlist.size() > 2) {
        tmeth = TreeMeth::create(mlist[2]);
      } else {
        tmeth = TreeMeth::create("NJ");
      }
    } else {
      cerr << "Unknow Method: " << methStr << endl;
      exit(3);
    }
  }

  // get the kvalue and check
  vector<string> wd;
  separateWord(wd, listkval);
  for (auto &str : wd)
    klist.emplace_back(stoul(str));

  sort(klist.begin(), klist.end());
  uniqueWithOrder(klist);
  cmeth->checkK(klist);

  // get the input file name and genome name
  map<string, string> nameMap;
  readNameMap(listfile, flist, nameMap);
  uniqueWithOrder(flist);
  if (flist.size() < 3) {
    theInfo(
        "The number of species should be more than three.\nThere are only " +
        to_string(flist.size()) + " unique items in the list");
    exit(3);
  }

  // get the glist by flist and nameMap
  for (auto &fname : flist) {
    auto iter = nameMap.find(fname);

    // delete the suffix of file
    if (getsuffix(fname) == gtype)
      fname = delsuffix(fname);

    // set the genome name
    if (iter != nameMap.end()) {
      glist.emplace_back(iter->second);
    } else {
      glist.emplace_back(fname);
    }
  }

  // add the super folder
  if (!gdir.empty()) {
    for (auto &fname : flist) {
      fname = gdir + fname;
    }
  }

  // set the output tree name format
  if (treeName.empty()) {
    treeName = pdir + "tree/" + methStr + cmeth->cvsuff + "$.nwk";
  }

  // set the output dm name format
  if (dmName.empty()) {
#ifdef _HDF5
    dmName = pdir + "dm/" + methStr + cmeth->cvsuff + "$.h5";
#else
    dmName = pdir + "dm/" + methStr + cmeth->cvsuff + "$.gz";
#endif
  }

  // refer self distance matrix
  if (refself) {
    if (refdm.empty()) {
      refdm = dmName;
    } else {
      refdm += "," + dmName;
    }
  }

  //... Get The limit of memory size
  dmeth->setMaxMem(memorySize, flist.size(), klist.size());

  //... for bootstrap
  for (long i = 0; i < nBoot; ++i) {
    string sdir = btdir + int2lenStr(i, 4) + "/";
    blist.emplace_back(sdir);
  }
}

void Args::usage() {
  cerr << "\nThe total physical memory of this computer is " << memorySize
       << " Byte\n"
       << "\nProgram Usage: \n\n"
       << program << "\n"
       << " [ -d <dm> ]      Output distance matrix name, default: "
          "<Method>.<gtype>.<Suffix><K>\n"
       << " [ -t <nwk> ]     Output newick file name, default: "
          "<Method>.<gtype>.<Suffix><K>.nwk\n"
       << " [ -G <gdir> ]    Super directory of Input genome file, default: "
          "<current directory> \n"
       << " [ -g faa ]       Type of genome file [faa/ffn/fna], "
          "default: faa\n"
       << " [ -V <cvdir> ]   Super directory of cv files\n"
       << " [ -i list ]      Genome list for calculating, default: list\n"
       << " [ -k '5 6 7' ]   Values of k, default: K = 5 6 7\n"
       << " [ -r <matrix> ]  Reference distance matrices, split with ','\n"
       << " [ -R ]           Refer the output distance matrix\n"
       << " [ -M <N> ]       Running memory size as G roughly,\n"
       << "                  default 80% of physical memory\n"
       << " [ -m Hao ]       Select CVTree Method from Hao/InterList/InterSet, "
          "default: Hao\n"
       << " [ -S resample/ ]  cache folder for resample, default: resample/\n"
       << " [ -b <n> ]        bootstrap times, default: no bootstrape\n"
       << " [ -q ]           Run command in quiet mode\n"
       << " [ -h ]           Display this information\n"
       << endl;
  exit(1);
}

/********************************************************************************
 * @brief functions for obtaining main tree
 *
 * @param myargs
 ********************************************************************************/

void maintree(const Args &myargs) {
  // init distance matrixes
  vector<pair<size_t, Mdist>> dms(myargs.klist.size());
  initMainDM(myargs, dms);

  // get the cvs for the NAN distances
  getMainCV(myargs, dms);

  // initial the tree
  Node *aTree = Node::initial();

  for (auto &kdm : dms) {
    // do the dm and tree
    string dname = nameWithK(myargs.dmName, kdm.first);
    onetree(myargs, dname, kdm, aTree);

    // output the Tree
    string tname = nameWithK(myargs.treeName, kdm.first);
    (*aTree).outnwk(tname);
    aTree->clear();
  }
}

void initMainDM(const Args &myargs, vector<pair<size_t, Mdist>> &dms) {
#pragma omp parallel for ordered
  for (size_t i = 0; i < myargs.klist.size(); ++i) {
    dms[i].first = myargs.klist[i];
    dms[i].second.init(myargs.glist);
    if (!myargs.refdm.empty()) {
      string str = nameWithK(myargs.refdm, dms[i].first);
      dms[i].second.assign(str);
    }
#pragma omp ordered
    theInfo(dms[i].second.info() + " for K=" + to_string(dms[i].first));
  }
}

void getMainCV(const Args &myargs, const vector<pair<size_t, Mdist>> &dms) {
  theInfo("Start check and calculate CVs for " +
          to_string(myargs.flist.size()) + " Genomes");
#pragma omp parallel for
  for (size_t i = 0; i < myargs.flist.size(); ++i) {
    // get the missing K list
    vector<size_t> klist;
    for (size_t j = 0; j < myargs.klist.size(); ++j) {
      if (dms[j].second.hasNAN(i))
        klist.emplace_back(myargs.klist[j]);
    }

    // get the CVs
    myargs.cmeth->execute(myargs.flist[i], klist);
  }
  theInfo("CV Section: All CVs are obtained");
}

/********************************************************************************
 * @brief Functions for bootstrap
 *
 * @param myargs
 ********************************************************************************/

void bootstrap(const Args &myargs) {
  theInfo("\n============ Start Bootstrap Section ==========");

  // get the cv for bootstrap
  getBootCV(myargs);

  // get matrix, tree, and bootstrap value
  // initial the tree
  MarkNode *aTree = MarkNode::initial();
  Node *bTree = MarkNode::initial();

  for (auto &k : myargs.klist) {
    // get main matrix and tree name
    string dname = nameWithK(myargs.dmName, k);
    string tname = nameWithK(myargs.treeName, k);

    // initial k and matrix
    pair<size_t, Mdist> kdm;
    kdm.first = k;
    kdm.second.init(myargs.glist);

    // initial the main tree for bootstrap
    aTree->innwk(tname);
    map<string, SetSym> mgi;
    aTree->initContent(mgi);
    aTree->resetBootstrap();
    float nTree(1.0);

    for (auto &sdir : myargs.blist) {
      theInfo("For the bootstrap " + sdir);
      theInfo.indent(1);

      // get the dm and tree anme
      // reset the cvdir
      string sdname = sdir + "dm/" + getFileName(dname);
      string stname = sdir + "tree/" + getFileName(tname);
      myargs.cmeth->setCVdir(sdir + "cv/");

      // initial the distance matrix
      // do the dm and tree
      kdm.second.resetDist();
      kdm.second.assign(sdname);
      onetree(myargs, sdname, kdm, bTree);

      // bootstrap do a boot tree
      MarkNode *tTree = dynamic_cast<MarkNode *>(bTree);
      if (tTree->setAllContents(mgi)) {
        nTree += 1.0;
        set<SetSym> bset;
        tTree->getBranchContents(bset);
        aTree->bootTree(bset);
      } else {
        cerr << stname << " , and skip it" << endl;
      }

      // output the Tree
      bTree->outnwk(stname);
      bTree->clear();
      theInfo.indent(-1);
    }

    // output result
    aTree->ratioBootstrap(nTree);
    aTree->outnwk(addnamelabel(tname, "-bootstrap"));
    aTree->clear();
  }
  theInfo("============ End Bootstrap Section ==========");
}

void getBootCV(const Args &myargs) {
  theInfo("Start " + to_string(myargs.blist.size()) + " bootstrap CVs for " +
          to_string(myargs.flist.size()) + " Genomes");
  vector<string> btdirs;
  for (auto &dir : myargs.blist) {
    string cdir = dir + "cv/";
    btdirs.emplace_back(cdir);
    mkpath(cdir);
  }
#pragma omp parallel for
  for (long i = 0; i < myargs.flist.size(); ++i) {
    myargs.cmeth->bootstrap(myargs.flist[i], myargs.klist, btdirs);
  }
  theInfo("CV Section: All bootstrap CVs are obtained");
}

/********************************************************************************
 * @brief the comman functions
 *
 * @param myargs
 ********************************************************************************/

void onetree(const Args &myargs, const string &dname, pair<size_t, Mdist> &kdm,
             Node *&aTree) {
  // Calculate the NAN distance
  if (kdm.second.hasNAN()) {
    theInfo("Start calculate distance for K=" + to_string(kdm.first));
    // set the cvfile name
    vector<string> cvfile(myargs.flist);
    for (auto &str : cvfile) {
      str = myargs.cmeth->getCVname(str, kdm.first);
    }

    // do the calculation of distance
    myargs.dmeth->execute(cvfile, kdm.second);
    theInfo("End the calculate distance for K=" + to_string(kdm.first));
  }

  if (!dname.empty())
    kdm.second.writemtx(dname);

  // do the NJ algorithm and return the NJ tree
  theInfo("Start infer tree for K=" + to_string(kdm.first));
  myargs.tmeth->tree(aTree, kdm.second);
  theInfo("Get phylogenetic tree for K=" + to_string(kdm.first));
}
