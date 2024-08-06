#!/usr/bin/env perl
#format the contigs;
#perl format_scaffolds.pl <CONTIG-sequences> > <CONTIG-sequences>_format.fa
#run blasr alsvolgt;
#/opt/smrtanalysis/analysis/bin/blasr ../pacbio_reads.fasta <format-contigs> -minMatch 10 -minPctIdentity 70 -bestn 10 -noSplitSubreads -advanceExactMatches 1 -nCandidates 1 -maxAnchorsPerPosition 1 -nproc 8 -out <BLASR-output>
# perl pacbio_scaffolder.pl <BLASR-output> <CONTIG-sequences>_format.fa
use File::Path;
use Text::Wrap;
use FindBin qw($Bin);
require "getopts.pl";
$Text::Wrap::columns = 61;

my $version = "1-1";



#set the default options
my ($contigs,$contigSequences,$pacbio_reads);
my $outputfolder = "Longreads_scaf";
my $min_links = 3;
my $min_aln_length = 0;
my $min_identity = 70;
my $ratio = 0.3;
my $skip_alignment = 0;
my $threads = 8;
my $min_gap = -200;
my $min_tig_overlap = 10;

# set the options from the command line
use vars qw($opt_h $opt_t $opt_i $opt_c $opt_p $opt_a $opt_s $opt_b $opt_l $opt_x $opt_g $opt_r $opt_o $opt_k);
&Getopts('h:t:i:c:p:a:s:b:l:x:g:r:o:i:k:');

#Help message including parameter
my $helpmessage = "\nUsage SSPACE-LongRead scaffolder version $version\n\n";
$helpmessage .= "perl SSPACE-LongRead.pl -c <contig-sequences> -p <pacbio-reads>\n";

$helpmessage .= "\nGeneral options:\n";
$helpmessage .= "-c  Fasta file containing contig sequences used for scaffolding (REQUIRED)\n";
$helpmessage .= "-p  File containing PacBio CLR sequences to be used scaffolding (REQUIRED)\n";
$helpmessage .= "-b  Output folder name where the results are stored (optional, default -b '$outputfolder')\n";

$helpmessage .= "\nAlignment options:\n";
$helpmessage .= "-a  Minimum alignment length to allow a contig to be included for scaffolding (default -a $min_aln_length, optional)\n";
$helpmessage .= "-i  Minimum identity of the alignment of the PacBio reads to the contig sequences. Alignment below this value will be filtered out (default -i $min_identity, optional)\n";
$helpmessage .= "-t  The number of threads to run BLASR with\n";
$helpmessage .= "-g  Minimmum gap between two contigs\n";

$helpmessage .= "\nScaffolding options:\n";
$helpmessage .= "-l  Minimum number of links (PacBio reads) to allow contig-pairs for scaffolding (default -k $min_links, optional)\n";
$helpmessage .= "-r  Maximum link ratio between two best contig pairs *higher values lead to least accurate scaffolding* (default -r $ratio, optional)\n";
$helpmessage .= "-o  Minimum overlap length to merge two contigs (default -o $min_tig_overlap, optional)\n";

$helpmessage .= "\nOther options:\n";
$helpmessage .= "-k  Store inner-scaffold sequences in a file. These are the long-read sequences spanning over a contig-link (default no output, set '-k 1' to store inner-scaffold sequences. If set, a folder is generated named 'inner-scaffold-sequences'\n";
$helpmessage .= "-s  Skip the alignment step and use a previous alignment file. Note that the results of a previous run will be overwritten. Set '-s 1' to skip the alignment.\n";
$helpmessage .= "-h  Prints this help message\n";
die "$helpmessage\n" if($opt_h);

die "$helpmessage\nERROR: Please insert a file with contig sequences. You've inserted '$opt_c' which either does not exist or is not filled in\n" if(!$opt_c || !(-e $opt_c));
die "$helpmessage\nERROR: Please insert a file with PacBio sequences. You've inserted '$opt_p' which either does not exist or is not filled in\n" if(!$opt_p || !(-e $opt_p));
$contigSequences = $opt_c if($opt_c);
$pacbio_reads = $opt_p if($opt_p);
$outputfolder = $opt_b if($opt_b);
$min_links = $opt_l if($opt_l);
$min_aln_length = $opt_a if($opt_a);
$min_identity = $opt_i if($opt_i);
$ratio = $opt_r if($opt_r);
$skip_alignment = $opt_s if($opt_s);
$threads = $opt_t if($opt_t);
$min_gap = $opt_g if($opt_g);
$min_tig_overlap = $opt_o if($opt_o);

#Align PacBio sequences to contigs/scaffolds
if($skip_alignment == 1 && !(-e "$outputfolder/intermediate_files/BLASR_results.txt")){
  die "$helpmessage\nERROR: You've set the option -s to 1, while the BLASR alignment could not be found in the folder '$outputfolder/intermediate_files/'. Exiting...\n";
}

#Fill the log with the input settings
mkpath($outputfolder);
mkpath("$outputfolder/intermediate_files");
open(LOG,">$outputfolder/logfile.txt");
print LOG "Input:\n";
print LOG "Input contig sequences = $contigSequences\n";
print LOG "Input PacBio sequences = $pacbio_reads\n";
print LOG "\nOutput:\n";
print LOG "outputfolder = $outputfolder\n";
print LOG "\nAlignment:\n";
print LOG "Minimum identity = $min_identity\n";
print LOG "Minimum alignment length = $min_aln_length\n";
print LOG "Minimum gap = $min_gap\n";
print LOG "\nScaffolding:\n";
print LOG "Minimum links = $min_links\n";
print LOG "ratio = $ratio\n";
print LOG "Minimum overlap = $min_tig_overlap\n\n\n";
print LOG "-------------------------------------\n";

#Format the contig sequences to a better format
print getDate().": Formatting contig sequences...\n";
FormatSequences($contigSequences);

#Alignment of pacbio reads to contig sequences
if($skip_alignment != 1){
  print getDate().": Aligning PacBio reads to contigs...\n";
  system("$Bin/blasr $pacbio_reads $outputfolder/intermediate_files/contigs.fa --minMatch 5 --bestn 10 --noSplitSubreads --advanceExactMatches 1 --nCandidates 1 --maxAnchorsPerPosition 1 --sdpTupleSize 7 --nproc $threads --out $outputfolder/intermediate_files/BLASR_results.txt");
}
#set global hashes
my ($hash,$pair, $multihash,$prevread,$fullhash,$pacbioreadhash);

