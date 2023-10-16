#!/bin/bash
# Determine the IP address of the current host

container_engine=$1

local_ip=
if [ "$container_engine" = "docker" ]; then
    for interface in /sys/class/net/{eth*,en*,em*}; do
        [ -e $interface ] && \
        [ `cat $interface/operstate` == "up" ] && \
        local_ip=$(ifconfig `basename $interface` | grep "inet " | awk '$1=="inet" {print $2; exit}' | sed s/addr://g)
        if [[ "$local_ip" != "" ]]; then
            echo "Use Spark IP: $local_ip"
            break
        fi
    done
    if [[ -z "${local_ip}" ]] ; then
        echo "Could not determine local IP: local_ip is empty"
        exit 1
    fi
else
    # Take the last IP that's listed by hostname -i.
    # This hack works on Janelia Cluster and AWS EC2.
    local_ip=`hostname -i | rev | cut -d' ' -f1 | rev`
    echo "Use Spark IP: $local_ip"
    if [[ -z "${local_ip}" ]] ; then
        echo "Could not determine local IP: local_ip is empty"
        exit 1
    fi
fi