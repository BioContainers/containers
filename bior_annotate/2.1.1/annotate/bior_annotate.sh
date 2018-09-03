#!/bin/sh
##################################################################################
###
###     Name:           bior_annotate.sh
###     Creator:        Steven N Hart, PhD
###     Function:       This script is designed to create a central architecture for bior
###                                     annotations.  Using configuration files, the user specifies
###                                     which annotations from which catalogs they want to extract.
###                                     This script only works with bior_overlap and bior_same_varaint.
###                                     It will split the number of annotation jobs into X variants per
###                                     file, which then get sent to the cluster for annotation.  It
###                                     Automatically seperates multi-VCF records to 1 per row.
###                                     There are a couple of PATHS that need to be checked below.
###
##################################################################################
##fix
usage ()
{
cat << EOF
##########################################################################################################
##
## Script Options:
##   Required:
##      -o    Output file name [required] ***Name only, not PATH***
##      -v    path to the VCF to annotate     [required]
##   Optional:
##      -c    path to catalog file
##      -d    Path to the drill file
##      -h    Display this usage/help text
##      -j    job name for qsub command
##      -l    set logging
##      -L    Do not add links to VCF [default is set to TRUE]
##      -M    memory info file
##      -n    Number of lines to split the data into  [default:20000]
##      -O    output directory [cwd]
##      -q    Flag to turn on SNPEFF
##      -a    Flag to turn off CAVA annotation
##      -Q    queue override (e.g. 1-day) [defaults to what is in the tool_info]
##      -t    Export table as well as VCF [1]
##				Version 1: Seperate columns for Depth, GQ, AD, and GT per sample
##				Version 2: First N columns like VCF, one colulmn containing sample names
##      -T    tool info file 
##      -x    path to temp directory [default: cwd]
##
##
##	Clinical specific options 
##      -P    PEDIGREE file (for trios only, this will add extra annotations)
##      -g    GENE list (only used with pedigrees)



#########################################################################################################

Examples:
        cat catalog_file
                Clinvar bior_same_variant       /data5/bsi/epibreast/m087494.couch/Reference_Data/ClinVar/Clinvar.tsv.bgz
                HPO     bior_overlap    /data5/bsi/catalogs/user/v1/gene_ontology/HPO/2014_10_21/HPO_Gene_w_coordinates.catalog.gz
                ExAC    bior_same_variant       /data5/bsi/catalogs/user/v1/ExAc/2014_10_22/ExAC.r0.1.catalog.gz
                ...
                Note:   column 1 is the ShortUniqueName in the *datasource.properties file for that catalog
                        column 2 is what bior command you wish to run [e.g. overlap or same variant]
                        column 3 is the path to the catalog

                        The name in the catalog_file must match the name in the drill_file EXACTLY

        cat drill_file
                Clinvar RCVaccession,ReviewStatus,ClinicalSignificance,OtherIDs,Guidelines
                HPO     HPO-term-name
                ExAC    Info.AC,Info.AN,Info.AF,Info.AC_Het,AC_Hom
                ...

                Note:  column 1 is the ShortUniqueName in the *datasource.properties file for that catalog
                       column 2 is what features you want to drill out of that catalog

                       The name in the drill_file must match the name in the catalog_file EXACTLY
EOF
}

### Defaults ###
BIOR_ANNOTATE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
runCAVA="-c"
table=0
catalogs="${BIOR_ANNOTATE_DIR}/config/catalog_file"
drills="${BIOR_ANNOTATE_DIR}/config/drill_file"
outdir=$PWD
START_DIR=$PWD
TEMPDIR=$PWD
NUM=20000
log="FALSE"

##################################################################################
###
###     Parse Argument variables
###
##################################################################################
echo "Options specified: $@"

