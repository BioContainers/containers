################## BASE IMAGE ######################

# Use CUDA-compatible base image
FROM nvcr.io/nvidia/ai-workbench/python-cuda122:1.0.3

ARG COLABDESIGN_VERSION=d024c4e846fea83c090afcbe89a313eeee8ec01e

################## METADATA ######################

LABEL base_image="nvcr.io/nvidia/ai-workbench/python-cuda122:1.0.3"
LABEL version="1"
LABEL about.summary="ColabDesign - Making Protein Design accessible to all"
LABEL software="ColabDesign"
LABEL software.version="1.0.3"
LABEL about.home="https://github.com/sokrypton/ColabDesign"
LABEL about.license="Other"
LABEL about.license_file="/opt/colabdesign/LICENSE.txt" \

################## MAINTAINER ######################
MAINTAINER David Prihoda <david.prihoda@gmail.com>

RUN ln -s /usr/bin/python3 /usr/bin/python

# Install with pip
RUN git clone https://github.com/sokrypton/ColabDesign.git /opt/colabdesign \
	&& cd /opt/colabdesign \
	&& git checkout $COLABDESIGN_VERSION \
	&& pip install --no-cache-dir . \
	&& pip install --no-cache-dir jax[cuda12]==0.6.2 \
	&& pip freeze | grep nvidia-cudnn

WORKDIR /
