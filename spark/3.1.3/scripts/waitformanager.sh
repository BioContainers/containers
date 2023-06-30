#!/bin/bash -ue
# Watch the given Spark manager log and wait for it to be accessible, then
# export the URI into the environment as $spark_uri
spark_master_log_name=$1; shift
terminate_file_name=$1; shift
sleep_secs=$1; shift
max_wait_secs=$1; shift

elapsed_secs=0
while true; do

    if [[ -e ${spark_master_log_name} ]]; then
        test_uri=`grep -o "\(spark://.*$\)" ${spark_master_log_name} || true`
        if [[ ! -z ${test_uri} ]]; then
            echo "Spark master started at ${test_uri}"
            break
        fi
    fi

    if [[ -e "${terminate_file_name}" ]]; then
        echo "Terminate file ${terminate_file_name} found"
        exit 1
    fi

    if (( ${elapsed_secs} > ${max_wait_secs} )); then
        echo "Timed out after ${elapsed_secs} seconds while waiting for Spark master <- ${spark_master_log_name}"
        cat ${spark_master_log_name} >&2
        exit 2
    fi

    sleep ${sleep_secs}
    elapsed_secs=$(( ${elapsed_secs} + ${sleep_secs} ))
done

echo ${test_uri} > spark_uri
