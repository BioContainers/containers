#!/usr/local/biotools/perl/5.10.0/bin/perl
##fix
# Convert a VCF with BioR annotations in the INFO column into a friendlier format
# Jared Evans evans.jared@mayo.edu
# 06/2014

use strict;
use warnings;
use Data::Dumper;

use Getopt::Long;

# script options
my($input, $output, $bior_config, $group_file, $help);
GetOptions("in|i:s"     => \$input,
	"out|o:s"       => \$output,
	"bior_config|c=s"   => \$bior_config,
	"groups|g:s"    => \$group_file,
	"help|h|?"     => \&help);

if(not defined $bior_config){
	print "Missing parameter -c. User must pass in a file defining the bior annotations in the INFO field!!\n";
	&help();
	exit;
}
my $sample_count = 0;

# read from input file if defined
@ARGV = ();
if(defined $input){
	$ARGV[0] = $input;
}

# print to output file if defined
my $fh;
if (defined $output) {
	open $fh, '>', $output;
	select $fh;
}

# read in bior_config.txt
my @annotation_fields = ();
open CONFIG, "<$bior_config" or die "opening $bior_config\n";
while(<CONFIG>){
	my $row = $_;
	chomp $row;
	push(@annotation_fields,$row);
}
close CONFIG;

my @groups = ();
my %group_sample_count = ();
# read groups file if defined
if(defined $group_file){
	open GROUP, "<$group_file" or die "opening $group_file\n";
	while(<GROUP>){
		my $row = $_;
		chomp $row;
		push(@groups,$row);
		if(not exists $group_sample_count{$row}){
			$group_sample_count{$row} = 1;
		}else{
			$group_sample_count{$row} += 1;
		}
	}
	close GROUP;
}


