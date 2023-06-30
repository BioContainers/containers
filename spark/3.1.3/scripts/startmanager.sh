#!/bin/bash -ue
# Start the Spark manager process and wait for terminate signal
DIR=$(cd "$(dirname "$0")"; pwd)

spark_local_dir=$1; shift
cluster_work_dir=$1; shift
spark_master_log_file=$1; shift
spark_config_filepath=$1; shift
terminate_file_name=$1; shift
args=$1; shift
sleep_secs=$1; shift
container_engine=$1; shift

echo "Starting spark master - logging to ${spark_master_log_file}"
rm -f ${spark_master_log_file} || true

# Create Spark configuration
echo "Creating Spark configuration at ${spark_config_filepath}"
mkdir -p `dirname ${spark_config_filepath}`
cat <<EOF > ${spark_config_filepath}
spark.rpc.askTimeout=300s
spark.storage.blockManagerHeartBeatMs=30000
spark.rpc.retry.wait=30s
spark.kryoserializer.buffer.max=1024m
spark.core.connection.ack.wait.timeout=600s
spark.driver.maxResultSize=0
spark.worker.cleanup.enabled=true
spark.local.dir=${spark_local_dir}
EOF

# Initialize the environment for Spark
echo "Initializing Spark environment..."
export SPARK_ENV_LOADED=
export SPARK_HOME=/opt/spark
export PYSPARK_PYTHONPATH_SET=
export PYTHONPATH="/opt/spark/python"
export SPARK_LOG_DIR="${cluster_work_dir}"
set +u
. "/opt/spark/sbin/spark-config.sh"
. "/opt/spark/bin/load-spark-env.sh"
set -u

echo "Determining manager IP address..."
. $DIR/determine_ip.sh $container_engine

# Start the Spark manager
set -x
/opt/spark/bin/spark-class org.apache.spark.deploy.master.Master \
    -h $local_ip \
    --properties-file ${spark_config_filepath} \
    ${args} &> ${spark_master_log_file} &
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
        cat ${spark_master_log_file} >&2
        exit 1
    fi
    if [[ -e "${terminate_file_name}" ]] ; then
        cat ${spark_master_log_file}
        break
    fi
    sleep ${sleep_secs}
done
