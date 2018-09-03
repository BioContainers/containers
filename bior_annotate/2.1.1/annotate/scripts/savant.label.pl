##fix
use Switch;
use List::MoreUtils qw(first_index uniq); 
while (<>){
if($.==1){
 print;
 $line=qq(##INFO=<ID=SAVANT_IMPACT,Number=1,Type=String,Description="SAVANT_IMPACT">);
 print  "$line\n";
  $line=qq(##INFO=<ID=SAVANT_EFFECT,Number=1,Type=String,Description="SAVANT_EFFECT">);
 print  "$line\n";
next;
}
else{
if ($_=~/^#/){
	$_=~s/##INFO=<ID=ENST/##INFO=<ID=SAVANT_ENST/;
	$_=~s/##INFO=<ID=GENE/##INFO=<ID=SAVANT_GENE/;
	$_=~s/##INFO=<ID=HGVS/##INFO=<ID=SAVANT_HGVS/;
	$_=~s/##INFO=<ID=ALTHGVS/##INFO=<ID=SAVANT_ALTHGVS/;
   	$_=~s/##INFO=<ID=INFO/##INFO=<ID=SAVANT_INFO/;
	$_=~s/##INFO=<ID=LOC/##INFO=<ID=SAVANT_LOC/;
        $_=~s/##INFO=<ID=ALTANN/##INFO=<ID=SAVANT_ALTANN/;
        $_=~s/##INFO=<ID=CLASS/##INFO=<ID=SAVANT_CLASS/;
        $_=~s/##INFO=<ID=ALTCLASS/##INFO=<ID=SAVANT_ALTCLASS/;
	print;
	next
}
chomp;
@F=split("\t",$_);
@INFO=split(/;/,@F[7]);
$i=0;
@NEW=();
for ($i ; $i<scalar(@INFO);$i++){
 if ($INFO[$i] =~ /^CLASS=/){
  @CLASS=split(/=/,$INFO[$i]);
  @POSSIBLE=split(":",$CLASS[1]);
  #Find the most deleterious effect
  $hindex="";$mindex="";$lindex="";
  $hindex = first_index { /^ESS$|^SS5$|^IM$|^SL$|^FC$/ } @POSSIBLE;
  $mindex = first_index { /^NSC|^NCI|^IF/ } @POSSIBLE;
  $lindex = first_index { /^[0-9]PU$|^SC|^INTR|^\.$/ } @POSSIBLE;
  #Set the seefect to be queried
  if ($hindex) {$class=$POSSIBLE[$hindex]}
  elsif ($mindex) {$class=$POSSIBLE[$mindex]}
  else {$class=$POSSIBLE[$lindex]}
  switch($class) {
   case /^ESS$|^SS5$/ {push (@NEW,"SAVANT_EFFECT=SPLICE_SITE;SAVANT_IMPACT=HIGH" )}
   case /^IM$/ {push (@NEW,"SAVANT_EFFECT=START_LOSS;SAVANT_IMPACT=HIGH" )}
   case /^SG$/ {push (@NEW,"SAVANT_EFFECT=STOP_GAIN;SAVANT_IMPACT=HIGH" )}
   case /^SL$/ {push (@NEW,"SAVANT_EFFECT=STOP_LOSS;SAVANT_IMPACT=HIGH" )}
   case /^FC$/ {push (@NEW,"SAVANT_EFFECT=FRAMESHIFT;SAVANT_IMPACT=HIGH" )}
   case /^NSC|^NCI|^IF/ {push (@NEW,"SAVANT_EFFECT=NONSYNONYMOUS;SAVANT_IMPACT=MODERATE" )}
   case /^[0-9]PU$/ {push (@NEW,"SAVANT_EFFECT=UTR;SAVANT_IMPACT=LOW" )}
   case /^SC/ {push (@NEW,"SAVANT_EFFECT=SYNONYMOUS;SAVANT_IMPACT=LOW" )}
   case /^INTR$|^SS$/ {push (@NEW,"SAVANT_EFFECT=INTRON;SAVANT_IMPACT=LOW" )} 
   case /^\.$/ {next}
   else {print STDERR "I Have no idea what to call this variable $class\n"}
  }
  }
   #Previx savant annotations
	$INFO[$i]=~s/^ENST=/SAVANT_ENST=/;
	$INFO[$i]=~s/^GENE=/SAVANT_GENE=/;
	$INFO[$i]=~s/^HGVS=/SAVANT_HGVS=/;
	$INFO[$i]=~s/^ALTHGVS=/SAVANT_ALTHGVS=/;
	$INFO[$i]=~s/^INFO=/SAVANT_INFO=/;
	$INFO[$i]=~s/^LOC=/SAVANT_LOC=/;
	$INFO[$i]=~s/^ALTANN=/SAVANT_ALTANN=/;
	$INFO[$i]=~s/^CLASS=/SAVANT_CLASS=/;
	$INFO[$i]=~s/^ALTCLASS=/SAVANT_ALTCLASS=/;  
   push(@NEW,$INFO[$i]);
  }
}
$INFO=join(";",@NEW);
$line=join("\t",@F[0..6],$INFO,@F[8..@F]);
$line=~s/\t\n/\n/;
print "$line\n"
}


