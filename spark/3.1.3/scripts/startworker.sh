#!/bin/bash -ue
# Start a Spark worker process and wait for terminate signal
DIR=$(cd "$(dirname "$0")"; pwd)

cluster_work_dir=$1; shift
spark_uri=$1; shift
worker_id=$1; shift
worker_cores=$1; shift
worker_mem_in_gb=$1; shift
spark_worker_log_file=$1; shift
spark_config_filepath=$1; shift
terminate_file_name=$1; shift
args=$1; shift
sleep_secs=$1; shift
container_engine=$1; shift

echo "Starting spark worker ${worker_id} - logging to ${spark_worker_log_file}"
rm -f ${spark_worker_log_file} || true

# Initialize the environment for Spark 
echo "Initializing Spark environment..."
export SPARK_WORKER_OPTS="-Dspark.worker.cleanup.enabled=true -Dspark.worker.cleanup.interval=30 -Dspark.worker.cleanup.appDataTtl=1 -Dspark.port.maxRetries=64"
export SPARK_ENV_LOADED=
export SPARK_HOME=/opt/spark
export PYSPARK_PYTHONPATH_SET=
export PYTHONPATH="/opt/spark/python"
export SPARK_LOG_DIR="${cluster_work_dir}"
set +u
. "/opt/spark/sbin/spark-config.sh"
. "/opt/spark/bin/load-spark-env.sh"
set -u

echo "Determining worker IP address..."
. $DIR/determine_ip.sh $container_engine

# Start the Spark worker
set -x
/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    ${spark_uri} \
    -c ${worker_cores} \
    -m ${worker_mem_in_gb}G \
    -d ${cluster_work_dir} \
    -h ${local_ip} \
    --properties-file ${spark_config_filepath} \
    ${args} &> ${spark_worker_log_file} &
spid=$!
set +x

# Ensure that Spark process dies if this script is interrupted
function cleanup() {
    echo "Killing background processes"
    [[ $spid ]] && kill "$spid"
    exit 0
}
trap cleanup INT TERM EXIT

while true; do
    if ! kill -0 $spid >/dev/null 2>&1; then
        echo "Process $spid died"
        cat ${spark_worker_log_file} >&2
        exit 1
    fi
    if [[ -e "${terminate_file_name}" ]] ; then
        cat ${spark_worker_log_file}
        break
    fi
    sleep ${sleep_secs}
done
