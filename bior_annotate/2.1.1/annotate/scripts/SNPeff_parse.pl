use List::MoreUtils;
my @VALUES=();
#open file
open(VCF,"$ARGV[0]") or die "must specify VCF file\n\n
Usage: 
perl SNPEFF_parse.pl test.vcf > results.out

";

while (<VCF>) {
    #Some versions of SNPEFF have trailing whitespaces.
    $_=~s/ $//;
    #skip headers
    if ($_=~/^##/){
		if ($_=~/##INFO=<ID=EFF/) {
			$_=~s/ \"/\"/g;
			$_=~s/\" /\"/g;
			$_=~s/\(/\|/;
			$_=~s/\)//;
			print;
			chomp;
			#my @string=split(/\(/,$_);
			@string=split(/\'/,$_);
			$string=$string[1];
			$string=~s/\[|\]| //g;
			$string=~s/=EFF=/=/;
			@VALUES=split(/\|/,$string);
			#print "\n\nVALUES=@VALUES\n";
			#print out proper headers for them
			for ($j=0;$j<@VALUES;$j++){       
				$string="##INFO=<ID=snpeff.$VALUES[$j],Number=1,Type=String,Description=\"Annotation from SNPEFF\">\n";
				print $string;
			}
			next;
		}
                if ($_=~/##INFO=<ID=ANN/) {
                        $_=~s/ \"/\"/g;
                        $_=~s/\" /\"/g;
                        print;
                        chomp;
                        $_=~s/ |\'|\"|>//g;
			@VALUES=split(/\|/,$_);
                        #print out proper headers for them
                        for ($j=1;$j<@VALUES;$j++){
                                $string="##INFO=<ID=snpeff.$VALUES[$j],Number=1,Type=String,Description=\"Annotation from SNPEFF\">\n";
                                print $string;
                        }
                        next;
                }

		else{
			$_=~s/ \"/\"/g;
			$_=~s/\" /\"/g;
			print;
			next;
		}
    }
    #Get sample names
    elsif ($_=~/^#CHROM/) {
		print;
		next;
    }      
    else{
        #Extract info
		next if ($_=~/^#/);
        chomp;
        my @ROW=split(/\t/,$_);
		my $len=scalar(@ROW)-1;
		#print "ROW==@ROW\n\nLENGTH=$len\n\n";die;
        my @INFO=split(/;/,$ROW[7]);
		my $new_INFO="";
		my $try="";
        for (my $i=0;$i<@INFO;$i++){
			my $tag=$INFO[$i];$tag=~s/;;/;/g;
			#If INFO doesn't match EFF, then add to new
			if($tag=~/ANN=/){
				@alternateResults=split(/,/,$tag);
				#Sort in order of importance to the last even it HIGH or MODERATE
				@alternateResults=&sortSNPEFF(@alternateResults);
				for ($j=0;$j<@alternateResults;$j++){
					@entries=split(/\|/,$alternateResults[$j]);
					for (my $i=1;$i<@entries;$i++){
        	                                #next if (!$entries[$i]);
                	                        $new_INFO.="snpeff.".$VALUES[$i]."=".$entries[$i].";";
                        	        }

				}
			}
			elsif ($tag=~/EFF=/){
				 my $line="";
				 $try=$new_INFO;
				 $tag=~s/\(/\|/g;
				 $tag=~s/\)//g;
				 @alternateResults=split(/,/,$tag);
				 @alternateResults=&sortSNPEFF(@alternateResults);
				 for ($j=0;$j<@alternateResults;$j++){
					 @entries=split(/\|/,$alternateResults[$j]);
					 for (my $i=0;$i<@entries;$i++){
						next if ((!$entries[$i])||(!$VALUES[$i]));
						 $VALUES[$i]=~s/EFF=//;
						 $entries[$i]=~s/EFF=//;
						 #print "$VALUES[$i]=$entries[$i]\n";
					 $new_INFO.="snpeff.".$VALUES[$i]."=".$entries[$i].";";
					 }
				}
			 }
			else{
				$new_INFO.=$tag.";";
			}
		}
       $line=join ("\t",@ROW[0..6],$new_INFO,@ROW[8..$len])."\n";
		#$line=~s/\t\n/\n/;
		print $line;
		}
}
close VCF;


sub sortSNPEFF {
	@newArray = ();
	#Put moderate effects as last
	for ($i=0;$i<@_;$i++){
		if ($_[$i]=~/MODERATE/){
			push @newArray, $_[$i];
		}
		else{
			unshift @newArray, $_[$i];
		}
	}
	#Now make sure that HIGH is after MODERATE
	        for ($i=0;$i<@_;$i++){
                if ($_[$i]=~/HIGH/){
                        push @newArray, $_[$i];
                }
                else{
                        unshift @newArray, $_[$i];
                }
        }
my %seen;
my @unique = grep { !$seen{$_}++ } @newArray;
return @unique;
}
