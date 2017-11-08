#!/bin/sh
##################################################################################
###
###     Parse Argument variables
###
##################################################################################
##fix
echo "Options specified: $@"| tr "-" "\n"
while getopts "D:g:p:M:v:sT:od:t:l:j:hLc" OPTION; do
  case $OPTION in
    h) echo "Read the instructions"
        exit ;;
    v) CWD_VCF=$OPTARG ;;
    s) runsnpeff="TRUE" ;;
    T) tool_info=$OPTARG ;;
    o) runsavant="TRUE" ;;
	c) runCAVA="TRUE" ;;
    d) drills=$OPTARG ;;
    t) table=$OPTARG ;;
    l) log=$OPTARG ;;
    j) INFO_PARSE=$OPTARG ;;
    p) PEDIGREE=$OPTARG ;;
    g) GENE_LIST=$OPTARG ;;
    L) LINKOFF="TRUE" ;;
    M) MEM_INFO=$OPTARG ;;
	D) DIR=$OPTARG ;;
   \?) echo "Invalid option: -$OPTARG. See output file for usage." >&2
       usage
       exit ;;
    :) echo "Option -$OPTARG requires an argument. See output file for usage." >&2
       usage
       exit ;;
  esac
done

if [ -z "$tool_info" ]
then
	echo "TOOL FILE DOESNT EXIST! : $tool_info"
	echo "VCF=$CWD_VCF"
	ls -lhrt $CWD_VCF
	exit 100
fi
source "$tool_info"
source "$MEM_INFO"
source ${BIOR_ANNOTATE_DIR}/scripts/shared_functions.sh

if [[ -z "$CWD_VCF" || ! -e "$CWD_VCF" || ! -s "$CWD_VCF" ]]
then
   ${BIOR_ANNOTATE_DIR}/email.sh -f \$CWD_VCF -m ba.program.sh -M "VCF file does not exist" -p \$VCF -l \$LINENO
   exit 100
fi

export PYTHONPATH=$PYTHON:$PYTHONLIB
export PERL5LIB=$PERLLIB:$PERL5LIB
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
SNPEFF_PARSE=$DIR/SNPeff_parse.pl
SAVANT_PARSE=$DIR/savant.label.pl
CAVA_PARSE=$DIR/cava.parse.pl 
INHERITANCE=$DIR/Inheritance.pl
COMPOUNDHET=$DIR/CompoundHet.pl
LINKS=$DIR/AddLinksToVCF.pl
TRIM=$DIR/VCF_remove.pl
#JAVA_HOME=/usr/local/biotools/java/jdk1.7.0_03
export JAVA_HOME=$JAVA7


DRILLS=`$PERL -ane '$string="";@array=split(",",$F[1]);for ($i=0;$i<@array;$i++){$string=$string.";$F[0].$array[$i]"}{$string=~s/^,//;print $string}' $drills`
if [ "$log" == "TRUE" ]
then
	set -x
fi
START_NUM=`egrep -v "#|^$" $CWD_VCF |wc -l|cut -f1 -d" "`

if [ "$runsnpeff" == "TRUE" ]
then
  echo "Running SNPeff"
	$JAVA7/java -Xmx$snpeff_mem -jar $SNPEFF/snpEff.jar $SNPEFF_params -c $SNPEFF/snpEff.config $SNPEFF_DB $CWD_VCF > $CWD_VCF.tmp
	$PERL $SNPEFF_PARSE  $CWD_VCF.tmp > $CWD_VCF
	END_NUM=`grep -v "#" ${CWD_VCF}|wc -l|cut -f1 -d" "`
	if [ ! "$END_NUM" -ge "$START_NUM" ];
	then 
		echo "${CWD_VCF} SnpfEFF
		Failed" >> ../err.log
    	exit 100
	fi
fi

# if [ "$runsavant" == "TRUE" ]
# then
#   echo "Running SAVANT"
# 	$PYTHON/python $SAVANT -c $SAVANT_CONFIG -i $CWD_VCF -o $CWD_VCF.tmp
# 	cat $CWD_VCF.tmp.vcf |$PERL $SAVANT_PARSE - |$PERL -pne 's/\s\n/\n/' > $CWD_VCF.tmp2.vcf
# 	mv $CWD_VCF.tmp2.vcf $CWD_VCF.tmp.vcf
# 	END_NUM=`egrep -v "#|^$" ${CWD_VCF}.tmp.vcf |wc -l|cut -f1 -d" "`
# 	if [ ! "$END_NUM" -ge "$START_NUM" ];
# 	then 
# 		echo  "${CWD_VCF}.savant has insufficient number of rows. SAVANT Failed" >> ../err.log;
#     	exit 100;
# 	fi
# 	mv $CWD_VCF.tmp.vcf $CWD_VCF
# fi

