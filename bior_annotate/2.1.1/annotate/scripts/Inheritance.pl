use Getopt::Long;
use List::MoreUtils qw(firstval);

my ($pedFile,$vcf,$help,$verbose);
GetOptions(
        'ped|p=s' => \$pedFile,
        'vcf|v=s' => \$vcf,
		'geneList|g:s' => \$geneList,
		'help|h' => \$help,
		'verbose' => \$verbose
);

if($help){&usage();}
if((!$pedFile)||(!$vcf)){die &usage()}

if($geneList){
	open LIST, "$geneList" or die "Couldn't open file: $!"; 
	$genes = join(",", <LIST>); 
	$genes=~s/[\r\n ]//g;#print "GENE STRING=$genes\n";
	close LIST;
}
@genes=split(",",$genes);
my %Hashgenes;
for $myGene (@genes){
	chomp($myGene);
	$Hashgenes{$myGene}=1;

}
 #print "GENES=";
 #print join ("\n",@genes,"\n");
 #print "\n\n";
# die;

#print STDERR "Pedigree file is initially $pedFile\n";

#Find out who is affected, and who the child and parents are
@family=&PEDcheck($pedFile);
($sample,$child,$childGender,$dad,$mom,$dadStatus,$momStatus)=@family;
#print "@family\n";

#Now choose the table that chould be used
$tableToUse=&chooseTable($dadStatus,$momStatus);

my ($dadGT,$momGT,$childGT,$dadCol,$momCol,$childCol,@tmp,$gtGroup,$inheritance);

