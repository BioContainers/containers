#!/bin/sh
exec 2>/dev/null
##################################################################################
###
###     Parse Argument variables
###
##################################################################################
echo "Options specified: $@"
##fix
while getopts "h:v:o:t:T:d:r:ce:lD:" OPTION; do
  case $OPTION in
    h) echo "Read the instructions"
        exit ;;
    o) outname=$OPTARG ;;
    t) table=$OPTARG ;;
    d) CREATE_DIR=$OPTARG ;;
	T) tool_info=$OPTARG ;;
	c) catalogs=$OPTARG ;;
	r) drill=$OPTARG ;;
	e) editLabel=$OPTARG ;;
	l) LOG="TRUE" ;;
	D) DIR=$OPTARG ;;
   \?) echo "Invalid option: -$OPTARG. See output file for usage." >&2
       usage
       exit ;;
    :) echo "Option -$OPTARG requires an argument. See output file for usage." >&2
       usage
       exit ;;
  esac
done

source $tool_info
source ${BIOR_ANNOTATE_DIR}/scripts/shared_functions.sh

if [ ! -z "$LOG" ] 
then 
set -x
fi

##################################################################################
###
###     Setup configurations
###
##################################################################################

#Count to make sure there are at least as many variants in the output as were in the input
for x in *anno
do
PRECWD_VCF=${x/.anno/}
#echo "x=$x and PRECWD_VCF=$PRECWD_VCF"
if [ -z "$PRECWD_VCF"  ];
then
        echo "Can't find PRECWD_VCF=$PRECWD_VCF ";
        exit 100;
fi
START_NUM=`cat $PRECWD_VCF|grep -v "#"|wc -l|cut -f1 -d" "`
END_NUM=`cat $x|grep -v "#"|wc -l|cut -f1 -d" "`
if [ ! "$END_NUM" -ge "$START_NUM" ];
then 
        echo "$x has insufficient number of rows to be considered complete";
        echo "PRECWD_VCF=$PRECWD_VCF START_NUM=$START_NUM END_NUM=$END_NUM";
        exit 100;
fi
if [ ${PRECWD_VCF: -3} == "000" ]
then
        #Add the header from the first file
	echo "##fileformat=VCFv4.1" > ${outname}.vcf
         head -500 $x | grep "##"|sort -u |$PERL -pne 's/$editLabel//g;s/\t\n/\n/' >> ${outname}.vcf
        #head -500 $x|grep "##" >> ${outname}.vcf
        tail -n1 ${PRECWD_VCF%???}.header >> ${outname}.vcf
        cat $x|grep -v "#"|$PERL -pne 's/\t\n/\n/;s/==/=/g;s/\t;/\t/'|$PERL -ne 'BEGIN{$chr="chr";$pos=0;$ref="N";$alt="N"};if($_=~/^#/){print}else{chomp; ($CHR,$POS,$ID,$REF,$ALT,@LINE)=split("\t",$_); next if($CHR==$chr && $POS==$pos && $REF eq $ref && $ALT eq $alt &&!(eof)); $chr=$CHR;$pos=$POS;$ref=$REF;$alt=$ALT; print "$_\n";}'  >> ${outname}.vcf
else
        # Get the variants only
        cat $x|grep -v "#" | $PERL -pne 's/$editLabel//g;s/\t\n/\n/g;s/==/=/g;s/\t;/\t/' |$PERL -ne 'BEGIN{$chr="chr";$pos=0;$ref="N";$alt="N"};if($_=~/^#/){print}else{chomp; ($CHR,$POS,$ID,$REF,$ALT,@LINE)=split("\t",$_); next if($CHR==$chr && $POS==$pos && $REF eq $ref && $ALT eq $alt &&!(eof)); $chr=$CHR;$pos=$POS;$ref=$REF;$alt=$ALT; print "$_\n";}' >> ${outname}.vcf
fi
done

if [ "$table" != "0" ]
then
	### create the config file for parser to create the XLS file from a VCF file
	#for catalog in `cat $drill | cut -f1`
	#do
	#	for annot in `cat $drill | grep -w $catalog | cut -f2 | tr "," " "`
	#	do
	#		echo "$catalog.$annot" >> vcf2xls.config.txt
	#	done
	#done
	#$PERL $DIR/bior_vcf2xls.pl -i ${outname}.vcf -o ${outname}.xls -c vcf2xls.config.txt   	
	#mv ${outname}.xls ../
	if [ "$table" == 1 ]
	then
		$PERL $DIR/bior_vcf2xls.pl -i ${outname}.vcf -o ${outname}.xls -c drill.table
	fi
	if [ "$table" == 2 ]
	then
		DRILLS=`cat drill.table|tr "\n" ","`
		$PERL $DIR/Info_extract2.pl ${outname}.vcf -q $DRILLS|grep -v "##" >  ${outname}.xls
	fi
fi	

cat ${outname}.vcf|$BEDTOOLS/sortBed -header |$TABIX/bgzip -c > ${outname}.vcf.gz
BEGINNING=`grep -v "#" ${outname}.vcf|wc -l`
FINAL=`zcat  ${outname}.vcf.gz|grep -v "#"|wc -l`
if [ $FINAL -lt $BEGINNING ]
then
	echo "ERROR! Compression failed"
	exit 100
fi
rm ${outname}.vcf
# $TABIX/bgzip -f ${outname}.vcf
$TABIX/tabix -f -p vcf ${outname}.vcf.gz

#mv ${outname}.vcf.gz ../

#Clean up
if [[ -z "$LOG" && ! -z "$CREATE_DIR" ]]
then
  rm -r "$CREATE_DIR/"
fi

