FROM python:3.6
MAINTAINER coolmaksat <coolmaksat@gmail.com>
################## METADATA ######################
LABEL base_image="python:3.6"
LABEL version="1"
LABEL software="deepgoplus"
LABEL software.version="1.0.0"
LABEL about.summary="DeepGOPlus is a novel method for predicting protein functions from protein sequences using deep neural networks combined with sequence similarity based predictions."
LABEL about.home="http://deepgoplus.bio2vec.net/"
LABEL about.license="SPDX:BSD-3-Clause"
LABEL about.license_file="https://github.com/bio-ontology-research-group/deepgoplus/blob/master/LICENSE"
LABEL about.tags="Protein function prediction"

RUN wget http://github.com/bbuchfink/diamond/releases/download/v2.0.2/diamond-linux64.tar.gz && tar xzf diamond-linux64.tar.gz
RUN mv diamond /usr/bin/

RUN pip install pip --upgrade
RUN pip install deepgoplus==1.0.0
