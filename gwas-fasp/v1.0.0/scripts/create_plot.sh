#!/bin/bash

# args: logistic

output_basename=$(basename $1 .assoc.logistic)
manhattan_plot.py \
	-i $1 \
	-o ${output_basename}.png