while(<>){
	my $row = $_;
	chomp $row;
	my @line = split("\t",$row);
	# add new header
	if($line[0] eq "#CHROM"){
		$sample_count = scalar(@line)-9;
		if(!defined $group_file){
			for(my $i = 0; $i < $sample_count; $i++){
				push(@groups,"AllSamples");
				if($i == 0){
					$group_sample_count{"AllSamples"} = 1;
				}else{
					$group_sample_count{"AllSamples"} += 1;
				}
			}
		}
		print join("\t",@line[0..6]);;
		foreach my $grp (sort keys %group_sample_count){ # print headers foreach group
			print "\t".$grp.".AltAlleleFreq\t".$grp.".NumberOfAlleles";
		}
		print "\t".join("\t",@annotation_fields); # print annotation headers
		for(my $i = 0; $i < $sample_count; $i++){ # print individual sample headers
			my $sample = $line[9+$i];
			print "\t$sample.Genotype(GT)\t$sample.AltSupportingReads(AD)\t$sample.TotalDepth(DP)\t$sample.GenotypeQuality(GQ)";
		}
		print "\n";
	}
	# skip rest of header
	next if substr($line[0],0,1) eq "#";
	
	# parse INFO field
	my %info = ();
	foreach my $info_value (split(";",$line[7])){
		my @key_value = split("=",$info_value);
		if(scalar(@key_value) > 1){
			$info{$key_value[0]} = $key_value[1];
		}else{
			$info{$info_value} = 1;
		} 
	}


	# reformat sample columns and print output
	my @alt_alleles = split(",",$line[4]);
	for(my $i = 0; $i < scalar(@alt_alleles); $i++){ # split muliple alt alleles onto seperate lines
		print join("\t",@line[0..3])."\t".$alt_alleles[$i]."\t".join("\t",@line[5..6]);
		# print out annotations from INFO
		#foreach my $annotation (@annotation_fields){
		#	if(exists $info{$annotation}){
		#		print "\t".$info{$annotation};
		#	}else{
		#		print "\t.";
		#	}
		#}

		# Get FORMAT index positions
		my $count = 0;
		my %format_index = ();
		foreach my $fvalue (split(":",$line[8])){
			$format_index{$fvalue} = $count;
			$count++;
		}
		
		my %group_alt_alleles = ();
		my %num_of_alleles = ();
		my %alt_allele_count = ();
		my $row_to_print = "";
		foreach my $grp (sort keys %group_sample_count){
			$num_of_alleles{$grp} = 0;
			$alt_allele_count{$grp} = 0;
		}
		# print sample info
		for(my $j = 0; $j < $sample_count; $j++){
			if($line[9+$j] eq "./." or $line[9+$j] eq "." or $line[9+$j] eq ".|."){ # if there is no call
				$row_to_print .=  "\t.\t.\t.\t.";
			}else{
				my ($gt,$dp,$alt_ad,$gq);
				$gt = $dp = $alt_ad = $gq = ".";
				my @ad = ();
				my @sample_fields = split(":",$line[9+$j]);
				my $separator = "/";
				$separator = "|" if index($sample_fields[$format_index{"GT"}],"|") != -1; # check if GT is phased
				my @gt_index = ();
				if($separator eq "|"){
					@gt_index = split("\\".$separator,$sample_fields[$format_index{"GT"}]); # escape the | symbol so it doesnt interpret as OR
				}else{
					@gt_index = split($separator,$sample_fields[$format_index{"GT"}]);
				}
				my @alleles = split(",",$line[3].",".$line[4]);
				if($gt_index[0] eq "."){ # handle cases where GT might be ./1
					if($gt_index[1] eq "."){
						$gt = "."; # no call ./.
					}else{
						$gt = $alleles[$gt_index[1]];
						$num_of_alleles{$groups[$j]} += 2;
						$alt_allele_count{$groups[$j]} +=1 if $gt_index[1] == $i+1;
					}
					$gq = $sample_fields[$format_index{"GQ"}] if defined $sample_fields[$format_index{"GQ"}];
				}else{
					if($gt_index[0] == $i+1 || $gt_index[1] == $i+1){ # only print the GT if it is the relevant alt allele
						$gt = $alleles[$gt_index[0]].$separator.$alleles[$gt_index[1]];
						$gq = $sample_fields[$format_index{"GQ"}] if defined $sample_fields[$format_index{"GQ"}];
						$num_of_alleles{$groups[$j]} += 2;
						$alt_allele_count{$groups[$j]} +=1 if $gt_index[0] == $i+1;
						$alt_allele_count{$groups[$j]} +=1 if $gt_index[1] == $i+1;
					}elsif($gt_index[0] == 0 && $gt_index[1] == 0){ # hom ref call
						$gt = $alleles[$gt_index[0]].$separator.$alleles[$gt_index[1]];
						if(defined $format_index{"GQ"}){
							$gq = $sample_fields[$format_index{"GQ"}] if defined $sample_fields[$format_index{"GQ"}];
						}
						$num_of_alleles{$groups[$j]} += 2;
					}
				}
				if(defined $format_index{"AD"}){
					if(defined $sample_fields[$format_index{"AD"}]){ # print the AD associated with current alt allele, regardless of GT
						@ad = split(",",$sample_fields[$format_index{"AD"}]);
						$alt_ad = $ad[$i+1] if scalar(@ad) > 1;
					}
				}
				if(defined $format_index{"DP"}){
					$dp = $sample_fields[$format_index{"DP"}] if defined $sample_fields[$format_index{"DP"}];
				}
				$row_to_print .= "\t".$gt."\t".$alt_ad."\t".$dp."\t".$gq;
			}
		}
		# calculate Allele frequency and print out row
		foreach my $grp (sort keys %group_sample_count){
			my $grp_af = 0;
			if($num_of_alleles{$grp} != 0){
				my $unrounded_af = $alt_allele_count{$grp}/$num_of_alleles{$grp};
				$grp_af = sprintf("%.3f", $unrounded_af);
			}
			print "\t".$grp_af."\t".$num_of_alleles{$grp};
		}
		# print out annotations
		#print "\t".join("\t",@line[9+$sample_count..$#line]);
		foreach my $ann (@annotation_fields){
			if(exists $info{$ann}){
				print "\t".$info{$ann};
			}else{
				print "\t.";
			}
		}
		print $row_to_print;
		print "\n";
	}
}

sub help{

        print '
DESCRIPTION:
        bior_vcf2xls.pl will convert the VCF output from bior into a friendlier format. The user must
        pass in a config file listing the annotations in the INFO column they would like parsed out. 
	The new tab-delimited format will also split the per-sample columns and include GT, AD, 
        DP, and GQ columns for each sample.

USAGE:
        bior_vcf2xls.pl -i annotation.txt -o friendly_annotation.xls -c bior_config.txt
        cat input.vcf | bior_annotate | bior_tjson_to_vcf | bior_vcf2xls.pl -c bior_config.txt > friendly_annotation.xls

OPTIONS:
        --in,-i         	Optional path to input bior_annotation file. If this option is omitted 
                        	then the script will read from STDIN.

        --out,-o        	Optional path to output annotation file. If this option is omitted then 
                        	the script will print to STDOUT.

        --bior_config,-c	Required parameter defining the bior annotations in the INFO column that
				should be parsed out. File should have one annotation ID per line.

        --groups,-g     	Optional path to a txt file listing the groups each sample belongs to. The 
                        	file should contain one group name per line which will label the samples in 
                        	the order they exist in the annotation file. The script can use this file to 
                        	calculate per-group AlleleFrequencies and AlleleNumbers.

        --help,-h,-?    	Display this help documentation.

';
exit;
}
	


