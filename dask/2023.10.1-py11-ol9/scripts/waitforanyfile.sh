#!/bin/bash
# Wait for the specified file to be created
# 
declare apid=$1
declare fs_string=$2
declare -i wait_timeout=${3:--1} # default to no timeout
declare -i polling_interval=${4:-5} # default to 5s

IFS=',' read -ra fs_list <<< "${fs_string}"

if (( ${wait_timeout} > 0  )); then
    echo "Check for process=${apid} and files: ${fs_list[@]} with a timeout of ${wait_timeout} seconds (polling interval = ${polling_interval}s)"
else
    echo "Check for process=${apid} and files: ${fs_list[@]} with NO timeout (polling interval = ${polling_interval}s)"
fi

declare -i seconds=0
while true ; do

    if [[ "${apid}" != "0" ]] ; then
        # if apid is set check that the process is alive
        if ! kill -0 $apid >/dev/null 2>&1 ; then
            echo "Process $apid died"
            exit 1
        fi
    fi

    # check timeout
    if (( ${wait_timeout} > 0 && ${seconds} > ${wait_timeout} )); then
        echo "Timed out after ${seconds} seconds while waiting for ${fs_list[@]}"
        exit 2
    fi

    for f in "${fs_list[@]}" ; do
        if [[ -e "${f}" ]] ; then
            echo "Found ${f}"
            exit 0
        fi
    done

    sleep $polling_interval
    seconds=$(( ${seconds} + ${polling_interval} ))
done
