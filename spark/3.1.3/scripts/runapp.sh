#!/bin/bash -ue
# Run the given Spark application, either on the cluster 
# or standalone (if the spark_uri parameter is set to "local[*]")
DIR=$(cd "$(dirname "$0")"; pwd)

container_engine=$1; shift
cluster_work_dir=$1; shift
spark_uri=$1; shift
app_jar_file=$1; shift
main_class=$1; shift
parallelism=$1; shift
worker_cores=$1; shift
executor_memory=$1; shift
driver_cores=$1; shift
driver_memory=$1; shift

echo "Starting Spark driver with main class ${main_class}"

# Initialize the environment for Spark
export SPARK_ENV_LOADED=
export SPARK_HOME=/opt/spark
export PYSPARK_PYTHONPATH_SET=
export PYTHONPATH="/opt/spark/python"
export SPARK_LOG_DIR="${cluster_work_dir}"
set +u
. "/opt/spark/sbin/spark-config.sh"
. "/opt/spark/bin/load-spark-env.sh"
set -u

if [ "${spark_uri}" = "local[*]" ]; then
    spark_cluster_params=
else
    . $DIR/determine_ip.sh $container_engine
    spark_config_filepath="${cluster_work_dir}/spark-defaults.conf"
    spark_cluster_params=" \
    --properties-file ${spark_config_filepath} \
    --conf spark.driver.host=${local_ip} \
    --conf spark.driver.bindAddress=${local_ip} \
    "
fi

set -x
# Run the Spark driver to submit the application.
# The default (4MB) open cost consolidates files into tiny partitions regardless of 
# the number of cores. By forcing this parameter to zero, we can specify the exact 
# parallelism that we want.
/opt/spark/bin/spark-class org.apache.spark.deploy.SparkSubmit \
    $spark_cluster_params \
    --master ${spark_uri} \
    --class ${main_class} \
    --conf spark.files.openCostInBytes=0 \
    --conf spark.default.parallelism=${parallelism} \
    --executor-cores ${worker_cores} \
    --executor-memory ${executor_memory} \
    --driver-cores ${driver_cores} \
    --driver-memory ${driver_memory} \
    ${app_jar_file} $@
set +x
