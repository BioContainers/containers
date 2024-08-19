################################################
# Dockerfile to build OrthoFinder software
# OS: debian buster
# Based on MrTomRod/Orthofinder-Dockerfile (Roder Thomas <roder.thomas@gmail.com>), which was itself...
# Based on cmonjeau/orthofinder (Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>)
# version 2.5.5
# Based on David Emms <david_emms@hotmail.com>
################################################

FROM python:3.10-slim-bullseye
RUN apt-get update && apt-get install -y --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*


# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## Update & upgrade ######################
ENV PACKAGES wget mafft mcl libatlas-base-dev ncbi-blast+

RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

RUN pip install numpy scipy

################# Fastree install ########################
ENV FASTTREE_URL http://www.microbesonline.org/fasttree/FastTree

RUN wget -P /usr/local/bin ${FASTTREE_URL} && \
  chmod a+x /usr/local/bin/FastTree

################ FastME install ##########################
ENV FASTME_VER 2.1.6.2

WORKDIR /opt
RUN wget https://gite.lirmm.fr/atgc/FastME/-/archive/v${FASTME_VER}/FastME-v${FASTME_VER}.tar.gz --no-check-certificate -O - | tar zxvf - \
  && tar xzf  FastME-v${FASTME_VER}/tarball/fastme-*.tar.gz  \  
  && mv fastme-*/binaries/fastme-*-linux64 /usr/local/bin/fastme

WORKDIR /opt

########################### orthoFinder install & run tests #############################
ENV ORTHOFINDER_FILE_NAME OrthoFinder_source.tar.gz
ENV ORTHOFINDER_URL https://github.com/davidemms/OrthoFinder/releases/download/2.5.5/${ORTHOFINDER_FILE_NAME}
ENV ORTHOFINDER_PATH /opt/OrthoFinder_source

WORKDIR /opt
RUN wget ${ORTHOFINDER_URL} --no-check-certificate && tar -xvzf ${ORTHOFINDER_FILE_NAME}
RUN ln -s ${ORTHOFINDER_PATH}/orthofinder.py /usr/local/bin/orthofinder
RUN ln -s ${ORTHOFINDER_PATH}/config.json /usr/local/bin/
RUN ls ${ORTHOFINDER_PATH}

WORKDIR /root
RUN pwd && ls -1
RUN orthofinder -f ${ORTHOFINDER_PATH}/ExampleData/

########################## clean source file #################################

RUN rm /opt/${ORTHOFINDER_FILE_NAME}

###############################################################
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>