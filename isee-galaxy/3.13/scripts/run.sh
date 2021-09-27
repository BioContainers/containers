#!/usr/bin/env bash

# Run isee by passing templated R script to Rscript
# WDIR: /import

# Automatically kill container when traffic stops
/scripts/monitor_traffic.sh &

Rscript --vanilla $1
