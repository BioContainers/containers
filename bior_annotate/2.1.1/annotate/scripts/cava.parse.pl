#!/usr/bin/env perl
use Switch;
#CAVA_parse
while (<>){
	if($.==1){
		print "##fileformat=VCFv4.1\n##INFO=<ID=CAVA_IMPACT,Number=.,Type=String,Description=\"Translated from 1: HIGH, 2: MODERATE, 3: LOW\">\n";
	}
	if($_=~/^#/){
		chomp;
		s/##INFO=<ID=GENE,/##INFO=<ID=CAVA_GENE,/;
		s/##INFO=<ID=ENST,/##INFO=<ID=CAVA_ENST,/;
		s/##INFO=<ID=TRINFO,/##INFO=<ID=CAVA_TRINFO,/;
		s/##INFO=<ID=LOC,/##INFO=<ID=CAVA_LOC,/;
		s/##INFO=<ID=CSN,/##INFO=<ID=CAVA_CSN,/;
		s/##INFO=<ID=CLASS,/##INFO=<ID=CAVA_CLASS,/;
		s/##INFO=<ID=SO,/##INFO=<ID=CAVA_SO,/;
		s/##INFO=<ID=ALTFLAG,/##INFO=<ID=CAVA_ALTFLAG,/;
		s/##INFO=<ID=ALTANN,/##INFO=<ID=CAVA_ALTANN,/;
		s/##INFO=<ID=ALTCLASS,/##INFO=<ID=CAVA_ALTCLASS,/;
		s/##INFO=<ID=ALTSO,/##INFO=<ID=CAVA_ALTSO,/;
		s/##INFO=<ID=DBSNP,/##INFO=<ID=CAVA_DBSNP,/;
		s/##INFO=<ID=TYPE,/##INFO=<ID=CAVA_TYPE,/;
		s/,Source="CAVA",Version=\"1.0.0\"//;
		print $_."\n";
		next;
	}
	else{
		chomp;
		@INF=split(/\t/,$_);
		@INFO=split(/;/,$INF[7]);
		@NEW=();@NEW2=();
		for ($i=0 ; $i<scalar(@INFO);$i++){
			checkForDup($INFO[$i]);
		}#Done with For loop
	}	
	$INFO=join(";",@NEW);
	$line=join("\t",@INF[0..6],$INFO,@INF[8..@INF]);
	$line=~s/\t$//;
	print $line."\n";
	if (@NEW2){
		$INFO2=join(";",@NEW2);
		$line2=join("\t",@INF[0..6],$INFO2,@INF[8..@INF]);
		$line2=~s/\t$//;
		print $line2."\n";
		}
		@NEW=();@NEW2=();
	}

sub checkForDup(){
	my ($key,$val)=split(/=/,$INFO[$i]);
	if ($key =~ /IMPACT|GENE|TRINFO|LOC|^CSN|^CLASS|^SO|^ALTFLAG|^ALTCLASS|^DBSNP|^TYPE|^ALTANN|^ALTSO/){
		#print "My KEY=$key and my VAL is $val\n";
		if ($val =~/:/){
			my @var=split(/:/,$val);
			my $var=join("=",$key,@var[0]);
			#print "Looking at var=$var\n";
			reCodeCAVA($var);
			my $var=join("=",$key,$var[1]);
			#print "Second one is =$var\t VAL=$val\n";
			reCodeCAVA2($var);		}
		#Print normal
		else{
			reCodeCAVA($INFO[$i]);
		}
	}
	reCodeCAVA($INFO[$i]);
}

sub reCodeCAVA(){
	my $ANNO=@_[0];
	#Translate 1-3 into HIGH-LOW
	if ($ANNO =~ /IMPACT=1/){push (@NEW,"CAVA_IMPACT=HIGH" )}
	elsif($ANNO =~ /IMPACT=2/){push (@NEW,"CAVA_IMPACT=MODERATE" )}
	elsif($ANNO =~ /IMPACT=3/){push (@NEW,"CAVA_IMPACT=LOW" )}
	elsif($ANNO =~ /IMPACT=\./){push (@NEW,"CAVA_IMPACT=LOW" )}
	else{
		$ANNO=~s/GENE=/CAVA_GENE=/;
		$ANNO=~s/ENST=/CAVA_ENST=/;
		$ANNO=~s/TRINFO=/CAVA_TRINFO=/;
		$ANNO=~s/LOC=/CAVA_LOC=/;
		$ANNO=~s/^CSN=/CAVA_CSN=/;
		$ANNO=~s/^CLASS=/CAVA_CLASS=/;
		$ANNO=~s/^SO=/CAVA_SO=/;
		$ANNO=~s/^ALTANN=/CAVA_ALTANN=/;
		$ANNO=~s/^ALTSO=/CAVA_ALTSO=/;
		$ANNO=~s/^ALTFLAG=/CAVA_ALTFLAG=/;
		$ANNO=~s/^ALTCLASS=/CAVA_ALTCLASS=/;
		$ANNO=~s/^DBSNP=/CAVA_DBSNP=/;
		$ANNO=~s/^TYPE=/CAVA_TYPE=/;
		push(@NEW,$ANNO);
		#print "ANNO = $ANNO\n";
	}
}

sub reCodeCAVA2(){
	my $ANNO=@_[0];
	#Translate 1-3 into HIGH-LOW
	if ($ANNO =~ /IMPACT=1/){push (@NEW2,"CAVA_IMPACT=HIGH" )}
	elsif($ANNO =~ /IMPACT=2/){push (@NEW2,"CAVA_IMPACT=MODERATE" )}
	elsif($ANNO =~ /IMPACT=3/){push (@NEW2,"CAVA_IMPACT=LOW" )}
	elsif($ANNO =~ /IMPACT=\./){push (@NEW2,"CAVA_IMPACT=LOW" )}
	else{
		$ANNO=~s/GENE=/CAVA_GENE=/;
		$ANNO=~s/ENST=/CAVA_ENST=/;
		$ANNO=~s/TRINFO=/CAVA_TRINFO=/;
		$ANNO=~s/LOC=/CAVA_LOC=/;
		$ANNO=~s/^CSN=/CAVA_CSN=/;
		$ANNO=~s/^CLASS=/CAVA_CLASS=/;
		$ANNO=~s/^SO=/CAVA_SO=/;
		$ANNO=~s/^ALTANN=/CAVA_ALTANN=/;
		$ANNO=~s/^ALTSO=/CAVA_ALTSO=/;
		$ANNO=~s/^ALTFLAG=/CAVA_ALTFLAG=/;
		$ANNO=~s/^ALTCLASS=/CAVA_ALTCLASS=/;
		$ANNO=~s/^DBSNP=/CAVA_DBSNP=/;
		$ANNO=~s/^TYPE=/CAVA_TYPE=/;
		push(@NEW2,$ANNO);
	}
}