while getopts "ac:Cd:e:g:hj:k:lLM:n:o:O:P:qQ:st:T:v:x:" OPTION; do
  case $OPTION in
  	a)  runCAVA="" ;;
    c)  catalogs=$OPTARG ;;     #
    C)  CLINICAL="TRUE" ;;
    d)  drills=$OPTARG ;;       #
    e)  editLabel=$OPTARG ;;
    g)  GENE_LIST=$OPTARG ;;    #
    h)  usage                   #
        exit ;;
    j)  job_name=$OPTARG ;;     #
    k)  job_suffix=$OPTARG ;;
    l)  log="TRUE" ;;           #
    L)  addLinks=" -L " ;;      #
    M)  memory_info=$OPTARG ;; #
    n)  NUM=$OPTARG ;;       #
    o)  outname=$OPTARG ;;   #
    O)  outdir=$OPTARG ;;    #
    P)  PEDIGREE=$OPTARG ;;     #
    q)  runsnpEff="-s" ;;         #
    s)  runsavant="-o" ;;       #
    Q)  QUEUEOVERRIDE=$OPTARG ;; #
    t)  table=$OPTARG ;;           #
    T)  tool_info=$OPTARG ;;     #
    v)  VCF=$OPTARG ;;           #
    x)  TEMPDIR=$OPTARG ;;       #
    \?) echo "Invalid option: -$OPTARG. See output file for usage." >&2
        usage
        exit ;;
    :)  echo "Option -$OPTARG requires an argument. See output file for usage." >&2
        usage
        exit ;;
  esac
done

if [ "$log" == "TRUE"  ]
then
	set -x
fi

##################################################################################
###
###     Setup configurations
###
##################################################################################
#Make sure I have the full path of the files I need
#Check for required arguments
if [ ! -s "$catalogs" -o ! -s "$drills" -o ! -s "$VCF" -o -z "$outname"  ]
then
  usage
	echo "A required input parameter does not exist or the file is empty. Please check for typos."
	echo "CATALOGS=$catalogs"
	echo "DRILLS=$drills"
	echo "VCF=$VCF"
	echo "outname=$outname"
	exit
fi

if  [[ $outname == *"/"* ]]
then 
	echo "Please do not use a path for this variable!"
	usage
fi


if [ -z "$tool_info" ]
then
    echo "Informational message: You did not supply a tool_info file."
    tool_info=${BIOR_ANNOTATE_DIR}/config/tool_info.txt
fi

if [ -z "$memory_info" ]
then
    echo "Informational message: You did not supply a memory_info file."
		memory_info=${BIOR_ANNOTATE_DIR}/config/memory_info.txt
fi

# Make sure this is a path to a real file, not just a symlink.
tool_info=`readlink -m ${tool_info}`
memory_info=`readlink -m ${memory_info}`

#Makes sure files exist
if [ ! -s "$tool_info" -o ! -s "$memory_info" ]
then
	echo "ERROR: Check the location of your tool and memory info files"
	echo "tool_info=$tool_info"
	echo "memory_info=$memory_info"
	exit 100
fi

# Display the configuration files so the user knows where to find each one
cat << EOF

Using the following configuration files for this run:
  Catalog list: $catalogs
  Drill list:   $drills
  Tool info:    $tool_info
  Memory info:  $memory_info

EOF
#exec 3>&2
#exec 2> /dev/null
source ${tool_info}
source ${memory_info}

# This variable should be defined in the tool_info file.
if [ -z "${WORKFLOW_PATH}" ]
then
  echo "ERROR: WORKFLOW_PATH is not defined in ${tool_info}"
  exit 100
fi

source ${WORKFLOW_PATH}/shared_functions.sh


##Override QUEUE if set
if [ ! -z "${QUEUEOVERRIDE}" ]
then
  QUEUE=${QUEUEOVERRIDE}
fi

catalogs=`readlink -m ${catalogs}`
drills=`readlink -m ${drills}`
VCF=`readlink -m ${VCF}`

# PERLLIB should be set in the tool_info
export PYTHONPATH=${PERLLIB}
#Needed for splitting multi-VCF
export PERL5LIB=${PERL5LIB}
export SCRIPT_DIR=${BIOR_ANNOTATE_DIR}/scripts

INFO_PARSE=${SCRIPT_DIR}/Info_extract2.pl
VCF_SPLIT=${SCRIPT_DIR}/VCF_split.pl
check_variable "$TOOL_INFO:BIOR_PROFILE" $BIOR_PROFILE
source $BIOR_PROFILE
check_variable "$TOOL_INFO:PERL" $PERL
if [ "$runsavant" == "TRUE" ]
then
	check_variable "$TOOL_INFO:SAVANT" $SAVANT
	check_variable "$TOOL_INFO:SAVANT_CONFIG" $SAVANT_CONFIG
	check_variable "$TOOL_INFO:PYTHON" $PYTHON
fi

check_variable "$TOOL_INFO:BEDTOOLS" $BEDTOOLS

