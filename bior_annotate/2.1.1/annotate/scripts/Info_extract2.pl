##fix
#!/usr/bin/perl 
use strict;
use Getopt::Long;
use List::MoreUtils 'any';
#use Data::Dumper;

#Create a script that will extract info from the info field and report Sample names
#Usage: INFO_extract.pl <VCF> -query AC,AN,AF
#    -s Specify "-s true" to output sample-specific genotypes

#Initialize values
my (@queries,$queries,@HEADER,$samples,@HEADER_OUT,$end,$samp,$stop,$p);
GetOptions ("query|q=s" => \$queries,
		"stop:s" => \$stop,
                "p" => \$p,

            );
if(!$queries){die "Usage: INFO_extract.pl <VCF> -query AC,AN,AF 
	-stop\tWhich is the last column containing samples
\n\n";}
$queries=~s/\n//g;
@queries = split(/,/,join(',',$queries));
#print "Looking for @queries\n";die;
#open file
open(VCF,"$ARGV[0]") or die "must specify VCF file\n\n";
while (<VCF>) {
    #skip headers
    if ($_=~/^##/){print;next};
    #Get sample names
    if ($_=~/^#CHROM/) {
        chomp;
        @HEADER=split(/\t/,$_);
        push(@HEADER,@queries);
        #Add the last column to be sample names
        push(@HEADER,"Samples");
        print join ("\t",@HEADER)."\n";
    }
    else{
        #Extract info
        chomp;
        my @ROW=split(/\t/,$_);
        my @INFO=split(/;/,$ROW[7]);
#print "I'm looking in @INFO\n" ;die;
       #For each value in INFO, if it matches the queries, then put it into a hash
        my %requested_fields=();
        for (my $i=0;$i<@INFO;$i++){
            my $tag=$INFO[$i];
            #split on = to match true value
            if($tag=~/=/){
	            my @pairs=split(/=/,$tag);next if (!$pairs[1]);
        	    my $match_found = any { $pairs[0] } @queries;
	            #If match is found, insert into hash
        	    if ($match_found) {
                	next if exists ($requested_fields{$pairs[0]});
			$requested_fields{$pairs[0]}=$pairs[1];
			#print "$requested_fields{$pairs[0]}=$pairs[1];\n";
			}
		}
	    else {$requested_fields{$tag}=$tag}
        }
        #Check to see if all variables are set, and if not, default with "."
        my ($id);
        foreach $id (@queries){
            next if exists $requested_fields{$id};
            $requested_fields{$id}=".";
        }

        #Now go through to get the samples names that have a mutation
        my @SAMPLES=();
	if($samp){@SAMPLES="."}
        if (!$stop) {$stop=scalar(@HEADER)-scalar(@queries)}
        for (my $j=9;$j<=$stop;$j++){
	#Get GT
            my @SampleINFO=();
            my $GT="";
		if($ROW[$j]){
            @SampleINFO=split(/:/,$ROW[$j]);
            $GT=$SampleINFO[0];
            $GT=~s/0|\.|\///g;}
            if(($GT)&&(!$samp)){push (@SAMPLES,$HEADER[$j])};
        }
        print join ("\t",@ROW)."\t";
        foreach my $id (@queries){
            print $requested_fields{$id}."\t";
        }
        my $SAMPLENAMES=join(',',@SAMPLES);
        print $SAMPLENAMES ;
	print "\n";
#print "\n\n,$HEADER[$stop]\n\n";
    }
}
close VCF;


