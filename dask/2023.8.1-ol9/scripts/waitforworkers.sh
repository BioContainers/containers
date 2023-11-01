#!/bin/bash -ue
# Start the Dask scheduler process and wait for terminate signal
DIR=$(cd "$(dirname "$0")"; pwd)

scheduler_address=
cluster_work_dir=
terminate_file=
declare -i worker_start_timeout=-1
declare -i worker_poll_interval=1
declare -i total_workers=0
declare -i required_workers=0

while [[ $# > 0 ]]; do
    key="$1"
    shift # past the key
    case $key in
        --cluster-work-dir)
            cluster_work_dir=$1
            shift
            ;;
        --worker-start-timeout)
            worker_start_timeout=$(($1))
            shift
            ;;
        --worker-poll-interval)
            scheduler_poll_interval=$(($1))
            shift
            ;;
        --total-workers)
            total_workers=$(($1))
            shift
            ;;
        --required-workers)
            required_workers=$(($1))
            shift
            ;;
        --terminate-file)
            terminate_file=$1
            shift
            ;;
        --scheduler-address)
            scheduler_address=$1
            shift
            ;;
        *)
            ;;
    esac
done

if (( ${required_workers} > 0 )); then
    seconds=0
    while true; do
        if [[ -e ${terminate_file} ]] ; then
            # this can happen if the cluster is created on LSF and the workers cannot get nodes
            # before the cluster is ended
            available_workers=-1
            exit 1
        fi
        available_workers=0
        for (( worker_id=1; worker_id<=${total_workers}; worker_id++ )); do
            worker_name="worker-${worker_id}"
            worker_log="${cluster_work_dir}/${worker_name}/${worker_name}.log"
            # if worker's log exists check if the worker has connected to the scheduler
            echo "Check ${worker_log}"
            if [[ -e "${worker_log}" ]]; then
                found=`grep -o "Registered to:.*${scheduler_address}" ${worker_log} || true`
                if [[ ! -z ${found} ]]; then
                    echo "${found}"
                    available_workers=$(( ${available_workers} + 1 ))
                fi
            fi
        done
        echo "Found ${available_workers} after ${seconds}"
        # in case somebody forgets to adjust the required workers check also if it is equal to total_workers
        if (( ${available_workers} >= ${total_workers} || ${available_workers} >= ${required_workers} )); then
            echo "Found ${available_workers} connected workers"
            break;
        fi
        if (( ${worker_start_timeout} > 0 && ${seconds} > ${worker_start_timeout} )); then
            echo "Timed out after ${seconds} seconds while waiting for at least ${required_workers} workers to connect to scheduler"
            available_workers=-1
            exit 2
        fi
        sleep ${worker_poll_interval}
        seconds=$(( ${seconds} + ${worker_poll_interval} ))
    done
else
    available_workers=-1
fi
