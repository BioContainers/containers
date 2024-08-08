#!/bin/bash

(
eval "$(/opt/conda/bin/conda shell.bash hook)"
conda activate mitofinder_env &&
/opt/MitoFinder/mitofinder "$@"
conda deactivate
)
