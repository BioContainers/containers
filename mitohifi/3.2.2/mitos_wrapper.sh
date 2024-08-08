#!/bin/bash

(
eval "$($CONDA_DIR/bin/conda shell.bash hook)"
conda activate mitos_env &&
runmitos.py "$@"
conda deactivate
)