if($opt_k){
  print getDate().": Reading PacBio sequences...\n";
  ReadPacBioSequences($pacbio_reads);
}
print getDate().": Processing alignment output...\n";
open(BLASR,"$outputfolder/intermediate_files/BLASR_results.txt");
#Go through each BLASR alignment and detect PacBio reads that span more than one contig
while(<BLASR>){
  if(/^@/){           #SKIP header lines
    next;
  }
  chomp;
  my $line = $_;
  my ($read1, $tname1,$qstrand1,$tstrand1,$score1,$pctsimilarity1,$tstart1,$tend1,$tlength1,$qstart1,$qend1,$qlength1,$ncells1) = split(/\s+/,$line);
  my ($tignum,$tiglen);
  my $alnlen = $tend1-$tstart1;
  #skip alignments that are below given parameters by the user
  next if($tstart1 > 100 && ($tlength1-$tend1)>100 && $alnlen < $min_aln_length );  #MAKE THIS A VARIABLE!
  next if($alnlen < $min_aln_length || $pctsimilarity1 < $min_identity);
  #get contig number and its size
  $tignum = $1 if($tname1 =~ /tig(.*?)_/);
  $tiglen = $1 if($tname1 =~ /size(\S+)/);
  $score = abs($score);
  my $notadd = 0;
  #Since the alignment of BLASR is a local alignment, not the whole alignment of the contig is given. Therefore estimate the start and end on the pacbio read
  my $start1 = $qstart1-$tstart1;
  my $end1 = $qend1+($tlength1-$tend1);
  $start1 = 0 if($qstart1 < 0);
  $end1 = $qlength1 if($end1 > $qlength1);
  #if the previous read is the same read (or multiple previous reads) as the current read, check if the current contig-alignment is not overlapping with other contig-alignments (having a smaller score).
  #If the current contig-alignment does overlap, do not include it for scaffolding
  if($read1 eq $prevread){
    foreach my $t (keys %$hash){
      my ($read2, $tname2,$qstrand2,$tstrand2,$score2,$pctsimilarity2,$tstart2,$tend2,$tlength2,$qstart2,$qend2,$qlength2,$ncells2) = split(/\s+/,$t);
      $notadd = 1 if($tname2 eq $tname1);    #do not add the contig if the contig is already seen
      my $start2 = $qstart2-$tstart2;
      my $end2 = $qend2+($tlength2-$tend2);
      $start2 = 0 if($qstart2 < 0);
      $end2 = $qlength2 if($end2 > $qlength2);
      if($start1 >= $start2 && $end1 <= $end2){       #do not add the contig if it is already covered entirely by another contig
        $notadd=1;
      }else{
        my $min = $start1;
        if(($start2 <= $end1) && ($end2 >= $start1)){
          my $minend = $end2;
          $minend = $end1 if($end2 > $end1);
          my $maxstart = $start2;
          $maxstart = $start1 if($start2 < $start1);
          my $overlap = $minend - $maxstart;
          if($overlap > abs($min_gap)){        #do not add the contig if it overlaps more than 100 bases (defined by $min_gap)
            $notadd=1;
          }
        }
      }
    }
  }else{
    $hash=();
  }
  #if the current alignment has no overlap with a previous contig, add it to 'correct alignment' hash
  $fullhash->{$read1}{$start1}=$line."\t$start1\t$end1" if($notadd == 0);
  $tig_length->{$tignum}=$tiglen;
  $hash->{$line}++ if($notadd == 0);;
  $prevread = $read1;
}
close BLASR;
#for all the pacbio reads having more than 1 alignment, link the contigs together and store the links
foreach my $read (keys %$fullhash){
  my $poshash = $fullhash->{$read};
  next if(keys(%$poshash) < 2);
  my @chain;
  my ($prevtig,$prevend,$prevsize,$prevscore) = ("",0,0,0);
  foreach my $pos (sort { $a <=> $b } keys %$poshash){
    my ($qname, $ctg,$qstrand,$tstrand,$score,$pctsimilarity,$tstart,$tend,$tlength,$qstart,$qend,$qlength,$ncells,$updatestart,$updateend) = split(/\s+/,$poshash->{$pos});
    my $size=($tend-$tstart);
    print LOG "$pos = $poshash->{$pos}=".($tend-$tstart)." size\n";
    $ctg = $1 if($ctg =~ /tig(.*?)_/);
    my $strand = (($tstrand == 0))? 'f':'r';   #get the orientation of the contig on the pacbio read
    $ctg=$strand.$ctg;
    next if(substr($ctg,1) == substr($prevtig,1) && $prevtig ne "");
    push @chain,$ctg;
    #calculate the gap based on the alignment of two contigs on a pacbio read. Store the pairing-information of the two contigs, as well as the gap-information between them in an hash
    if($prevtig ne ""){
      my $gap = $updatestart - $prevend;
      my $gapseq = $pacbioreadhash->{$qname};
      my $curstart = ($updatestart+200);
      $curstart = length($gapseq) if($curstart> length($gapseq));
      my $curend = ($prevend-200);
      if($curend > 0){
        my $diff = $curstart - ($prevend-200);
        $gapseq = substr($gapseq,$curend,$diff);
      }else{
        $curend = 0;
        $gapseq = substr($gapseq,0, $curstart);
      }
      #store the pairs into a hash
      $pair->{$prevtig}{$ctg}{'reads'}{"$qname between $curend and ".$curstart." = ".length($gapseq)} = $gapseq;
      $pair->{$prevtig}{$ctg}{'links'}++;
      $pair->{$prevtig}{$ctg}{'gaps'}+=$gap;
      $pair->{$prevtig}{$ctg}{'size1'}+=$prevsize;
      $pair->{$prevtig}{$ctg}{'size2'}+=$size;
      $pair->{$prevtig}{$ctg}{'score1'}+=$prevscore;
      $pair->{$prevtig}{$ctg}{'score2'}+=$score;
      #also store the reverse pairs into the hash
      my $revprevtig = $prevtig;
      my $revctg = $ctg;
      my $revprevtig = $prevtig;
      $revprevtig =~ tr/fr/rf/;
      my $revctg = $ctg;
      $revctg =~ tr/fr/rf/;
      $gapseq = reverseComplement($gapseq);
      $pair->{$revctg}{$revprevtig}{'links'}++;
      $pair->{$revctg}{$revprevtig}{'reads'}{"$qname between $curend and ".$curstart." = ".length($gapseq)} = $gapseq;
      $pair->{$revctg}{$revprevtig}{'gaps'}+=$gap;
      $pair->{$revctg}{$revprevtig}{'size1'}+=$size;
      $pair->{$revctg}{$revprevtig}{'size2'}+=$prevsize;
      $pair->{$revctg}{$revprevtig}{'score1'}+=$score;
      $pair->{$revctg}{$revprevtig}{'score2'}+=$prevscore;

      print LOG "\tadding: $prevtig ($prevsize) with $ctg ($size)\n";
      print LOG "\tadding: $revctg ($size) with $revprevtig ($prevsize)\n";

    }
    $prevtig = $ctg;
    $prevscore = $score;
    $prevend = $updateend;
    $prevsize = $size;
  }
  print LOG "chain = ".join("->",@chain)."\n\n";
  #also add multi-linking information of the contigs on the pacbio reads in a seperate hash
  my @origchain = @chain;
  if($#chain > 0){
    my @revchain = reverse(@chain);
    for (@revchain){ tr/fr/rf/;}
    while($#chain > 0){
      my $parent = \%$multihash;
      for my $str (@chain) {
        $parent = $parent->{$str} ||= {};
        $parent->{count}++;
      }
      my $parentrev = \%$multihash;
      for my $revstr (@revchain) {
        $parentrev = $parentrev->{$revstr} ||= {};
        $parentrev->{count}++;
      }
      shift @chain;
      shift @revchain;
    }
  }
}