open (VCF,"$vcf") or die "Can't open VCF\n";
	while (<VCF>){
		if ($_ =~/^##/){print;next}
		elsif($_ =~/^#CHROM/){
			print "##INFO=<ID=InheritancePattern,Number=1,Type=String,Description=\"AR: autosomal recessive; AD: autosomal dominant; denovo: not in either parent; XLD: x-linked dominant; XLR-x-linked recessive; YL: y-linked; UPD: uniparental disomy; Normal & NotInChild: not important for the phenotype; NonMendelian,DiploidX,DiploidY,MomHasY all indicate issues of quality; CompundHet: based on phase with one allele from each parent\">\n";
			if($geneList){print "##INFO=<ID=InGeneList,Number=0,Type=Flag,Description=\"Is this gene in your target gene list\">\n";}
			print;
			chomp;
			@SAMPLES=split("\t",$_);
			($dadCol) =  grep { $SAMPLES[$_] =~ /^$dad$/ } 0..$#SAMPLES;
			($momCol) =  grep { $SAMPLES[$_] =~ /^$mom$/ } 0..$#SAMPLES;
			($childCol) =  grep { $SAMPLES[$_] =~ /^$family[1]$/ } 0..$#SAMPLES;
			next;
		}
		else{
			chomp;
			my @LINE=split("\t",$_);
			$inheritance="";
			$dadGT=$LINE[$dadCol];@tmp=split(":",$dadGT);$dadGT=$tmp[0];
			$momGT=$LINE[$momCol];@tmp=split(":",$momGT);$momGT=$tmp[0];
			$childGT=$LINE[$childCol];@tmp=split(":",$childGT);$childGT=$tmp[0];
			
			###################################################
			#Need to add a step here to correct 1|0 genotypes
			#Allow for one missing allele
			$dadGT=~s/\./0/;$momGT=~s/\./0/;$childGT=~s/\./0/;
			$dadGT=~s/\||\///g;$dadGT=~s/10/01/;
			$momGT=~s/\||\///g;$momGT=~s/10/01/;
			$childGT=~s/\||\///g;$childGT=~s/10/01/;
			###################################################
			
			$gtGroup= join ("",$dadGT,$momGT,$childGT);
			
			#Skip if there is anything besides 1 or 0
			my $check=($gtGroup =~ tr /0|1//);
			#if ($check != 6){print "$_\n";next};
			if ($check != 6){
				$inheritance="unknown";
			}
			#print $gtGroup."\n";
			#Define the Mode of inheritance
			elsif($gtGroup=~/000001|000011/){
				$inheritance="deNovo";
				}
			elsif($gtGroup=~/00$/){
				$inheritance="notInChild";
			}
			else{
				if ($tableToUse eq 1 ){
					$inheritance=&callset1($LINE[0],$gtGroup,$childGender);
				}
				elsif($tableToUse eq 2 ){
					$inheritance=&callset2($LINE[0],$gtGroup,$childGender);
				}
				elsif($tableToUse eq 3 ){
					$inheritance=&callset3($LINE[0],$gtGroup,$childGender);
				}
			}
			if(!$inheritance){$inheritance="unknown"};
			my $INFO="InheritancePattern=$inheritance;$LINE[7]";
			$RESULT=&CheckGene($LINE[7]);
			if ($RESULT == 1 ){$INFO="InGeneList;$INFO"}
			$INFO=~s/\.$//;
			print join ("\t",@LINE[0..6],$INFO,@LINE[8..scalar(@LINE)-1])."\n";
		}
	}
close VCF;





sub usage{
	print "
	Inheritance.pl -v <vcf> -p <pedFile>

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
sub chooseTable {
	#Pick which table to use as reference
	my ($dad_aff,$mom_aff) = @_;
		#Affected=2, Unaffected=1
		if(($mom_aff==1)&&($dad_aff==1)){
			return 1;		
		}
		elsif(($mom_aff==2)&&($dad_aff==1)){
			return 2;
		}
		elsif(($mom_aff==1)&&($dad_aff==2)){
			return 3;
		}
		else{
			die "Either both parents are affected, or I'm missing data from your pedigree\n";
		}

} #End ChooseTable

######################################################################################
#mom and dad are unaffected
sub callset1{
	($chrom,$gtGroup,$gender)=@_;
	$chrom=~s/chr//;
	#GTgroup is data, mom,child
	#print join ("\t",$chrom,$gtGroup,$gender)."\n";
	#Do autosomes first
	if($chrom!~/^X|^Y/){
		if($gtGroup=~/010111/){ return "AR"}
		elsif($gtGroup=~/111101/){return "NonMendelian"}
		elsif($gtGroup=~/000101|001101|010001|010101|011101|110001|110101|011111|110111|111111/){return "Normal"}
		elsif($gtGroup=~/010011/){return "UPD-dad"}
		elsif($gtGroup=~/110011/){return "UPD-dad(not pathogenic)"}
		elsif($gtGroup=~/000111/){return "UPD-mom"}
		elsif($gtGroup=~/001111/){return "UPD-mom(not pathogenic)"}
	}
	elsif($chrom=~/^X/){
		#if female
		if($gender=~/^2$/){
			if($gtGroup=~/010001|010101|011101|011111|010011/){ return "Dad-DiploidX"}
			elsif($gtGroup=~/111101/){return "NonMendelian"}
			elsif($gtGroup=~/001101|110001|110101|110111|111111/){return "Normal"}
			elsif($gtGroup=~/010111/){return "UPD-mom-XLR"}
			elsif($gtGroup=~/000101/){return "XLD"}
			elsif($gtGroup=~/110011/){return "UPD-dad(not pathogenic)"}
			elsif($gtGroup=~/001111/){return "UPD-mom(not pathogenic)"}
			elsif($gtGroup=~/010111|000111/){return "UPD-mom-XLR"}

		}
		#else male
		else{
			if($gtGroup=~/011111|010011/){return "Dad-DiploidX"}
			elsif($gtGroup=~/111101|001101|010001|010101|011101|110001|110101/){return "DiploidX"}
			elsif($gtGroup=~/110011/){return "NonMendelian"}
			elsif($gtGroup=~/110111|111111|001111/){return "Normal"}
			elsif($gtGroup=~/000101|010111|000111/){return "XLR"}
		}
	}
	elsif($chrom=~/^Y/){
		if($gender==1){
			if($gtGroup=~/010011/){return "Dad-DiploidY"}
			elsif($gtGroup=~/01$/){return "DiploidY"}
			elsif($gtGroup=~/010111|011111|110111|111111|000111|001111/){return "MomHasY"}
			elsif($gtGroup=~/110011/){return "Normal"}
		}
		else { return "DaughterHasY" }
	
	}
}


sub callset2{
	($chrom,$gtGroup,$gender)=@_;
	$chrom=~s/chr//;
	
	#Do autosomes first
	if($chrom!~/^X|^Y/){
		if($gtGroup=~/000101/){ return "AD"}
		elsif($gtGroup=~/001101/){return "AD-MomHom"}
		elsif($gtGroup=~/011111/){return "AR"}
		elsif($gtGroup=~/111101/){return "NonMendelian"}
		elsif($gtGroup=~/010001|010101|011101|110001|110101|010111|110111|111111/){return "Normal"}
		elsif($gtGroup=~/010011|110011/){return "UPD-dad(not pathogenic)"}
		elsif($gtGroup=~/000111|001111/){return "UPD-mom"}
	}
	elsif($chrom=~/^X/){
		#if female
		if($gender=~/^2$/){
			if($gtGroup=~/010001|010111|011111|010011/){ return "Dad-DiploidX"}
			elsif($gtGroup=~/111101/){return "NonMendelian"}
			elsif($gtGroup=~/110001|110101|110111|111111/){return "Normal"}
			elsif($gtGroup=~/010101/){return "Potential-XLD"}
			elsif($gtGroup=~/011101|001101/){return "XLD-MomHom"}
			elsif($gtGroup=~/110011/){return "UPD-dad(not pathogenic)"}
			elsif($gtGroup=~/001111/){return "UPD-mom-XLR"}
			elsif($gtGroup=~/000101|010101/){return "XLD"}
			elsif($gtGroup=~/000111/){return "XLD-ChildHom"}
		}
		#else male
		else{
			if($gtGroup=~/010011/){return "Dad-DiploidX"}
			elsif($gtGroup=~/010001|010101|011101|110001|110101/){return "DiploidX"}
			elsif($gtGroup=~/111101|110011/){return "NonMendelian"}
			elsif($gtGroup=~/110111|111111/){return "Normal"}
			elsif($gtGroup=~/010111|000101|000111/){return "XLD"}
			elsif($gtGroup=~/011111|001111|001101/){return "XLR"}
		}
	}
	elsif(($chrom=~/Y/)&&($gender==1)){
		if($gtGroup=~/010011/){return "Dad-DiploidY(not pathogenic)"}
		elsif($gtGroup=~/01$/){return "DiploidY"}
		elsif($gtGroup=~/010111|011111|110111|111111|000111|001111/){return "MomHasY"}		
		elsif($gtGroup=~/110011/){return "Normal"}
	}
}


sub callset3{
	($chrom,$gtGroup,$gender)=@_;
	$chrom=~s/chr//;
	#Do autosomes first
	if($chrom!~/^X|^Y/){
		if($gtGroup=~/110111/){ return "AR"}
		elsif($gtGroup=~/010001/){return "AD"}
		elsif($gtGroup=~/110001/){return "AD-DadHom"}
		elsif($gtGroup=~/111101/){return "NonMendelian"}
		elsif($gtGroup=~/110101|010101|011101|111111|010111|000101|011111|001101/){return "Normal"}
		elsif($gtGroup=~/010011/){return "UPD-dad-AD"}
		elsif($gtGroup=~/110011/){return "UPD-dad-AR"}
		elsif($gtGroup=~/000111|001111/){return "UPD-mom(not Pathogenic)"}
	}
	elsif($chrom=~/^X/){
		#if female
		if($gender=~/^2$/){
			if($gtGroup=~/010101|011101|011111/){ return "Dad-DiploidX"}
			elsif($gtGroup=~/111101/){return "NonMendelian"}
			elsif($gtGroup=~/111111|000101|001101/){return "Normal"}
			elsif($gtGroup=~/010011|110011/){return "UPD-dad-XLR"}
			elsif($gtGroup=~/000111|001111/){return "UPD-mom(not Pathogenic)"}
			elsif($gtGroup=~/010001|110001|110101/){return "XLD"}
			elsif($gtGroup=~/110111|010111/){return "XLR"}
			
		}
		#else male
		else{
			if($gtGroup=~/011111|010011/){return "Dad-DiploidX"}
			elsif($gtGroup=~/010101|011101|000101|001101|010001|110001/){return "DiploidX"}
			elsif($gtGroup=~/111101|110011/){return "NonMendelian"}
			elsif($gtGroup=~/111111|000111|001111/){return "Normal"}
			elsif($gtGroup=~/110101|110111|010111/){return "XLR"}
		}
	}
	elsif(($chrom=~/Y/)&&($gender==1)){
		if($gtGroup=~/010011/){return "Dad-DiploidY"}
		elsif($gtGroup=~/01$/){return "DiploidY"}
		elsif($gtGroup=~/011111|111111|000111|001111|110111|010111/){return "MomHasY"}		
		elsif($gtGroup=~/110011/){return "YL"}
	}
}
######################################################################################################################
sub CheckGene(){
	my $line=shift(@_);
	my ($geneSymbol,$tag,$effect,@pairs);
	#Gene gene symbol
	$line=~s/;;/;/g;
	my @INFO=split(/;/,$line);
	my $len=scalar(@INFO);
	#print "LENGTH=$len\n";
	for (my $i=0;$i<$len;$i++){
		$tag=$INFO[$i];
		#print "\tTag=$INFO[$i], index=$i, len=$len\n";
		#split on = to match true value
		if($tag=~/=/){
			@pairs=split(/=/,$tag);
			#print "PAIRS=@pairs[0] and @pairs[1]\n";
#			if (!$pairs[1]){return 0};#ignore any incorrect labels
			if (!$pairs[1]){next;};#ignore any incorrect labels
			if($pairs[0]=~/SAVANT_GENE/){$geneSymbol=$pairs[1];};
		}
	}
#	print "GENE SYMBOL=$geneSymbol\n";
	chomp($geneSymbol);
	if(exists($Hashgenes{$geneSymbol}))
	{
		return 1;
	}
	else
	{
		#print "no joy\n";
		return 0;
	}
}
