#!/bin/bash -ue
# Send signal to terminate the running cluster
terminate_file_name=$1

echo "DONE" > ${terminate_file_name}