if [ "$runCAVA" == "TRUE" ]
then
  echo "Running CAVA"
	$PYTHON/python $CAVA -c $CAVA_CONFIG -i $CWD_VCF -o $CWD_VCF.tmp
	cat $CWD_VCF.tmp.vcf |$PERL $CAVA_PARSE - |$PERL -pne 's/\s\n/\n/' > $CWD_VCF.tmp2.vcf
	mv $CWD_VCF.tmp2.vcf $CWD_VCF.tmp.vcf
	END_NUM=`egrep -v "#|^$" ${CWD_VCF}.tmp.vcf |wc -l|cut -f1 -d" "`
	if [ ! "$END_NUM" -ge "$START_NUM" ];
	then 
		echo  "${CWD_VCF}. CAVA has insufficient number of rows. CAVA Failed" >> ../err.log;
    	exit 100;
	fi
	mv $CWD_VCF.tmp.vcf $CWD_VCF
fi




#IF PEDIGREE is specified, and AF, then you can run
if [ ! -z "$PEDIGREE" ]
then
	echo "PEDIGREE = $PEDIGREE"
	if [ ! -z "GENE_LIST" ]
	then
		GENE_LIST=" -g $GENE_LIST "
	fi
	if [[ $DRILLS == *ExAC* ]]; 
	then 
		$PERL $INHERITANCE -v $CWD_VCF -p $PEDIGREE $GENE_LIST|$PERL $COMPOUNDHET -v - -p $PEDIGREE >  $CWD_VCF.tmp
		END_NUM=`egrep -v "#|^$" ${CWD_VCF}.tmp |wc -l|cut -f1 -d" "`
		if [ ! "$END_NUM" -ge "$START_NUM" ];
		then 
		echo "$PERL $INHERITANCE -v $CWD_VCF -p $PEDIGREE $GENE_LIST|$PERL $COMPOUNDHET -v - -p $PEDIGREE >  $CWD_VCF.tmp"
		echo "${CWD_VCF} Inheritance script Failed" >> ../../err.log
    	exit 1
		fi
	mv $CWD_VCF.tmp $CWD_VCF
	fi
fi

#Add VCF Links for VCF miner
if [ -z "$LINKOFF" ]
then
	$PERL $LINKS -v $CWD_VCF | $PERL $TRIM -v - -o BaseQRankSum,ClippingRankSum,DS,END,FS,HaplotypeScore,InbreedingCoeff,MLEAC,MLEAF,MQRankSum,NEGATIVE_TRAIN_SITE,POSITIVE_TRAIN_SITE,QD,ReadPosRankSum,SOR,VQSLOD,set  > $CWD_VCF.tmp
		END_NUM=`egrep -v "#|^$" ${CWD_VCF}.tmp |wc -l|cut -f1 -d" "`
		if [ ! "$END_NUM" -ge "$START_NUM" ];
		then 
		echo "${CWD_VCF} Add Links script Failed" >> ../../err.log
		exit 100
		fi	
	mv $CWD_VCF.tmp $CWD_VCF
fi

editLabel="bior\.\.|INFO\.|Info\.|bior\."
#Print out table
if [ "$table" != 0 ]
then
echo "Making table file"
echo "$DRILLS"|tr ";" "\n"|awk '($1)' > drill.table	
	if [ "$runsavant" == "TRUE" ];
	then 
		echo -e "SAVANT_EFFECT\nSAVANT_IMPACT\nSAVANT_GENE\nSAVANT_HGVS\nSAVANT_CLASS\nSAVANT_ALTANN" >> drill.table
	fi
	if [ "$runsnpeff" == "TRUE" ]
	then 
		echo -e "snpeff.Gene_name\nsnpeff.Amino_acid_change\nsnpeff.Transcript\nsnpeff.Exon\nsnpeff.Effect\nsnpeff.Effect_impact\nsnpeff.Amino_acid_change\nsnpeff.Codon_change" >> drill.table
	fi
	if [ "$runCAVA" == "TRUE" ];
	then 
		echo -e "CAVA_IMPACT\nCAVA_TYPE\nCAVA_GENE\nCAVA_ENST\nCAVA_TRINFO\nCAVA_LOC\nCAVA_CSN\nCAVA_CLASS\nCAVA_SO\nCAVA_ALTFLAG\nCAVA_ALTANN\nCAVA_ALTCLASS\nCAVA_DBSNP" >> drill.table
	fi
	echo "Drilling into the data"
	#cat drill.table
	echo "#######################################################"
	#$PERL $INFO_PARSE $CWD_VCF -q "${DRILLS}" |grep -v "##"|perl -pne 's/$editLabel//g' > $CWD_VCF.xls
fi    
#Final files $CWD_VCF & possibly $CWD_VCF.savant.xls

