#!/bin/bash -ue
# Prepare the given dir by creating it, or cleaning it 
# of Dask content if it already exists.
work_dir=$1

if [[ ! -d "${work_dir}" ]] ; then
    echo "Creating work directory: ${work_dir}"
    mkdir -p "${work_dir}"
else
    echo "Cleaning existing work directory: ${work_dir}"
    rm -rf ${work_dir}/* || true
fi
