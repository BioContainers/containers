#!/bin/bash -ue
# Start the Dask scheduler process and wait for terminate signal
DIR=$(cd "$(dirname "$0")"; pwd)

container_engine=
scheduler_pid_file=
terminate_file=
scheduler_start_timeout=
scheduler_poll_interval=
scheduler_work_dir=.
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
            scheduler_pid_file=$1
            args=("${args[@]}" "--pid-file" "${scheduler_pid_file}")
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
        --scheduler-work-dir)
            scheduler_work_dir=$1
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
    echo "Killing scheduler background processes"
    if [[ -f "${scheduler_pid_file}" ]]; then
        local dpid=$(cat "${scheduler_pid_file}")
        kill "$dpid"
    fi
    exit 0
}
trap cleanup INT TERM EXIT

echo "Determining scheduler IP address..."
. $DIR/determine_ip.sh $container_engine

# start scheduler in background
echo "Run: dask scheduler --host ${local_ip} ${args[@]}"
dask scheduler --host ${local_ip} ${args[@]} \
    2> >(tee ${scheduler_work_dir}/dask-scheduler.log >&2) \
    &

# wait for PID file
# make sure there is a timeout param since the default wait does not timeout
${DIR}/waitforanyfile.sh 0 "${terminate_file},${scheduler_pid_file}" ${scheduler_start_timeout}

if [[ -e "${scheduler_pid_file}" ]] ; then
    scheduler_pid=$(cat "${scheduler_pid_file}")
    echo "Scheduler started: pid=$scheduler_pid"

    # scheduler was started - wait until terminate
    echo "Wait for termination event: ${terminate_file}"
    ${DIR}/waitforanyfile.sh ${scheduler_pid} "${terminate_file}"
else
    echo "Scheduler pid file not found"
    scheduler_pid=0
fi
