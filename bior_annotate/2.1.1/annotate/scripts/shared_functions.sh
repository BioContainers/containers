#! /usr/bin/env bash

# to check and validate the input bam file
function validate_bam()	{
	samtools=$1
	bamfile_1=$2
	dir=$3
	rand=$RANDOM
	rand1=$RANDOM
	if [ ! -s $2 ]
	then
		echo -e "$bamfile : doesn't exist"
		exit 1;
	fi	
	bam_name=`basename $bamfile_1`
	if [ "$SGE_TASK_ID" ]
	then
		tag="$rand.$rand1.$SGE_TASK_ID"
	else
		tag="$rand.$rand1"
	fi	
	$samtools/samtools view -H $bamfile_1 1>$dir/$bam_name.$tag.header 2> $dir/$bam_name.$tag.log
	if [[ `cat $dir/$bam_name.$tag.log | wc -l` -gt 0 || `cat $dir/$bam_name.$tag.header | wc -l` -le 0 ]]
	then
		echo -e "\n************************************"
		echo -e "ERROR : $bamfile_1 file is truncated or corrupted [`date`]"
		echo -e "\n************************************"
		exit 1;
	else
		rm $dir/$bam_name.$tag.log
	fi	
	rm $dir/$bam_name.$tag.header														
}	

### function
function check_variable()	{
	message=$1
	if [[ "$2" == "" ]] 
	then 
		echo -e "\n************************************"
		echo "$message is not set correctly."
		echo -e "\n************************************"
		exit 1;
	fi		
}	

function check_file()	{
	if [[ ! -s $1 ]] 
	then 
		echo -e "\n************************************"
		echo "$1 doesn't exist or it is empty"
		echo -e "\n************************************"
		exit 1;
	fi		
}


function log_it ()	{
	command=$1
	file=$2
	eval $command
	echo -e "INFO $(date +%c) JobSubmission -\t$command\n" >> $file
}
	
# check for full path
function check_dir()	{
	message=$1
	if [ $2 == "." ]
	then
		echo -e "\n************************************"
		echo -e "$message : should be specified as complete path"
		echo -e "\n************************************"
		exit 1;
	fi	
}
			
# to check and validate the configuration file presence
function check_config()	{
	message=$1
	if [ ! -s $2 ]
	then
		echo -e "\n************************************"
		echo -e "$message : doesn't exist"
		echo -e "\n************************************"
		exit 1;
	fi	
	
	dir_info=`dirname $2`
	if [ $dir_info == "." ]
	then
		echo -e "\n************************************"
		echo -e "$message : should be specified as complete path ($dir_info)"
		echo -e "\n************************************"
		exit 1;
	fi
		
	du=`dos2unix $2 2>&1` 
	cat $2 | sed 's/^[ \t]*//;s/[ \t]*$//' > $2.tmp
	mv $2.tmp $2														
}	

#prior_jobs_successful
#
#ret_val=$?
#
#if [[ $ret_val != 0 ]]
#then
#  echo "prior_jobs_successful returned $ret_val"
#  exit 100
#else
#  echo "All previous jobs exited successfully."
#fi

function exitcmd() {
  err=$?
  if (($err > 0)); then
    echo "original exit status $err"
    $WORKFLOW_PATH/email.sh -f "Insufficient memory" -m annotate.sh -M "Killed due to running out of memory" -p $drills -l $LINENO
    # Wait should wait for the email script to complete (along with any other child processes).
    sleep 30
    exit 100
  fi
}

function check_dir_exist()	{
	if [ ! -d $1 ]
	then
		echo -e "\n************************************"
		echo -e "$1 : folder doesn't exist"
		echo -e "\n************************************"
		exit 1;
	fi	
}	

function check_file_nonexist()	{
	if [ -f $1 ]
	then
		echo -e "\n************************************"
		echo -e "$1 : file already exist"
		echo -e "\n************************************"
		exit 1;
	fi	
}	

function check_cm_variable()	{
	if [ -z $1 ]
	then
		echo "Must provide at least required options. See output file for usage."
		exit 1;
	fi
}	
