#!/bin/bash -ue
# Watch the given Spark worker log and wait for it to register with the Manager
spark_uri=$1; shift
spark_worker_log_file=$1; shift
terminate_file_name=$1; shift
sleep_secs=$1; shift
max_wait_secs=$1; shift

elapsed_secs=0
while true; do

    if [[ -e ${spark_worker_log_file} ]]; then
        found=`grep -o "\(Worker: Successfully registered with master ${spark_uri}\)" ${spark_worker_log_file} || true`
        if [[ ! -z ${found} ]]; then
            echo "${found}"
            break
        fi
    fi

    if [[ -e "${terminate_file_name}" ]]; then
        echo "Terminate file ${terminate_file_name} found"
        exit 1
    fi

    if (( ${elapsed_secs} > ${max_wait_secs} )); then
        echo "Timed out after ${elapsed_secs} seconds while waiting for Spark manager <- ${spark_uri}"
        cat ${spark_worker_log_file} >&2
        exit 2
    fi

    sleep ${sleep_secs}
    elapsed_secs=$(( ${elapsed_secs} + ${sleep_secs} ))
done