#do a first filtering based on minimum links set by the user (option -l). Output all remaining pairs in a file
print getDate().": Filtering contig links...\n";
my $origpair;
#Write all contig-pairs to a file
($pair,$origpair) = gapEstimation($pair);
mkpath("$outputfolder/inner-scaffold-sequences") if($opt_k);
open(PAIR,">$outputfolder/pairs.txt");
for my $p (1..keys(%$tig_length)){
  for my $i ("f","r"){
    my $ctg1 = "$i$p";
    my $pairs = $origpair->{$ctg1};
    foreach my $ctg2 (sort {$pairs->{$b}{'gaps'}<=>$pairs->{$a}{'gaps'}} keys %$pairs){
      my $tnum = $1 if($ctg2 =~/[fr](\d+)/);
      next if(!defined $pairs->{$ctg2});
      print PAIR "$ctg1 (length=$tig_length->{$p}) -> $ctg2 (length=$tig_length->{$tnum}) = $pairs->{$ctg2}{'links'} links and ".$pairs->{$ctg2}{'gaps'}." gaps and size1 = $pairs->{$ctg2}{'size1'} with score $pairs->{$ctg2}{'score1'} and size2 = $pairs->{$ctg2}{'size2'} with score $pairs->{$ctg2}{'score2'}\n";
    }
  }
}
close PAIR;

#Write all multi-contig-pairs to a file
open(MULTI,">$outputfolder/multipairs.txt");
for my $p (1..keys(%$tig_length)){
  for my $i ("f","r"){
    if(defined $multihash->{"$i$p"}){
      print MULTI "$i$p ".$multihash->{"$i$p"}{'count'}." = 1\n";
      my $mhash = $multihash->{"$i$p"};
      dumpHash($mhash,"   ","",1,0);
    }
  }
}
close MULTI;

#Filter the links in two iterations
$pair = FilterLinks($pair);

$pair = FilterLinks($pair);

#write filtered pairs and detected repeats to a file
open(PAIR,">$outputfolder/pairs_filt.txt");
open(REPEAT,">$outputfolder/repeats.txt");
#REPEAT DETECTION! A repeat is detected if it has two or more links with other contigs
my ($repeathash);
for my $p (1..keys(%$tig_length)){
  for my $i ("f","r"){
    my $ctg1 = "$i$p";
    my $pairs = $pair->{$ctg1};
    my $numkeys = keys(%$pairs);
    if($numkeys>1){# && $tig_length->{$p} < 15000){
      $repeathash->{$p}++;
      print REPEAT "repeat = $ctg1 = ".$tig_length->{$p}." length\n";
      foreach my $ctg2 (sort {$pairs->{$b}{'gaps'}<=>$pairs->{$a}{'gaps'}} keys %$pairs){
        my $tnum = $1 if($ctg2 =~/[fr](\d+)/);
        print REPEAT "\t$ctg1 (length=$tig_length->{$p}) -> $ctg2 (length=$tig_length->{$tnum}) = $pairs->{$ctg2}{'links'} links and ".$pairs->{$ctg2}{'gaps'}." gaps and size1 = $pairs->{$ctg2}{'size1'} with score $pairs->{$ctg2}{'score1'} and size2 = $pairs->{$ctg2}{'size2'} with score $pairs->{$ctg2}{'score2'}\n";
      }
    }
    foreach my $ctg2 (sort {$pairs->{$b}{'gaps'}<=>$pairs->{$a}{'gaps'}} keys %$pairs){
      my $tnum = $1 if($ctg2 =~/[fr](\d+)/);
      print PAIR "$ctg1 (length=$tig_length->{$p}) -> $ctg2 (length=$tig_length->{$tnum}) = $pairs->{$ctg2}{'links'} links and ".$pairs->{$ctg2}{'gaps'}." gaps and size1 = $pairs->{$ctg2}{'size1'} with score $pairs->{$ctg2}{'score1'} and size2 = $pairs->{$ctg2}{'size2'} with score $pairs->{$ctg2}{'score2'}\n";
    }
  }
  print PAIR "\n";
}
close PAIR;
close REPEAT;

