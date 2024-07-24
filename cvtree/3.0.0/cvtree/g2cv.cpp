/*
 * Copyright (c) 2022  Wenzhou Institute, University of Chinese Academy of
 * Sciences. See the accompanying Manual for the contributors and the way to
 * cite this work. Comments and suggestions welcome. Please contact Dr.
 * Guanghong Zuo <ghzuo@ucas.ac.cn>
 *
 * @Author: Dr. Guanghong Zuo
 * @Date: 2022-03-16 12:10:27
 * @Last Modified By: Dr. Guanghong Zuo
 * @Last Modified Time: 2024-04-23 10:21:49
 */

#include "g2cv.h"

int main(int argc, char *argv[]) {

  // set the argures
  Args myargs(argc, argv);

  if (myargs.btdirs.empty()) {
#pragma omp parallel for
    for (long i = 0; i < myargs.flist.size(); ++i) {
      myargs.meth->execute(myargs.flist[i], myargs.klist);
    }
  } else {
#pragma omp parallel for
    for (long i = 0; i < myargs.flist.size(); ++i) {
      myargs.meth->bootstrap(myargs.flist[i], myargs.klist, myargs.btdirs);
    }
  }
};

Args::Args(int argc, char **argv) {

  program = argv[0];
  string listfile("list");
  string listkval("5 6 7");
  string onefasta("");
  string gtype("faa");
  string gdir("");
  string cvdir("");
  string methStr("Hao");
  long nBoot(0);

  char ch;
  while ((ch = getopt(argc, argv, "G:i:k:V:g:m:f:b:qh")) != -1) {
    switch (ch) {
    case 'G':
      gdir = optarg;
      addsuffix(gdir, '/');
      break;
    case 'i':
      listfile = optarg;
      break;
    case 'V':
      cvdir = optarg;
      addsuffix(cvdir, '/');
      break;
    case 'g':
      gtype = optarg;
      break;
    case 'k':
      listkval = optarg;
      break;
    case 'm':
      methStr = optarg;
      break;
    case 'f':
      onefasta = optarg;
      break;
    case 'b':
      nBoot = str2int(optarg);
      break;
    case 'q':
      theInfo.quiet = true;
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
  meth = CVmeth::create(methStr, cvdir, gtype);

  // get the kvalue
  vector<string> wd;
  separateWord(wd, listkval);
  for (auto &str : wd)
    klist.emplace_back(stoul(str));
  sort(klist.begin(), klist.end());
  uniqueWithOrder(klist);
  meth->checkK(klist);

  // get the input file name
  if (onefasta.empty()) {
    readlist(listfile, flist, 1);
    uniqueWithOrder(flist);
  } else {
    flist.emplace_back(onefasta);
  }

  for (auto &gname : flist) {
    if (getsuffix(gname) == gtype)
      gname = delsuffix(gname);
  }

  if (!gdir.empty()) {
    for (auto &gname : flist) {
      gname = gdir + gname;
    }
  }

  // for bootstrap
  if (nBoot > 0) {
    if (cvdir.empty())
      cvdir = "resample/";
    for (long i = 0; i < nBoot; ++i) {
      string sdir = cvdir + int2lenStr(i, 4) + "/cv/";
      mkpath(sdir);
      btdirs.emplace_back(sdir);
    }
  }
};

void Args::usage() {
  cerr << "\nProgram Usage: \n\n"
       << program << "\n"
       << " [ -G <gdir> ]     input genome file directory\n"
       << " [ -V <cvdir> ]    super directory for CVs, default:\n"
       << "                   for normal: <same to fasta file>\n"
       << "                   for bootstrap: ./resample/\n"
       << " [ -i list ]       input species list, default: list\n"
       << " [ -f <Fasta> ]    get cv for only one fasta \n"
       << " [ -k '5 6 7' ]    values of k, default: K = 5 6 7\n"
       << " [ -g faa ]        the type of genome file, default: faa\n"
       << " [ -m Hao/Count ]  the method for cvtree, default: Hao\n"
       << " [ -b <n> ]        bootstrap times, default: no bootstrape\n"
       << " [ -q ]            Run command in quiet mode\n"
       << " [ -h ]            Display this information\n"
       << endl;

  exit(1);
}
