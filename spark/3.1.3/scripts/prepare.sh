#!/bin/bash -ue
# Prepare the given Spark work dir by creating it, or cleaning it 
# of Spark content if it already exists.
work_dir=$1

if [[ ! -d "${work_dir}" ]] ; then
    echo "Creating work directory: ${work_dir}"
    mkdir -p "${work_dir}"
else
    echo "Cleaning existing work directory: ${work_dir}"
    rm -f ${work_dir}/spark* || true
fi
