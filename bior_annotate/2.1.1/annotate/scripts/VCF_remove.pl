#!/usr/bin/perl
use Getopt::Long;
##use List::MoreUtils qw/any/;

GetOptions ( "vcf|v=s"   => \$VCF,      # string
              "omit|o=s"   => \$omit);      # string
#print "VCF=$VCF\nOmit=$omit\n";			 
open (VCF,"$VCF") or die &usage();
while(<VCF>){
	@skip=split(",",$omit);
	if($_=~/^#/){
		$toSkip=0;
		for ($i=0;$i<@skip;$i++){
			$variable="^##INFO=<ID=$skip[$i]";
			if ($_ =~ /$variable/){$toSkip++};
		}
		if ($toSkip>0){next}else{print}
		}
	else{
		chomp;
		@NEW="";
		@line=split("\t",$_);
		@INFO=split(/;/,$line[7]);
		for ($i=0 ;$i<@INFO;$i++){
			$toSkip=0;
			for ($j=0;$j<@skip;$j++){
				$variable="^$skip[$j]";
				if ($INFO[$i] =~ /$variable/){$toSkip++};
			}
			if ($toSkip>0){next}
			else{push(@NEW,$INFO[$i])}
		}
	$INFO=join(";",@NEW);
	$INFO=~s/^;//;
	$line=join("\t",@line[0..6],$INFO,@line[8..@line]);
	print "$line\n";
	}
}
close VCF;
sub usage{
print "
Usage: -v <VCF> -o LJB23_SiPhy,LJB23_FATHMM_pred
where:
	-o is a comma delimited string of values to skip 
";
}
