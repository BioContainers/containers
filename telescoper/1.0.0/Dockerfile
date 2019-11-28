################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="telescoper"
LABEL software.version="1.0.0"
LABEL about.summary="De novo Assembly of Highly Repetitive Regions"
LABEL about.home="https://sourceforge.net/projects/telescoper/"
LABEL about.documentation="https://sourceforge.net/projects/telescoper/files/MANUAL.txt"
LABEL about.license_file="https://sourceforge.net/projects/telescoper/files/LICENSE.txt"
LABEL extra.identifiers.biotools="Telescoper"
LABEL about.license="SPDX:Custom"
LABEL about.tags="Genomics"
LABEL extra.binaries="telescoper"

################## MAINTAINER ######################

MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

USER root

# install build dependencies: boost
RUN  apt-get -y update && \
     apt-get install -y --no-install-recommends --no-install-suggests libboost-all-dev libboost-math1.58.0 && \
     apt-get clean && \
     apt-get purge && \
     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

##########INSTALL TELESCOPER ######

USER biodocker

RUN mkdir -p /home/biodocker/bin/ && \
  cd /home/biodocker/bin/ && \
  git clone https://git.code.sf.net/p/telescoper/code telescoper

ADD makefile /home/biodocker/bin/telescoper/

RUN cd /home/biodocker/bin/telescoper/ && make all

ENV PATH /home/biodocker/bin/telescoper:$PATH

WORKDIR /data/

# CMD ["telescoper"]
