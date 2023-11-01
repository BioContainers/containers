#!/bin/bash -ue
# Start the Dask worker process and wait for terminate signal
DIR=$(cd "$(dirname "$0")"; pwd)

container_engine=
worker_name=
worker_dir=
worker_pid_file=
terminate_file=
worker_start_timeout=
worker_poll_interval=
scheduler_address=
args=()

while [[ $# > 0 ]]; do
    key="$1"
    shift # past the key
    case $key in
        --container-engine)
            container_engine="$1"
            shift
            ;;
        --pid-file)
            worker_pid_file=$1
            args=("${args[@]}" "--pid-file" "${worker_pid_file}")
            shift
            ;;
        --name)
            worker_name=$1
            args=("${args[@]}" "--name" "${worker_name}")
            shift
            ;;
        --worker-dir)
            worker_dir=$1
            shift
            ;;
        --scheduler-address)
            scheduler_address=$1
            shift
            ;;
        --worker-start-timeout)
            worker_start_timeout=$1
            shift
            ;;
        --worker-poll-interval)
            worker_poll_interval=$1
            shift
            ;;
        --terminate-file)
            terminate_file=$1
            shift
            ;;
        *)
            args=("${args[@]}" "${key}")
            ;;
    esac
done

function cleanup() {
    echo "Killing background processes for ${worker_name}"
    if [[ -f "${worker_pid_file}" ]]; then
        local wpid=$(cat "${worker_pid_file}")
        kill "$wpid"
    fi
    exit 0
}
trap cleanup INT TERM EXIT

echo "Determining worker ${worker_name} IP address..."
. $DIR/determine_ip.sh $container_engine

if [[ -n ${worker_dir} ]] ; then
    mkdir -p ${worker_dir}
fi

# start worker in background
echo "Run: dask worker \
    --host ${local_ip} \
    --local-directory ${worker_dir} \
    ${args[@]} \
    ${scheduler_address}"
dask worker \
    --host ${local_ip} \
    --local-directory ${worker_dir} \
    ${args[@]} \
    ${scheduler_address} \
    2> >(tee ${worker_dir}/${worker_name}.log >&2) \
    &

# wait for PID file
# make sure there is a timeout param since the default wait does not timeout
${DIR}/waitforanyfile.sh 0 "${terminate_file},${worker_pid_file}" ${worker_start_timeout}

if [[ -e "${worker_pid_file}" ]] ; then
    worker_pid=$(cat "${worker_pid_file}")
    echo "Worker ${worker_name} started: pid=$worker_pid"

    # worker was started - wait until terminate
    echo "Worker ${worker_name} - wait for termination event: ${terminate_file}"
    ${DIR}/waitforanyfile.sh ${worker_pid} "${terminate_file}"
else
    echo "Worker ${worker_name} pid file not found"
    worker_pid=0
fi
