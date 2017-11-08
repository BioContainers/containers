#!/usr/bin/perl 
use Getopt::Long;
use List::MoreUtils qw(uniq);
##fix
my ($pedFile,$vcf,$help,$verbose,$maxFreq,$limEffect);
GetOptions(
        'ped|p=s' => \$pedFile,
        'vcf|v=s' => \$vcf,
		'help|h' => \$help,
		'effect|e:s' => \$limEffect,
		'freq|f:f' => \$maxFreq,
		'verbose|l' => \$verbose
);

if($help){&usage();}
if((!$pedFile)||(!$vcf)){die &usage()}

#Decide what impacts should count toward Compound Hets
if(!$limEffect){$limEffect="HIGH|MODERATE"}
if(!$maxFreq){$maxFreq=0.05}
#print STDERR "Pedigree file is initially $pedFile\nUsing $limEffect and $maxFreq MAF to determine CH\n";

#Find out who is affected, and who the child and parents are
@family=&PEDcheck($pedFile);
($sample,$child,$childGender,$dad,$mom,$dadStatus,$momStatus)=@family;

my ($dadGT,$momGT,$childGT,$dadCol,$momCol,$childCol,@tmp,$gene);
my $gene="start";

open (VCF,"$vcf") or die "Can't open VCF\n";
	#Declare variables
	#;my @effects=();my @childGT=();my @VARIANTS=();my $events="";my @LINE;
	my $counter=0;
	while (<VCF>){
		if ($_ =~/^##/){print;next}
		elsif($_ =~/^#CHROM/){
			print "##INFO=<ID=CompoundHet,Number=0,Type=Flag,Description=\"Identified as heterozygous from mom and dad while considering phase\">\n";
			print "##INFO=<ID=CompoundHetEffects,Number=.,Type=String,Description=\"Types of variants causing the compoundHet\">\n";	
			print;
			chomp;
			@SAMPLES=split("\t",$_);
			($dadCol) =  grep { $SAMPLES[$_] =~ /^$dad$/ } 0..$#SAMPLES;
			($momCol) =  grep { $SAMPLES[$_] =~ /^$mom$/ } 0..$#SAMPLES;
			($childCol) =  grep { $SAMPLES[$_] =~ /^$family[1]$/ } 0..$#SAMPLES;
			if ($verbose){print join ("\n","MOM is $SAMPLES[$momCol]","DAD is $SAMPLES[$dadCol]","CHILD is $SAMPLES[$childCol]")."\n"};
			next;
		}
		else{
			chomp;
			@LINE=split("\t",$_);
			$firstSymbol=&readLine($_); 
			print STDERR "Line NUMBER $. GENE SYMBOL=$firstSymbol\n" if ($verbose);
			if ($firstSymbol =~ /^0$/)
				{
				print $_."\n";
				print STDERR "FirstSymbol=0 so moving on\n" if ($verbose);
				next;
			};
			$GT=&calcGT($_);
			$getGeneEffect=&getGeneEffect($LINE[7]);
			#print "\n\n$firstSymbol eq $gene\n\n";
			if ($firstSymbol eq $gene) {
				#push into ARRAY
				push(@array,$_);
				push (@gt,$GT);
				push (@getGeneEffect,$getGeneEffect);
				#print @array."same\n";
				print STDERR "First SYMBOL ($firstSymbol) equal gene ($gene)\n" if ($verbose);
			}
			else{
				if($gene ne "start") 
				{
					#Do my logic for each gene
					if (scalar(@array) eq 1){
						#print "POS2\n";
						print "@array\n";
						print STDERR "There is only one entry, so I am printing it\n" if ($verbose);
					}
					else{
						my $line;
						@gt=uniq(@gt);
						$lenGT=scalar(@gt);
						print STDERR "lenGT=$lenGT\t and EFFECTS=@getGeneEffect\n" if ($verbose);
						#@getGeneEffect=uniq(@getGeneEffect);
						$EFFECTS=join(",",@getGeneEffect);
						for my $VCFLINES (@array){
							my @NEWLINE=split("\t",$VCFLINES);
							if($lenGT>1){
								 $line=join ("\t",@NEWLINE[0..6],"CompoundHet;CompoundHetEffects=$EFFECTS;@NEWLINE[7]",@NEWLINE[8..@NEWLINE])."\n";#print "POS3\n";
								$line=~s/\t$//;
								print $line;
								}
							else{
								$line= join ("\t",@NEWLINE)."\n";#print "POS4\n";
								$line=~s/\t$//;
								print $line;
							}
						}
					}
					undef(@array);
					undef (@gt);
					undef(@getGeneEffect);
				}			
				push(@array,$_);
				push (@gt,$GT);
				push (@getGeneEffect,$getGeneEffect);
				#print @array." t1\n"
			}
			$gene = $firstSymbol;
		}
}		
#Do my logic for each gene
if (scalar(@array) == 1){
	print $array[0] ."\n";
}
else{
	@gt=uniq(@gt);
	$lenGT=scalar(@gt);
	for my $VCFLINES (@array){
		my @NEWLINE=split("\t",$VCFLINES);
		if($lenGT>1){
			$line= join ("\t",@NEWLINE[0..6],"CompoundHet;@NEWLINE[7]",@NEWLINE[8..@NEWLINE])."\n";
			$line=~s/\t\n/\n/;
			print $line;
			}
		else{
			$line=join ("\t",@NEWLINE)."\n";
			$line=~s/\t\n/\n/;
                        print $line;
		}
	}
}
close VCF;	
			
			
sub readLine(){
	($line)= @_;
	@NEWLINE=split("\t",$line);
	#Make sure the Effect is present
	if ($line !~ /$limEffect/){print STDERR "could not find any effect data\n" if ($verbose);
	return 0}
	#print  "line $counter\n" if ($verbose);
	$counter++;
	#Get Genotypes
	$dadGT=$NEWLINE[$dadCol];@tmp=split(":",$dadGT);$dadGT=$tmp[0];
	$momGT=$NEWLINE[$momCol];@tmp=split(":",$momGT);$momGT=$tmp[0];
	$childGT=$NEWLINE[$childCol];@tmp=split(":",$childGT);$childGT=$tmp[0];$childGT=~s/\|//;
	#print join ("\n","PARAMS",$childGT,$dadGT,$momGT)."\n\n";
	#skip if the genotypes don't match with phenotype
	my $check=&GTcheck($childGT,$dadGT,$momGT);
	my $check2=&FreqCheck($_);
	#print "CHECK=$check\n";
	if (($check eq "0")||($check2 eq "0")){	
		print STDERR "FAILED because of CHECK1=$check\tCHECK2=$check2\n" if ($verbose);
		return 0;
	}
	else{
	$geneSymbol=&getGeneSymbol($NEWLINE[7]);
	#print "GENE SYMBOL - $geneSymbol\n";
	return $geneSymbol;
	}
}


#########################################################################################
sub usage{
	print "
	CompoundHet.pl -v <vcf> -p <pedFile>

";
exit 1;
}
#########################################################################################
sub PEDcheck {
	my $ped = shift(@_) ;
	#Define variables
	my (@families,@samples,@paternalID,@maternalID,@sex,@affection);
	#print "Pedigree file is $ped\n";
	open (PED,"$ped") or die "Can't read in the pedigree file";
	while(<PED>){
		next if($_=~/^#/);
		chomp;
		#parse the metadata
		my @line = split(/\t/,$_);
		push (@families,$line[0]);
		push (@samples,$line[1]);
		push (@paternalID,$line[2]);
		push (@maternalID,$line[3]);
		push (@sex,$line[4]);
		push (@affection,$line[5]);
	}
	close PED;
	my @family=();
	#Find the child and make sure it is affected
	my( @potentialChild ); 
	my $search_for = "2";
	#Which ones are affected
	@potentialChild =  grep { $affection[$_] eq $search_for } 0..$#affection;
	if(!@potentialChild){die "There are no affecteds in your PED file\n"}
	foreach $sample(@potentialChild){
		print STDERR "Assuming $samples[$sample] is affected\n" if ($verbose);
		#Identify which one is the child
		#If Paternal and Maternal IDs are in the PED, then it is the child
		$search_for = $paternalID[$sample];
		$dadFound =  grep { $samples[$_] eq $search_for } 0..$#samples;
		$search_for = $maternalID[$sample];
		$momFound = grep { $samples[$_] eq $search_for } 0..$#samples;
		if(($dadFound)&&($momFound)){
			$child=$samples[$sample];
			print STDERR "Assuming $child is the child\n" if ($verbose);
			$childGender=$sex[$sample];
			$dad=$paternalID[$sample];
			$mom=$maternalID[$sample];
			@family=($sample,$child,$childGender,$dad,$mom);
		}
	}
	#Find the dad
	$search_for = $family[3];
	($dadFound) =  grep { $samples[$_] eq $search_for } 0..$#samples;	
	if ($sex[$dadFound] !~ /^1$/){die "Something is wrong.  Dad should be male, but you have him listed as $sex[$dadFound].  Check your PED file"}
	#Find the mom
	$search_for = $family[4];	
	($momFound) =  grep { $samples[$_] eq $search_for } 0..$#samples;	
	if ($sex[$momFound] !~ /^2$/ ){die "Something is wrong.  Mom should be female, but you have her listed as $sex[$momFound].  Check your PED file\n"}
	#print STDERR "DAD=$samples[$dadFound] AND MOM=$samples[$momFound]\n\n" if ($verbose);
	push (@family,$affection[$dadFound],$affection[$momFound]);
	#print join ("\n", @family,"\n") if $verbose;
	#print "SAMPLE=$family[0] CHILD=$child childGender=$childGender dad=$dad mom=$mom \$affection[\$dadFound]=$affection[$dadFound] \$affection[\$momFound]=$affection[$momFound]\n" if $verbose;
	#print scalar(@family)."\n";
	if (scalar(@family)!= 7){
		die "I can't seem to find the trio in your pedigree\n\n";
	}
	return @family;
	
} #End PED subroutine
######################################################################################
sub getGeneSymbol(){
	my $line=shift(@_);
	my ($geneSymbol,$tag,$effect,@pairs);
	#Gene gene symbol
	my @INFO=split(/;/,$line);
	for (my $i=0;$i<@INFO;$i++){
		$tag=$INFO[$i];#print "Looking at $tag in $i of ".scalar(@INFO)."\n" if ($verbose);
		$tag=~s/\|//g;
		#split on = to match true value
		if($tag=~/=/){
			@pairs=split(/=/,$tag);
		#	print "Looking at @pairs\n" if ($verbose);
			#if (!$pairs[1]) {return 0};#ignore any incorrect labels
			if($pairs[0]=~/snpeff.Gene_name|SAVANT_GENE/){$geneSymbol=$pairs[1];
				print "GENE SYMBOL recognized as $pairs[1]\n" if ($verbose)};
			#Now count if MODERATE or HIGH
			if($pairs[0]=~/snpeff.Effect|SAVANT_EFFECT/){$effect=$pairs[1]};
		}
	}
	return $geneSymbol;
}

######################################################################################
sub getGeneEffect(){
	my $line=($_);
	my ($geneSymbol,$tag,$effect,@pairs);
	#Gene gene effect
	my @INFO=split(/;/,$line);
	for (my $i=0;$i<@INFO;$i++){
		$tag=$INFO[$i];
		#split on = to match true value
		if($tag=~/=/){
			@pairs=split(/=/,$tag);#next if (!$pairs[1]);#ignore any incorrect labels
			#print "PAIRS=@pairs\n";
			if($pairs[0]=~/snpeff.Effect|SAVANT_EFFECT|CAVA_EFFECT/){
				$effect=$pairs[1];
				#print "\n\neffect=$pairs[1];\n" if ($verbose);
				};	
		}
	}
	return $effect;
}
######################################################################################
 sub GTcheck(){
	#($childGT,$dadGT,$momGT)=split($_);
#print "($childGT,$dadGT,$momGT)\n";
	#Skip if not in child
	
	#Exclude homozygous mutations from child
	if ($childGT !~ /01|10/){print STDERR "NOT IN CHILD, GT=$childGT\n" if ($verbose);
		return 0};
	#if dad is affected, then he can be hom, but mom must be het
	if ($dadStatus=~/^2$/){
		if ($momGT =~ /1.1/){print STDERR "NOT IN MOM\n" if ($verbose);
		return 0};
	}
	#if mom is affected, then she can be hom, but dad must be het
	if ($momStatus=~/^2$/){
		if ($dadGT =~ /1.1/){print STDERR "NOT IN DAD\n" if ($verbose);
		return 0};
	}
	#if parents unaffected, they can't be hom
	if (($momStatus=~/^1$/)&&($momGT =~ /1.1/)){print STDERR "MOM can't be hom\n" if ($verbose) ;
		return 0;
	}
	if (($dadStatus=~/^1$/)&&($dadGT =~ /1.1/)){print STDERR "DAD can't be hom\n" if ($verbose);
		return 0;
	}	

	else {
			return $childGT;
	}
}
######################################################################################
sub calcGT(){
	my $line=shift(@_);
	my $geneSymbol="";
	my @LINE=split("\t",$line);
	print  "line $counter\n" if ($verbose);$counter++;
	#Get Genotypes
	$dadGT=$LINE[$dadCol];@tmp=split(":",$dadGT);$dadGT=$tmp[0];
	$momGT=$LINE[$momCol];@tmp=split(":",$momGT);$momGT=$tmp[0];
	$childGT=$LINE[$childCol];@tmp=split(":",$childGT);$childGT=$tmp[0];$childGT=~s/\|//;
	#skip if the genotypes don't match with phenotype
	my $check=&GTcheck($childGT,$dadGT,$momGT);
	if ($check==0){
		print STDERR "genotypes don't match with phenotype\n" if ($verbose);
		return 0};
	return ($childGT);
}

######################################################################################
sub FreqCheck(){
	my @INFO=split(/;/,$line);
	my $maf=0;
	for (my $i=0;$i<@INFO;$i++){
		$tag=$INFO[$i];
		#split on = to match true value
		if($tag=~/=/){
			@pairs=split(/=/,$tag);
			if($pairs[0]=~/ALL_maf|ExAC.Info.AF/){$maf=$pairs[1]};
		}
	}
	
	
	if ($maf>$maxFreq){
		print STDERR "The variant is too frequent\n" if ($verbose);
		print STDERR "THE MAF=$maf and the maxFreq is set to $maxFreq\n" if ($verbose);
		return 0}
	else{return 1}
	;
}
######################################################################################