if [ ! -z "$PEDIGREE" -a "$PEDIGREE" != "NA" ]
then
	PEDIGREE=`readlink -m $PEDIGREE`
	PEDIGREE=" -p $PEDIGREE "
fi

if [ ! -z "$GENE_LIST" ]
then
	GENE_LIST=`readlink -m $GENE_LIST`
	GENE_LIST="-g $GENE_LIST"
fi

#Change into tmp directory (all output files should be stored here).
cd $TEMPDIR

EMAIL=`finger $USER|grep Name|cut -f4|$PERL -pne 's/(.*;)(.*)(;.*)/$2/'`
if [ -z "${EMAIL}" ]
then
  echo "WARNING: ${USER} not found via finger."
fi


##################################################################################
###
###     QC check all the inputs
###
##################################################################################


#Create Trim function
if [ -z "$editLabel" ]
then
	editLabel="bior\.\.|INFO\.|Info\.|bior\."
fi

##Validate catalog file
#Make sure there are 3 columns
VALIDATE_CATALOG=`awk '{if (NF != 3){print "Line number",NR,"is incorrectly formatted in ",FILENAME}}' $catalogs`
if [ ! -z "$VALIDATE_CATALOG" ]
then
	echo ${VALIDATE_CATALOG} |$PERL -pne 's/L/\nL/g'
	exit 100
fi
#Make sure the commands exist
RES=`cut -f2 $catalogs |sort -u`
for x in $RES
do
	CHECK=""
	CHECK=`which $x`
	if [ -z "$CHECK" ]
	then
		echo "##### ERROR ###############"
		echo "Can't find the $x command"
		echo "Check your $catalogs"
		exit 100
	fi
done
#Make sure the catalogs exist
RES=`cut -f3 $catalogs |sort -u`
for x in $RES
do
	if [ ! -e "$x" ]
	then
		echo "##### ERROR ###############"
		echo "Can't find the $x catalog"
		echo "Check your $catalogs"
		exit 100
	fi
done
echo "$catalogs is validated"

##Validate drill file
#Make sure there are 3 columns
VALIDATE_CATALOG=`awk '{if (NF != 2){print "Line number",NR,"is incorrectly formatted in ",FILENAME}}' $drills`
if [ ! -z "$VALIDATE_CATALOG" ]
then
	echo $VALIDATE_CATALOG |$PERL -pne 's/L/\nL/g'
	exit 100
fi

#Make sure the drill values exist in the catalog and are formatted properly
NUM_ROWS=`awk 'END{print NR }' $drills`
while [ $NUM_ROWS -gt 0 ];
do
	x=$NUM_ROWS
	KEY=$(awk -v var=$x '(NR==var){print $1}' $drills)
	TERMS=$(awk -v var=$x '(NR==var){print $2}' $drills)

	if [[ -z "$KEY" || -z "$TERMS" ]]
	then
    $WORKFLOW_PATH/email.sh -f $drills -m annotate.sh -M "Unable to retrieve drill name or terms" -p $drills -l $LINENO
    exit 100
	fi

	CATALOG=`grep -w $KEY $catalogs |cut -f3|head -1`
	COMMAND=`grep -w $KEY $catalogs |cut -f2|head -1`

	if [[ -z "$CATALOG" || -z "$COMMAND" ]]
	then
    $WORKFLOW_PATH/email.sh -f $catalogs -m annotate.sh -M "Unable to retrieve catalog name or command" -p $catalogs -l $LINENO
    exit 100
	fi

	IFS=',' all_terms=( $TERMS )
	for i in "${all_terms[@]}"
	do
		CHECK=""
		#Remove any trace of clipped terms
		IFS='|' editLabelEvents=( $editLabel )
		trim=$i
		#Remove the strings in the IDs that the user submits
		for k in "${editLabelEvents[@]}"
		do
			trim=${trim/$k/}  #echo "TRIMMING trim=${trim/$k/}"
		done
		#echo "Checking $trim"
		#CHECK=`zcat $CATALOG|head -5000|grep -w ${trim}|head -1`
		CHECK=`grep -w ${trim} ${CATALOG/tsv.bgz/}*columns.tsv`
		if [ -z "$CHECK" ]
		then
			echo "##### ERROR ###############"
			echo "Can't find the ${trim} term in $CATALOG"
			echo "Check your $catalogs"
			echo "zcat $CATALOG|head -5000|grep -w ${trim}|head -1"
			exit 1
		fi
	done
	let NUM_ROWS-=1;
