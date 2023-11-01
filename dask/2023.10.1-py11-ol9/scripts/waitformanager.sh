#!/bin/bash
# Wait for the specified file to be created
# 
DIR=$(cd "$(dirname "$0")"; pwd)

flist=
scheduler_start_timeout=60
scheduler_poll_interval=2
args=()

while [[ $# > 0 ]]; do
    key="$1"
    shift # past the key
    case $key in
        --flist)
            flist=$1
            shift
            ;;
        --scheduler-start-timeout)
            scheduler_start_timeout=$1
            shift
            ;;
        --scheduler-poll-interval)
            scheduler_poll_interval=$1
            shift
            ;;
        *)
            # unknown params
            ;;
    esac
done

$DIR/waitforanyfile.sh "0" "$flist" ${scheduler_start_timeout} ${scheduler_poll_interval}
