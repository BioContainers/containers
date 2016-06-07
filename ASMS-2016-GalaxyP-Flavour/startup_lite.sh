#!/bin/bash

cd /galaxy-central/

cp config/galaxy.ini.sample $GALAXY_CONFIG_FILE
export GALAXY_CONFIG_STATIC_ENABLED=True
export GALAXY_CONFIG_ALLOW_LIBRARY_PATH_PASTE=True
unset GALAXY_CONFIG_NGINX_UPLOAD_STORE
unset GALAXY_CONFIG_NGINX_UPLOAD_PATH

# The lite mode can be useful to populate data libraries.
# To make this work it is needed to unset the following variables
unset GALAXY_CONFIG_JOB_WORKING_DIRECTORY
unset GALAXY_CONFIG_FILE_PATH
unset GALAXY_CONFIG_NEW_FILE_PATH
unset GALAXY_CONFIG_TEMPLATE_CACHE_PATH
unset GALAXY_CONFIG_CITATION_CACHE_DATA_DIR
unset GALAXY_CONFIG_CLUSTER_FILES_DIRECTORY
unset GALAXY_CONFIG_FTP_UPLOAD_DIR
unset GALAXY_CONFIG_INTEGRATED_TOOL_PANEL_CONFIG

JOB_CONF=/galaxy-central/config/job_conf.xml.sample_basic

while getopts "j" opt; do
  case $opt in
    j)
      #if they pass -j, don't override the job config file
      JOB_CONF=$GALAXY_CONFIG_JOB_CONFIG_FILE
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

export GALAXY_CONFIG_JOB_CONFIG_FILE=$JOB_CONF

cat >> $GALAXY_CONFIG_FILE << _EOF
[server:main]
use = egg:Paste#http
port = 8080
host = 0.0.0.0
use_threadpool = True
threadpool_workers = 10
_EOF

service postgresql start
./run.sh --daemon --skip-eggs --skip-wheels