done
echo "All drill values are validated"

##################################################################################
###
###     Start to build the scripts
###
##################################################################################

if [ "$log" == "TRUE" ]
then
	set -x
fi


#Start off by creating a random directory to make sure we never have naming conflicts
CREATE_DIR=$RANDOM
# if we accidentally create a directory that already exists, try again.
until [ ! -e ".bior.${CREATE_DIR}" ]
do
  CREATE_DIR=$RANDOM
done
mkdir .bior.${CREATE_DIR}
cd .bior.${CREATE_DIR}
TEMPDIR=$TEMPDIR/.bior.${CREATE_DIR}
CURRENT_LOCATION=$PWD

#Calculate the number of catalogs
NUM_CATALOGS_TO_DRILL=`awk 'END{print NR }' $drills`

# Create script to annotate the VCF
cat << EOF >> annotate.sh
#!/usr/bin/env bash
#exec 3>&2
#exec 2> /dev/null
source $BIOR_PROFILE
source $tool_info
source ${BIOR_ANNOTATE_DIR}/scripts/shared_functions.sh

set -x
VCF=\$1
CWD_VCF=\`basename \$1\`
DRILL_FILE=$drills
CATALOG_FILE=$catalogs
let count=0

while read drill
do
  let count=\$count+1
  SHORT_NAME=\`echo "\$drill" | cut -f1 \`

  CATALOG=\`grep -w "\$SHORT_NAME" \$CATALOG_FILE|cut -f3|head -1\`
  CATALOG_COMMAND=\`grep -w "\$SHORT_NAME" \$CATALOG_FILE|cut -f2|head -1\`
  TERMS=\`echo "\$drill" | cut -f2\`
  IFS=',' all_terms=( \$TERMS )
  separator=" -p "
  drill_opts="\$( printf "\${separator}%s" "\${all_terms[@]}" )"

  if [ -z "\$CATALOG" ]
  then
    echo "Error parsing CATALOG. Command used: grep -w \"\$SHORT_NAME\" \$CATALOG_FILE|cut -f3|head -1"
    exit 100
  fi

  if [ -z "\$CATALOG_COMMAND" ]
  then
    echo "Error parsing CATALOG_COMMAND. Command used: grep -w \$SHORT_NAME \$CATALOG_FILE|cut -f2|head -1"
    exit 100
  fi

  if [ ! -s "\$VCF" ]
  then
    echo "\$VCF not found. Previous step appears to have failed."
    exit 100
  fi

  cat \$VCF | bior_vcf_to_tjson | \$CATALOG_COMMAND -d \$CATALOG | eval bior_drill \${drill_opts} | bior_tjson_to_vcf > \$CWD_VCF.\$count

  START_NUM=\`cat \$VCF | grep -v '#' | wc -l\`
  END_NUM=\`cat \$CWD_VCF.\$count | grep -v '#' | wc -l\`
  if [[ ! -s \$CWD_VCF.\${count} || ! \$END_NUM -ge \$START_NUM ]]
  then
    $WORKFLOW_PATH/email.sh -f \$CWD_VCF.\${count} -m annotate.sh -M "bior annotation failed using \$CATALOG_FILE" -p \$VCF -l \$LINENO
    exit 100
  fi

  # Set up for next loop
  if [ "\$count" != 1 ]
  then
    let previous=\$count-1
    if [[ "$DEBUG_MODE" == "NO" ]]
    then
      rm \$VCF
    fi
  fi

  VCF=\${CWD_VCF}.\${count}
done <\$DRILL_FILE
$PERL -pne 's/bior.//g' \$CWD_VCF.\${count} > \${CWD_VCF}.anno 2>&1 /dev/null

EOF

##################################################################################
###
###     Split the VCF file into manageable chunks
###
##################################################################################

CWD_VCF=`basename $VCF`
#Check for compressed version
#Remove IDs from VCFs b/c bior uses them incorrectly
if [[ "$CWD_VCF" == *gz ]] ;
then
	zcat $VCF|$PERL $VCF_SPLIT|$PERL -pne 's/[ |\t]$//g'|$PERL -ne 'if($_!~/^#/){$_=~s/ //g;@line=split("\t",$_);$rsID=".";print join("\t",@line[0..1],$rsID,@line[3..@line-1])}else{print}' >${CWD_VCF/.gz/}
	CWD_VCF=${CWD_VCF/.gz/}
else
	cat $VCF|$PERL $VCF_SPLIT |$PERL -pne 's/[ |\t]$//g'|$PERL -ne 'if($_!~/^#/){$_=~s/ //g;@line=split("\t",$_);$rsID=".";print join("\t",@line[0..1],$rsID,@line[3..@line-1])}else{print}' > $CWD_VCF
fi

echo `ls $TEMPDIR/$CWD_VCF`

if [ "$CLINICAL" == "TRUE" ]
then
	#Split PEDIGREE and CWD_VCF to only contain the 3 target samples
	PEDIGREE=${PEDIGREE##*p }
	PEDIGREE=${PEDIGREE/ /}
	echo "$PYTHON/python $SCRIPT_DIR/PEDsplit_AddGT.py $TEMPDIR/$CWD_VCF $PEDIGREE $PEDIGREE.3 $TEMPDIR/${CWD_VCF/.vcf/.trio.vcf} $tool_info"
	$PYTHON/python $SCRIPT_DIR/PEDsplit_AddGT.py $TEMPDIR/$CWD_VCF $PEDIGREE $PEDIGREE.3 $TEMPDIR/${CWD_VCF/.vcf/.trio.vcf} $tool_info
	PEDIGREE="-p $PEDIGREE.3"
	CWD_VCF=${CWD_VCF/.vcf/.trio.vcf}
fi

#SPLIT the VCF files into maneageable chunks
cat $CWD_VCF|$PERL -pne 's/[ |\t]$//g'|head -1000|grep "#" >  ${CWD_VCF}.header 
if [ ! -s "${CWD_VCF}.header" ]
then
  echo "ERROR: failed to generate header for VCF, check $CWD_VCF to ensure the file exists and is formatted correctly."
  exit 100
fi

set -x

cat $CWD_VCF|$PERL -pne 's/[ |\t]$//g'|grep -v "#"|split -d -l $NUM -a 3 - ${CWD_VCF/.gz/}

FIND_RESULTS=`find $TEMPDIR -maxdepth 1 -name "${CWD_VCF}[0-9]*" -print -quit`

if [ -z "$FIND_RESULTS" ]
then
    echo "ERROR: VCF split appears to have failed. Please check $TEMPDIR to ensure that the VCF file ${CWD_VCF} is valid."
    exit 100
fi

#Add a header to each file
for x in ${CWD_VCF}[0-9]*
do
	cat ${CWD_VCF}.header $x > ${CWD_VCF}.tmp
	mv ${CWD_VCF}.tmp $x
done
##################################################################################
###
###     Fire off the qsubs for each split VCF file
###
##################################################################################
args="$SGE -cwd -q $QUEUE -m $NOTIFICATION_OPTION -notify -M $EMAIL -l h_stack=$SGE_STACK"
#Option to run off SGE
#exec 2>&3
if [ "$QUEUE" == "NA" ]
then
	for x in ${CWD_VCF}[0-9][0-9][0-9]
	do
	sh annotate.sh $x
	echo $SCRIPT_DIR/ba.program.sh -v ${x}.anno -d ${drills} -M ${memory_info} -D ${SCRIPT_DIR} -T ${tool_info} -t ${table} -l ${log} ${PROGRAMS} -j ${INFO_PARSE} ${runsnpEff} ${runsavant} ${runCAVA} ${PEDIGREE} ${GENE_LIST}
	sh $SCRIPT_DIR/ba.program.sh -v ${x}.anno -d ${drills} -M ${memory_info} -D ${SCRIPT_DIR} -T ${tool_info} -t ${table} -l ${log} ${PROGRAMS} -j ${INFO_PARSE} ${runsnpEff} ${runsavant} ${runCAVA} ${PEDIGREE} ${GENE_LIST} 
	done
 echo $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o ${outdir}/${outname} -T ${tool_info} -r ${drills} -D ${SCRIPT_DIR} -l ${log}
 sh $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o ${outdir}/${outname} -T ${tool_info} -r ${drills} -D ${SCRIPT_DIR} -l ${log} 
 cd $START_DIR
 if [[ "$DEBUG_MODE" == "NO" ]]
 then
   rm -r ./.bior.${CREATE_DIR}
 fi
 exit 0
fi

for x in ${CWD_VCF}[0-9][0-9][0-9]
do
	if [ "$job_name" ]
	then
		if [ "$job_suffix" ]
		then
			command=$"$args -l h_vmem=$annotate_mem -N $job_name.annotatevcf.$job_suffix annotate.sh $x"
		else
			command=$"$args -l h_vmem=$annotate_mem -N $job_name.annotatevcf annotate.sh $x"
		fi
	else
		command=$"$args -l h_vmem=$annotate_mem -N annotatevcf annotate.sh $x"
	fi	
	JOB1=`eval "$command" |cut -f3 -d ' ' `
	 
	if [ "$log" == "TRUE" ]
	then
        echo "$args -hold_jid $JOB1 -l h_vmem=$annotate_ba_mem -N baProgram $SCRIPT_DIR/ba.program.sh $BA_PROGRAM_ARGS|cut -f3 -d ' ' >>jobs"
	fi
	if [ "$job_name" ]
	then
		if [ "$job_suffix" ]
		then
			command=$"$args -hold_jid $JOB1 -l h_vmem=$annotate_ba_mem -N $job_name.baProgram.$job_suffix $SCRIPT_DIR/ba.program.sh -v ${x}.anno -d ${drills} -M ${memory_info} -D ${SCRIPT_DIR} -T ${tool_info} -t ${table} -l ${log} ${PROGRAMS} -j ${INFO_PARSE} ${runsnpEff} ${runsavant} ${runCAVA} ${PEDIGREE} ${GENE_LIST}"
			hold="-hold_jid $job_name.baProgram.$job_suffix"
		else
			command=$"$args -hold_jid $JOB1 -l h_vmem=$annotate_ba_mem -N $job_name.baProgram $SCRIPT_DIR/ba.program.sh -v ${x}.anno -d ${drills} -M ${memory_info} -D ${SCRIPT_DIR} -T ${tool_info} -t ${table} -l ${log} ${PROGRAMS} -j ${INFO_PARSE} ${runsnpEff} ${runsavant} ${runCAVA} ${PEDIGREE} ${GENE_LIST}"
			hold="-hold_jid $job_name.baProgram"
		fi
	else
		command=$"$args -hold_jid $JOB1 -l h_vmem=$annotate_ba_mem -N baProgram $SCRIPT_DIR/ba.program.sh -v ${x}.anno -d ${drills} -M ${memory_info} -D ${SCRIPT_DIR} -T ${tool_info} -t ${table} -l ${log} ${PROGRAMS} -j ${INFO_PARSE} ${runsnpEff} ${runsavant} ${runCAVA} ${PEDIGREE} ${GENE_LIST}"
		hold="-hold_jid baProgram"
	fi	
	eval "$command"
done
#the only reason I'm putting this into a variable is so it doesn't output the qsub notification to the screen
#hold="-hold_jid baProgram"
if [ "$log" == "TRUE" ]
then
	echo "$args-hold_jid baProgram -l h_vmem=$annotate_ba_merge -N baMerge $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o $outdir/${outname} -T $tool_info -r $drills -s $runsnpEff -v $runsavant -D $SCRIPT_DIR"
		LOG="-l"
fi

if [ "$job_name" ]
then
	if [ "$job_suffix" ]
	then
		command=$"$args $hold -l h_vmem=$annotate_ba_merge -N $job_name.baMerge.$job_suffix $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o ${outdir}/${outname} -T ${tool_info} -r ${drills} -D ${SCRIPT_DIR} -l ${log}"
	else
		command=$"$args $hold -l h_vmem=$annotate_ba_merge -N $job_name.baMerge $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o ${outdir}/${outname} -T ${tool_info} -r ${drills} -D ${SCRIPT_DIR} -l ${log}"
	fi
else
	command=$"$args $hold -l h_vmem=$annotate_ba_merge -N baMerge $SCRIPT_DIR/ba.merge.sh -t ${table} -d ${CURRENT_LOCATION} -o ${outdir}/${outname} -T ${tool_info} -r ${drills} -D ${SCRIPT_DIR} -l ${log}"
fi	
eval "$command" 
echo "You will be notified by e-mail when your jobs complete"

#Return to where you started
if [ ! -z "$TEMPDIR" ]
then
	cd $START_DIR
fi