#Begin Scaffolding. Start with largest contig
print getDate().": Scaffolding...\n";
open(EVI,">$outputfolder/scaffold_evidence_intermediate.txt");
print LOG "-----SCAFFOLDING--------\n";
my ($usedpair,$finalused,$finalscaffolds);
my $scafnum = 0;
foreach my $tig (sort {$tig_length->{$b}<=>$tig_length->{$a}} keys %$tig_length){
    my $ctg = "f$tig";
    next if(defined $finalused->{$tig});       #do not make scaffold with contig if it has already been used during scaffolding
    my $finalpath;
    $scafnum++;
    for(my $i = 0; $i <= 1; $i++){
      $ctg = "r$tig" if($i==1);                #Reverse a contig
      $usedpair->{$tig}=$i."|$tig|0";
      my $curpath = $ctg;
      my ($extendpath,$count) = (1,0);
      my $foundpairs;
      while($extendpath){
        $extendpath = 0;
        my ($multictgs, $multihash_sub);
        my $path;
        my $ls = $pair->{$ctg};
        my $VERBOSE = 1;
        if(keys(%$ls) == 1){
          foreach my $tig2 (keys %$ls){
            $path = $tig2;
          }
          print LOG "5) Found $path\n" if($path ne "" && $VERBOSE ==1);
        }else{
          if($count > 4 && $path eq ""){
            my @arraypath = split(",",$curpath);
            $multihash_sub = $multihash->{$arraypath[($#arraypath-4)]}{$arraypath[($#arraypath-3)]}{$arraypath[($#arraypath-2)]}{$arraypath[($#arraypath-1)]}{$arraypath[$#arraypath]};
            $path = getPathMulti($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg,$ratio);
          #  print "0) Found $path\n" if($path ne "" && $VERBOSE ==1);
          }
          if($count >= 3 && $path eq "" || $origpair->{$ctg}{$path}{'links'} < $min_links){
            my @arraypath = split(",",$curpath);
            $multihash_sub = $multihash->{$arraypath[($#arraypath-3)]}{$arraypath[($#arraypath-2)]}{$arraypath[($#arraypath-1)]}{$arraypath[$#arraypath]};
            $path = getPathMulti($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg,$ratio);
            print LOG "1) Found $path\n";# if($path ne "" && $VERBOSE ==1);
          }if(($count >= 2 && $path eq "") || $origpair->{$ctg}{$path}{'links'} < $min_links){
            my @arraypath = split(",",$curpath);
            $multihash_sub = $multihash->{$arraypath[($#arraypath-2)]}{$arraypath[($#arraypath-1)]}{$arraypath[$#arraypath]};
            $path = getPathMulti($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg,$ratio);
            print LOG "2) Found $path\n";# if($path ne "" && $VERBOSE ==1);
          }if(($count >= 1 && $path eq "") || $origpair->{$ctg}{$path}{'links'} < $min_links){
            my @arraypath = split(",",$curpath);
            $multihash_sub = $multihash->{$arraypath[($#arraypath-1)]}{$arraypath[$#arraypath]};
            $path = getPathMulti($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg,$ratio);
            print LOG "3) Found $path = ".$arraypath[($#arraypath-1)]."->".$arraypath[$#arraypath]." and $origpair->{$ctg}{$path}{'links'} links between $ctg and $path\n";# if($path ne "" && $VERBOSE ==1);
          }if($path eq "" || $origpair->{$ctg}{$path}{'links'} < $min_links){
            $multihash_sub = $multihash->{$ctg};
            $path = getPathMulti($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg,$ratio);
            print LOG "4) Found $ctg -> $path = $origpair->{$ctg}{$path}{links} links \n";# if($path ne "" && $VERBOSE ==1);
          }
        }
        if($path ne ""){
          $extendpath = 1;                     #extend if a path is found
        }
        my $checkpath = $path;
        if($i == 1){
          $checkpath =~ tr/[fr]/[rf]/;
        }
        my $tnum = $1 if($path =~/[fr](\d+)/);
        #do not extend if the extended path is already used and is not defined as a repeat
        if((defined $usedpair->{$tnum} && !defined $repeathash->{$tnum}) || !defined $origpair->{$ctg}{$path}{'links'}){
          $extendpath = 0;

        }else{
          #Otherwise extend the scaffold-path with the found contig
          print LOG "\t\tCUR = $curpath and adding $path with $origpair->{$ctg}{$path}{'links'}\n" if($VERBOSE);
          $usedpair->{$checkpath}=$i."|$tig|$count";
          $usedpair->{$tnum}=$i."|$tig|$count";
          $foundpairs->{"$ctg:$path"}++;
          $extendpath = 0 if($foundpairs->{"$ctg:$path"} > 20);
          $ctg = $path;
          $curpath.=",$path";
          $count++;
        }
      }#FINISHED SEARCHING PATH

      #If scaffold is generated, clean 'repeated' contigs from the edges of the contigs
      if($i == 0){
        $curpath =~ s/,$//;
        my @patharray = split(",",$curpath);
        @patharray = reverse(@patharray);
        for (@patharray){ tr/fr/rf/;}
        for my $t (0..$#patharray){
          my $rnum = $1 if($patharray[$t] =~/[fr](\d+)/);
          if(defined $repeathash->{$rnum} && $start == 0){    #remove repeated contigs at start or end of scaffold
            $patharray[$t] =~ tr/[fr]/[rf]/;
            $curpath =~ s/,$patharray[$t]$//;
          }else{
            last;
          }

        }
      }
      elsif($i == 1){
        my @patharray = split(",",$curpath);
        @patharray = reverse(@patharray);
        for (@patharray){ tr/fr/rf/;}
        $curpath = join(",",@patharray[0..($#patharray-1)]);
        $curpath .=",";
        my @array = split(",",$curpath);
        for my $t (0..$#array){
          my $rnum = $1 if($patharray[$t] =~/[fr](\d+)/);
          if(defined $repeathash->{$rnum} && $start == 0){     #remove repeated contigs at start or end of scaffold
            $curpath =~ s/^$array[$t],//;
          }else{
            last;
          }

        }
      }
      #make the final scaffold path and store it
      $finalpath = $curpath.$finalpath;
      if($i==1){
        my @finalpatharray = split(",",$finalpath);
        for my $ctgfinal (@finalpatharray){
          my $subctgfinal = substr($ctgfinal,1);
          $finalused->{$subctgfinal}++;
        }
        $finalpath =~ s/,$//;
        $finalpath =~ s/^,//;
        $finalscaffolds->{$scafnum}=$finalpath;
        #write the initial scaffold to a file
        CreateScaffolds($scafnum,$finalpath,"unknown");
        print LOG "Initial path: $scafnum ($tig) = $finalpath\n";
      }

    }
}
close EVI;

#Try to combine the scaffolds in super-scaffolds based on a path search of each initial scaffold
print getDate().": Finishing\n";
open(SCAFFOLDS,">$outputfolder/scaffolds.fasta");
open(EVI,">$outputfolder/scaffold_evidence.txt");
my ($usedScaf,$newscafHash);
my $finalscafnum = 0;
foreach my $snum1 (sort {$a<=>$b} keys %$finalscaffolds){
  my ($extension,$it) = (1,0);
  my $circulair = "Lineair";
  next if($usedScaf->{$snum1});
  my $FScaf1=$finalscaffolds->{$snum1};

  if(defined $repeathash->{substr($FScaf1,1)}){
    $repeatscaffolds->{$FScaf1}=$snum1;
  }
  next if(SearchAlreadyUsedScaffold($FScaf1,$usedScaf));
  $finalscafnum++;
  #try to extend the current initial scaffold based on a path search of the initial scaffold with other scaffolds
  while($extension){
    $it++;
    $extension = 0;
    my @scafsplit1 = split(",",$FScaf1);
    my ($search1,$search2) = ($scafsplit1[0],$scafsplit1[$#scafsplit1]);
    $search1 =~ tr/[fr]/[rf]/;
    my $ori = "f";
    foreach my $cont ($search2,$search1){
      next if($circulair eq "Circulair");
      my $linkedScafs;
      foreach my $snum2 (keys %$finalscaffolds){
        next if(defined $usedScaf->{$snum2});
        my $FScaf2=$finalscaffolds->{$snum2};
        my @scafsplit2 = split(",",$FScaf2);
        my ($hashf,$hashr);
        my ($numlinksf,$numlinksr) = (0,0);
        #Find all possible connections with the current scaffold
        ($hashf,$numlinksf,$totallinksf) = SearchPath($multihash->{$cont},$scafsplit2[0],0,0,"",$hashf,0);
        if($numlinksf>0){
          foreach my $f (sort {$hashf->{$b}{'best'}<=>$hashf->{$a}{'best'}} keys %$hashf){
            $linkedScafs->{"f$snum2"}{'totallinks'}=$hashf->{$f}{'total'};
            $linkedScafs->{"f$snum2"}{'linksbest'}=$hashf->{$f}{'best'};
            $linkedScafs->{"f$snum2"}{'bestpath'}=substr($f,1).",".$FScaf2;
            $linkedScafs->{"f$snum2"}{'extpath'}=substr($f,1);
            $linkedScafs->{"f$snum2"}{'searchctg'}=$scafsplit2[0];
            print LOG "$it.f: Extend $FScaf1 with ($snum2, $cont) ".substr($f,1).",".$FScaf2." with $numlinksf links and best = $hashf->{$f}{'best'} and total = $hashf->{$f}{'total'}\n";
            last;
          }
        }
        $scafsplit2[$#scafsplit2] =~ tr/[fr]/[rf]/;
        ($hashr,$numlinksr,$totallinksr) = SearchPath($multihash->{$cont},$scafsplit2[$#scafsplit2],$links,0,"",$hashr,0);
        if($numlinksr>0){
          foreach my $r (sort {$hashr->{$b}{'best'}<=>$hashr->{$a}{'best'}} keys %$hashr){
            my $rev_r = substr($r,1);
            $linkedScafs->{"r$snum2"}{'totallinks'}=$hashr->{$r}{'total'};
            $linkedScafs->{"r$snum2"}{'linksbest'}=$hashr->{$r}{'best'};
            $linkedScafs->{"r$snum2"}{'bestpath'}=$rev_r.",".reversePath($FScaf2);
            $linkedScafs->{"r$snum2"}{'extpath'}=$rev_r;
            $linkedScafs->{"r$snum2"}{'searchctg'}=$scafsplit2[$#scafsplit2];
             print LOG "$it.r: Extend $FScaf1 with ($snum2, $cont) ".$rev_r."|||".$FScaf2." with $numlinksr links and best = $hashr->{$r}{'best'} and total = $hashr->{$r}{'total'}\n";
            last;
          }
        }
      }
      #determine the best possible scaffold path
      if(keys(%$linkedScafs) > 0){
        my ($best,$link1,$link2,$c,$extend) = (0,0,0,0,"");
        #FILTER PATHS:
        my $linkedScafsFilt;
        foreach my $scafLink1 (sort {$linkedScafs->{$b}{'totallinks'}<=>$linkedScafs->{$a}{'totallinks'}} keys %$linkedScafs){
           my $searchlink1 = $linkedScafs->{$scafLink1}{'searchctg'};
           foreach my $scafLink2 (sort {$linkedScafs->{$b}{'totallinks'}<=>$linkedScafs->{$a}{'totallinks'}} keys %$linkedScafs){
             next if($searchlink1 eq $linkedScafs->{$scafLink2}{'searchctg'});
             my @searchlinks2 = split(",",$linkedScafs->{$scafLink2}{'bestpath'});
             foreach my $searchlink2 (@searchlinks2){
               if($searchlink1 eq $searchlink2){
                 print LOG "\tREMOVING $searchlink1: $searchlink1  ($linkedScafs->{$scafLink1}{'bestpath'})  vs $searchlink2 ($linkedScafs->{$scafLink2}{'bestpath'})\n";
                 $linkedScafsFilt->{$scafLink1}++ ;
               }
             }
           }
        }
        #get the two best possible scaffold paths
        foreach my $scafLink (sort {$linkedScafs->{$b}{'totallinks'}<=>$linkedScafs->{$a}{'totallinks'}} keys %$linkedScafs){
          next if(defined $linkedScafsFilt->{$scafLink});
          print LOG "REMAINING: $linkedScafs->{$scafLink}{'bestpath'} with $linkedScafs->{$scafLink}{'totallinks'}\n";
          if(++$c == 1){
            $link1 = $linkedScafs->{$scafLink}{'totallinks'};
            $best = $scafLink;
          }else{
            if($link1 > 1){
              if($linkedScafs->{$scafLink}{'totallinks'} > 1){
                $link2 = $linkedScafs->{$scafLink}{'totallinks'};
              }
            }else{
              $link2 = $linkedScafs->{$scafLink}{'totallinks'};
            }
            last;
          }
        }
        #If there are two possible contig paths, calculate the ratio of links.
        if($link2 > 0){
          my $scafratio = $link2 / $link1;
          print LOG "ratio = $best: $scafRatio $link2 and $link1\n";
          if($scafratio < $ratio){
            $extend = $best;
          }
        }else{
          #Otherwise just simply take the best path
          $extend = $best;
        }
        #Extend the current scaffold and determine if there is a possible circularization
        if($extend ne ""){
          print LOG "ADDING: $ori$snum1 ($FScaf1) with $snum2=$extend ($linkedScafs->{$extend}{'extpath'} and $linkedScafs->{$extend}{'bestpath'})\n";
          $extension = 1;
          if("$ori$snum1" eq $extend){
            print LOG "Possible circulair scaffold = $FScaf1 + $linkedScafs->{$extend}{'extpath'} = extend=$extend\n";
            $circulair = "Circulair";
            $extension = 0;
            if($extend =~ /r/){
              $FScaf1.= ",".reversePath($linkedScafs->{$extend}{'extpath'});
            }else{
              $FScaf1.= ",".$linkedScafs->{$extend}{'extpath'};
            }
          }else{
            if(defined $usedScaf->{substr($extend,1)}){
              $extension = 0;
            }else{
              $linkedScafs->{$extend}{'bestpath'} =~ s/^,//;
              if($ori eq "f"){
                $FScaf1.= ",".$linkedScafs->{$extend}{'bestpath'};
              }else{
                $FScaf1= reversePath($linkedScafs->{$extend}{'bestpath'}).",$FScaf1";
              }
              $usedScaf->{substr($extend,1)}=$FScaf1;
              print LOG "Used adding = ".substr($extend,1)."\n";
              $finalscaffolds->{$snum1}=$FScaf1;
            }
          }
        }
      }
      $ori = "r";
    }
  }
  #Make the final scaffold and store the sequences in a final
  CreateScaffolds($finalscafnum,$FScaf1,$circulair);
  print LOG "$finalscafnum = $FScaf1\n";
  $usedScaf->{$snum1}= $FScaf1;
}
print LOG "Checking for remaining repeats\n";
foreach my $repeat (keys %$repeatscaffolds){
  #check if repeat is already used, otherwise output the repeat in a seperate scaffold
  if(!SearchAlreadyUsedScaffold($repeat,$finalscaffolds)){
    $finalscafnum++;
    print LOG "\tScaffold $finalscafnum: $repeat\n";
    CreateScaffolds($finalscafnum,"$repeat","REPEAT");
  }
}
print "Scaffolded ".keys(%$tig_length)." contigs into $finalscafnum scaffolds\n";
close LOG;

#END OF MAIN SCRIPT

#----------------------------------------------------------------------------------------------------------

#FUNCTION TO FORMAT THE PROVIDED CONTIG/SCAFFOLD SEQUENCES BY THE USER
sub FormatSequences{
  my ($input_file) = @_;
  open (INFILE, $input_file) || die "Can't open contig sequences file ($input_file). Please provide a valid input file\n";

  my ($seq,$countContig) = ("",0);
  open(OUT,">$outputfolder/intermediate_files/contigs.fa");
  while (<INFILE>) {
    chomp;
    $seq.=$_ if(eof(INFILE));
    if ($_ =~ /^[>]/ || eof(INFILE)) {
      if($seq ne ""){
        $seq = uc($seq);
        my $len = length($seq);
        $countContig++;
        print OUT ">contig$countContig"."_size$len\n$seq\n";
        $tig_length->{$countContig} = $len;
        $contigs->{$countContig}{'name'} = "contig$countContig"."_size$len";
        $contigs->{$countContig}{'seq'} = $seq;
        $seq = "";
      }
    }
    else {
      $seq .= $_;
    }
  }
  close OUT;
}

#FUNCTION TO READ THE PROVIDED PACBIO SEQUENCES OF THE USER
sub ReadPacBioSequences{
  my ($input_file) = @_;
  open (INFILE, $input_file) || die "Can't open PacBio sequences file ($input_file). Please provide a valid input file\n";
  #CHECK IF PacBio sequences are in fastA or fastQ
  my $fastq=1;
  my $header = <INFILE>;
  $fastq = 0 if($header =~ /^>/);
  close INFILE;
  open (INFILE, $input_file);
  my ($seq,$name) = ("","");
  my $getSeq = 0;
  while (<INFILE>) {
    chomp;
    $seq.=$_ if(eof(INFILE) && !$fastq);
    if (/\>(\S+)/ || /\@(\S+)/ || eof(INFILE)){
      $pacbioreadhash->{$name} = $seq if($seq ne "");
      $name = $1;
      $getSeq = 1;
      $seq = "";
    }elsif(/\+/){
      $getSeq = 0;
    }elsif($getSeq){
      $seq.=$_;
    }
  }
  close INFILE;
}


#FUNCTION TO SEARCH IF SCAFFOLD HAS ALREADY BEEN USED
sub SearchAlreadyUsedScaffold{
  my ($scaffold,$usedScaffolds)= @_;
  $scaffold = ",$scaffold,";
  my $revscaffold = reversePath($scaffold);
  foreach my $used (keys %$usedScaffolds){
    $used = ",$usedScaffolds->{$used},";
    if($used =~ /$scaffold/){
     return 1;
    }elsif($used =~ /$revscaffold/){
     return 1;
    }
  }
  return 0;
}


#FUNCTION TO REVERSE A SCAFFOLD PATH
sub reversePath{
  my ($path) = @_;
  my @chain = split(",",$path);
  my @revchain = reverse(@chain);
  for (@revchain){ tr/fr/rf/;}
  return join(",",@revchain);
}


#FUNCTION TO SEARCH FOR ALL POSSIBLE EXTENSIONS OF AN INITIAL SCAFFOLD
sub SearchPath{
  my ($hash,$search,$links,$linkstotal,$path,$pathshash,$ct) = @_;
  $ct++;
  foreach my $h (sort {$hash->{$b}{'count'}<=>$hash->{$a}{'count'}} keys %$hash){
    next if($h eq 'count');
    $linkstotal = 0 if($ct == 1);
    if($h eq $search){
      $pathshash->{$path}{'best'}=($linkstotal+$hash->{$h}{count});
      $pathshash->{$path}{'total'}+=($linkstotal+$hash->{$h}{count});
      $links+= $hash->{$h}{count};
    }
    my $newpath = $path.",$h";
    ($pathshash,$links)=SearchPath($hash->{$h},$search,$links,($linkstotal+$hash->{$h}{count}),$newpath, $pathshash,$ct);
  }
  return $pathshash,$links,$linkstotal;
}



#FUNCTION TO CREATE SCAFFOLDS BY LINKING THE CONTIGS IN THE SCAFFOLD PATH.
#IF A POSITIVE GAP IS FOUND, ADD 'N' CHARACTERS BASED ON THE PREDICTED GAP COUNT
#IF A NEGATIVE GAP IS FOUND, TRY TO FIND AN OVERLAP AND MERGE
sub CreateScaffolds{
  my ($scafnum,$scaffoldpath,$circulair) = @_;

  my @chain = split(",",$scaffoldpath);
  my ($previoustig,$currentscaffold,$tigline,$prevlinetig,$gapnum) = ("","","","",1);
    foreach my $contig(@chain){
      my $infoline = "";
      #get the number of gaps and number of links
      my $gaps = $origpair->{$previoustig}{$contig}{'gaps'};
      my $links = $origpair->{$previoustig}{$contig}{'links'};
      my $curtig = $contig;
      $curtig =~ s/[rf]//;
      my $addseq =$contigs->{$curtig}{'seq'};

      if($contig =~ /^r/){
        $addseq = reverseComplement($addseq);
      }if($currentscaffold eq ""){
        $currentscaffold = $addseq;
      }else{
        #store information
        $infoline .= "links$links"."|gaps$gaps";
        #If a negative gap is found, try to merge the sequences
        if($gaps <= 0){
          my ($newseq, $overlap) = MergeTwoContigs($currentscaffold,$addseq,150);
          if($overlap >= $min_tig_overlap){
            $infoline .= "|merged$overlap";
            $currentscaffold = $newseq;
          }else{
            #If no overlap is found, add a single 'n' character and store inner-scaffold sequences of the long-reads provided
            if($opt_k){
              my $readsperpair = $origpair->{$previoustig}{$contig}{'reads'};
              open(READPAIRS,">$outputfolder/inner-scaffold-sequences/scaffold$scafnum"."_gap$gapnum"."_$previoustig"."_with_$contig"."_".keys(%$readsperpair)."-pairs.fa");
              foreach my $readpair(keys %$readsperpair){
                print READPAIRS ">$readpair\n$readsperpair->{$readpair}\n";
              }
              close READPAIRS;
            }
            $gapnum++;
            $currentscaffold .= "n".$addseq;
          }
        }else{
        #If a positive gap is found, add N's and store inner-scaffold sequences of the long-reads provided
          if($opt_k){
            my $readsperpair = $origpair->{$previoustig}{$contig}{'reads'};
            open(READPAIRS,">$outputfolder/inner-scaffold-sequences/scaffold$scafnum"."_gap$gapnum"."_$previoustig"."_with_$contig"."_".keys(%$readsperpair)."-pairs.fa");
            foreach my $readpair(keys %$readsperpair){
              print READPAIRS ">$readpair\n$readsperpair->{$readpair}\n";
            }
            close READPAIRS;
          }
          $gapnum++;
          $currentscaffold .= ("N" x $gaps).$addseq;
        }
      }
      $tigline .= $prevlinetig if($prevlinetig ne "");
      $tigline .= "|$infoline\n" if($previoustig ne "");
      $prevlinetig = "$contig|size$tig_length->{$curtig}";
      $previoustig = $contig;
    }
    $tigline .= $prevlinetig if($prevlinetig ne "");
    #Print the results
    print EVI ">scaffold$scafnum|size".length($currentscaffold)."|tigs".($#chain+1)."|$circulair\n";
    print EVI "$tigline\n\n";
    print SCAFFOLDS ">scaffold$scafnum|size".length($currentscaffold)."\n";
    print SCAFFOLDS wrap('', '', $currentscaffold)."\n";
    $numcontigs += ($#chain+1);
}

#Make a dump of the multi-contig-link hash
sub dumpHash {
  my ($hash, $indent, $ext, $ct, $verbose) = @_;
  $ct++;
  foreach my $child (sort {$hash->{$b}{'count'}<=>$hash->{$a}{'count'}} keys %$hash){
      next if $child eq 'count';
      $ext->{$ct}{"$child"}+= $hash->{$child}{count};
      print MULTI "$indent$child $hash->{$child}{count} = $ct\n";
      $ext = dumpHash ($hash->{$child}, "$indent   ", $ext, $ct, $verbose);
  }
  return $ext;
}

#Check if a specific contig is within a path of another contig
sub checkInPath{
  my ($findhash,$tig2,$inittig,$times) = @_;
  ++$times;
  foreach my $tig (keys %$findhash){
    my $findpathnext = $findhash->{$tig};
    if($tig eq $tig2 && $times <= 2){
      return 1,$times;
    }else{
      my ($checking,$searches) = checkInPath($findpathnext,$tig2,$inittig,$times);
      if($checking == 1 && $searches <= 2){
        return 1,$searches;
      }
    }
  }
  return 0,0;
}

#Search for the best path of a contig
sub getPath {
  my ($hash, $indent, $ext, $ct, $verbose,$output, $prev, $minratio, $filthash) = @_;
  $ct++;
  my $numkeys = keys(%$filthash);
  if($numkeys > 1){
    my ($childshash,$removehash,$used);
    foreach my $child1 (sort {$filthash->{$b}{'links'}<=>$filthash->{$a}{'links'}} keys %$filthash){
      my $childnum1 = $1 if($child1 =~/[fr](\d+)/);
      next if $child1 eq 'count';
      next if(!defined $pair->{$prev}{$child1});
      next if(defined $used->{$child1});
      $used->{$child1}++;
      foreach my $child2 (keys %$filthash){
        my $childnum2 = $1 if($child2 =~/[fr](\d+)/);
        next if(defined $used->{$child2});
        next if($child1 eq $child2);
        next if $child2 eq 'count';
        (my $revchild2 = $child2) =~ tr/[fr]/[rf]/;
        if((defined $hash->{$child1}{$child2} && defined $pair->{$child1}{$child2}) || (defined $hash->{$child1}{$revchild2} && defined $pair->{$child1}{$revchild2}) || $childnum1 == $childnum2){
          $removehash->{$child2}++;
          $used->{$child2}++;
        }else{
          my $searchpath = $hash->{$child1};
          #Remove a contig if it is within a path of another contig
          my ($check,$numsearches) = checkInPath($searchpath,$child2,$child1,-1);
          if($check == 1){# && defined $pair->{$prev}{$child2}){
            $removehash->{$child2}++;
            $used->{$child2}++;
          }
        }
      }
    }
    my $remaining;
    my $remnum=0;
    foreach my $child (sort {$hash->{$b}{'links'}<=>$hash->{$a}{'links'}} keys %$filthash){
        next if $child eq 'count';
        if(!defined $removehash->{$child}){
          $remaining = $child;
          $remnum++;
        }
    }
    $ext->{$ct}{"$remaining"}+= $hash->{$remaining}{count};
    if($remnum == 1){
      return $remaining;
    }else{
      my $c = 1;
      my ($link1,$link2,$lctg1,$lctg2);
      foreach my $child1 (sort {$filthash->{$b}{'links'}<=>$filthash->{$a}{'links'}} keys %$filthash){
        next if(defined $removehash->{$child1});
        next if($child1 eq "count");
         if($c == 1){
            $link1 = $filthash->{$child1}{'links'};
            $lctg1 = $child1;
         }elsif($c == 2){
            $link2 = $filthash->{$child1}{'links'};
            $lctg2 = $child1;
         }
         $c++;
         last if($c > 2);
      }
      my $ratio = $link2 / $link1;
      if($ratio < $minratio){
        return $lctg1;
      }else{
        my $returntigs;
        foreach my $child1 (sort {$filthash->{$b}{'links'}<=>$filthash->{$a}{'links'}} keys %$filthash){
          next if(defined $removehash->{$child1});
          $returntigs.="$child1,";
        }
        chop $returntigs;
        return $returntigs;
      }
    }
  }else{
    for my $child (sort keys %$filthash) {
      return $child;
    }
  }
  return "";
}

#Search for the best path of a contig
sub getPathMulti{
  my ($hash, $indent, $ext, $ct, $verbose,$output, $prev, $minratio) = @_;
  $ct++;

  my $numkeys = keys(%$hash);
  if($numkeys > 2){
    my $childshash;
    my $removehash;
    my $used;
    #print "\tSTART = $prev\n";
    my $prevcount = 0;
    foreach my $child1 (sort {$hash->{$b}{'count'}<=>$hash->{$a}{'count'}} keys %$hash){
      my $childnum1 = $1 if($child1 =~/[fr](\d+)/);
      next if $child1 eq 'count';
      next if(!defined $pair->{$prev}{$child1});
      next if(defined $used->{$child1} && $hash->{$child1}{count} < $prevcount);
      print LOG "\t\tNOW AT: $prev vs $child1 = $hash->{$child1}{count} and prevcount = $prevcount\n";
      $prevcount = $hash->{$child1}{count};
      foreach my $child2 (keys %$hash){
        my $childnum2 = $1 if($child2 =~/[fr](\d+)/);
        next if($child1 eq $child2);
        next if $child2 eq 'count';
        (my $revchild2 = $child2) =~ tr/[fr]/[rf]/;
       if((defined $hash->{$child1}{$child2} && defined $pair->{$child1}{$child2}) || (defined $hash->{$child1}{$revchild2} && defined $pair->{$child1}{$revchild2}) || $childnum1 == $childnum2){

          print LOG "\t\tremoving $child2\n";
          $removehash->{$child2}++;
          $used->{$child2}++;
        }else{
          my $searchpath = $hash->{$child1};
          my ($check,$numsearches) = checkInPath($searchpath,$child2,$child1,-1);
          if($check == 1){# && defined $pair->{$prev}{$child2}){
            print LOG "\t\tremoving $child2\n";
            $removehash->{$child2}++;
            $used->{$child2}++;
          }
        }
      }
      $prevcount =  $hash->{$child1}{count};
    }
    my $remaining;
    my $remnum=0;
    for my $child (sort keys %$hash) {
       next if $child eq 'count';
        if(!defined $removehash->{$child} && defined $pair->{$prev}{$child}){
          print LOG "\t\tREMAINING = $child = $hash->{$child}{'count'}\n";
          $remaining = $child;
          $remnum++;
        }
    }
   $ext->{$ct}{"$remaining"}+= $hash->{$remaining}{count};
    if($remnum == 1){
      return $remaining;
    }else{
      my $c = 1;
      my ($link1,$link2,$lctg1,$lctg2) = (0,0,"","");
      foreach my $child1 (sort {$hash->{$b}{'count'}<=>$hash->{$a}{'count'}} keys %$hash){
        next if(defined $removehash->{$child1});
        next if $child1 eq 'count';
        if($c == 1){
            $link1 = $hash->{$child1}{'count'};
            $lctg1 = $child1;
         }else{
            $link2 = $hash->{$child1}{'count'};
            $lctg2 = $child1;
         }
         $c++;
         last if($c > 2);
      }
      return "" if($lctg1 eq "");
      return $lctg1 if($lctg2 eq "");
      return $lctg1 if($link2 eq "" || $link2 == 0);
      return $lctg1 if($lctg2 eq "");

      my $ratio = $link2 / $link1;
      print LOG "\t\tRATIO $lctg2 ($link2) and $lctg1 ($link1) = $ratio compared to $minratio\n";
      if($ratio < $minratio){
        return $lctg1;
      }else{
        return "";
      }
    }


  }else{
    for my $child (sort keys %$hash) {
      next if $child eq 'count';
      $ext->{$ct}{"$child"}+= $hash->{$child}{count};
      return $child;
      $output = getPath($hash->{$child}, "$indent   ", $ext, $ct, $verbose,"$output,$child",$child);
    }
  }
  return "";
}

#estimation the gap based on the average number of gaps of each contig link found
sub gapEstimation{
  my ($tmphash) = @_;
  my $newpairhash,$allpairhash;;
  foreach my $ctg1 (keys %$tmphash){
    my $ls = $tmphash->{$ctg1};
    foreach my $ctg2 (keys %$ls){
      if($ls->{$ctg2}{'links'} > 0){
        $allpairhash->{$ctg1}{$ctg2}{'links'} = $ls->{$ctg2}{'links'};
        $allpairhash->{$ctg1}{$ctg2}{'gaps'} = int($ls->{$ctg2}{'gaps'}/$ls->{$ctg2}{'links'});
        $allpairhash->{$ctg1}{$ctg2}{'size1'} = int($ls->{$ctg2}{'size1'}/$ls->{$ctg2}{'links'});
        $allpairhash->{$ctg1}{$ctg2}{'size2'} = int($ls->{$ctg2}{'size2'}/$ls->{$ctg2}{'links'});
        $allpairhash->{$ctg1}{$ctg2}{'score1'} = int($ls->{$ctg2}{'score1'}/$ls->{$ctg2}{'links'});
        $allpairhash->{$ctg1}{$ctg2}{'score2'} = int($ls->{$ctg2}{'score2'}/$ls->{$ctg2}{'links'});
        $allpairhash->{$ctg1}{$ctg2}{'reads'} = $ls->{$ctg2}{'reads'};
      }
      if($ls->{$ctg2}{'links'} >= $min_links){
        $newpairhash->{$ctg1}{$ctg2}{'links'} = $ls->{$ctg2}{'links'};
        $newpairhash->{$ctg1}{$ctg2}{'gaps'} = int($ls->{$ctg2}{'gaps'}/$ls->{$ctg2}{'links'});
        $newpairhash->{$ctg1}{$ctg2}{'size1'} = int($ls->{$ctg2}{'size1'}/$ls->{$ctg2}{'links'});
        $newpairhash->{$ctg1}{$ctg2}{'size2'} = int($ls->{$ctg2}{'size2'}/$ls->{$ctg2}{'links'});
        $newpairhash->{$ctg1}{$ctg2}{'score1'} = int($ls->{$ctg2}{'score1'}/$ls->{$ctg2}{'links'});
        $newpairhash->{$ctg1}{$ctg2}{'score2'} = int($ls->{$ctg2}{'score2'}/$ls->{$ctg2}{'links'});
        $newpairhash->{$ctg1}{$ctg2}{'reads'} = $ls->{$ctg2}{'reads'};
      }
    }
  }
  return $newpairhash, $allpairhash;
}

#Filter links
sub FilterLinks{
   my ($tmphash) = @_;
   my $newpairhash;
   for my $p (1..keys(%$tig_length)){
     for my $i ("f","r"){
       my $ctg1 = "$i$p";
       my $ls = $tmphash->{$ctg1};
       my ($filthash,$foundtigs);
       my ($c,$tophitlinks,$ratiohit)=(0,0,1);
       #get all links of a contig
       foreach my $tighit (sort {$ls->{$b}{'links'}<=>$ls->{$a}{'links'}} keys %$ls){
         $tophitlinks = $ls->{$tighit}{'links'} if($c == 0);
         $ratiohit = $ls->{$tighit}{'links'}/$tophitlinks if($c > 0);
         my $subtig1 = substr($tighit,1);
         if(!defined $foundtigs->{$subtig1}){# && $ratiohit > $ratio){
           $filthash->{$ctg1}{$tighit}{'links'} = $ls->{$tighit}{'links'};
           $filthash->{$ctg1}{$tighit}{'gaps'} = $ls->{$tighit}{'gaps'};
           $filthash->{$ctg1}{$tighit}{'size1'} = $ls->{$tighit}{'size1'};
           $filthash->{$ctg1}{$tighit}{'size2'} = $ls->{$tighit}{'size2'};
           $filthash->{$ctg1}{$tighit}{'score1'} = $ls->{$tighit}{'score1'};
           $filthash->{$ctg1}{$tighit}{'score2'} = $ls->{$tighit}{'score2'};
         }
         $foundtigs->{$subtig1}++;
         $c++;
       }
       #Filter links if they are within the same path
       my $multihash_sub = $multihash->{$ctg1};
       my $path = getPath($multihash_sub,"1$ctg   ",$multictgs,0,1,"", $ctg1,0.5, $filthash->{$ctg1});

       #Store only the links that are remaining after filtering
       my @array = split(",",$path);
       foreach my $arrtig (@array){
         $newpairhash->{$ctg1}{$arrtig}{'links'} = $ls->{$arrtig}{'links'};
         $newpairhash->{$ctg1}{$arrtig}{'gaps'} = $ls->{$arrtig}{'gaps'};
         $newpairhash->{$ctg1}{$arrtig}{'size1'} = $ls->{$arrtig}{'size1'};
         $newpairhash->{$ctg1}{$arrtig}{'size2'} = $ls->{$arrtig}{'size2'};
         $newpairhash->{$ctg1}{$arrtig}{'score1'} = $ls->{$arrtig}{'score1'};
         $newpairhash->{$ctg1}{$arrtig}{'score2'} = $ls->{$arrtig}{'score2'};
         (my $revctg1 = $ctg1) =~ tr/fr/rf/;
         (my $revarrtig = $arrtig) =~ tr/fr/rf/;
         $newpairhash->{$revarrtig}{$revctg1}{'links'} = $ls->{$arrtig}{'links'};
         $newpairhash->{$revarrtig}{$revctg1}{'gaps'} = $ls->{$arrtig}{'gaps'};
         $newpairhash->{$revarrtig}{$revctg1}{'size1'} = $ls->{$arrtig}{'size1'};
         $newpairhash->{$revarrtig}{$revctg1}{'size2'} = $ls->{$arrtig}{'size2'};
         $newpairhash->{$revarrtig}{$revctg1}{'score1'} = $ls->{$arrtig}{'score1'};
         $newpairhash->{$revarrtig}{$revctg1}{'score2'} = $ls->{$arrtig}{'score2'};
       }
     }
   }
   #FILTER DOUBLE CONTIGS WITH DIFFERENT ORIENTATION
   for my $p (1..keys(%$tig_length)){
     for my $i ("f","r"){
       my $ctg1 = "$i$p";
       my $ls = $tmphash->{$ctg1};
       my $filthash;
       my $foundtigs;
       foreach my $tighit (sort {$ls->{$b}{'links'}<=>$ls->{$a}{'links'}} keys %$ls){

         my $subtig1 = substr($tighit,1);
         if(defined $foundtigs->{$subtig1}){
           delete $newpairhash->{$ctg1}{$tighit};
           (my $revctg1 = $ctg1) =~ tr/fr/rf/;
           (my $revtighit = $tighit) =~ tr/fr/rf/;
           delete $newpairhash->{$revtighit}{$revctg1};
         }
         $foundtigs->{$subtig1}++;
       }
     }
   }
  return $newpairhash;
}

#Try to merge two contigs if there is a negative gap count
sub MergeTwoContigs{
  my ($ctg1, $ctg2, $max_overlap) = @_;
  $max_overlap = abs($max_overlap)+100;
  my $newseq = "";
  while($max_overlap >= $min_tig_overlap){
    my $seq2 = $ctg2;
    my $seq1 = $ctg1;
    my $subseq2 = substr($ctg2,0,$max_overlap);
    my $subseq1 = substr($ctg1,-$max_overlap);
    if($subseq1 eq $subseq2){
      my $newctg1 = substr($ctg1,0,-$max_overlap);
      my $newctg2 = substr($ctg2,$max_overlap);
      $newseq = $newctg1.lc($subseq1).$newctg2;
      return ($newseq, length($subseq1));
    }

    $max_overlap--;
  }
  return ($newseq, 0);
}
###FUNCTION TO REVERSE COMPLEMENT A SEQUENCE
sub reverseComplement{
   $_ = shift;
   tr/ATGC/TACG/;
   return (reverse());
}

###FUNCTION TO GET THE CURRENT DATE
sub getDate{
  my $date = scalar(localtime);
  return $date;
}
