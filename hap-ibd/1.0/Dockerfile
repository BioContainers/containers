################## BASE IMAGE ######################
FROM ubuntu:latest@sha256:2d7ecc9c5e08953d586a6e50c29b91479a48f69ac1ba1f9dc0420d18a728dfc5

################## METADATA ######################
LABEL base_image="ubuntu:latest"
LABEL version="1"
LABEL software="hap-ibd"
LABEL software.version="1.0.rev20May22.818"
LABEL about.summary="Detects identity-by-descent (IBD) segments and homozygosity-by-descent (HBD) segments in phased genotype data"
LABEL about.home="https://github.com/browning-lab/hap-ibd"
LABEL about.documentation="https://github.com/browning-lab/hap-ibd/blob/master/README.md"
LABEL about.publication="Y Zhou, S R Browning, B L Browning. A fast and simple method for detecting identity by descent segments in large-scale data. The American Journal of Human Genetics 106(4):426-437. doi: https://doi.org/10.1016/j.ajhg.2020.02.010"
LABEL about.license_file="https://github.com/browning-lab/hap-ibd/blob/master/LICENSE-2.0.txt"
LABEL about.license="Apache-2.0"
LABEL extra.identifiers.biotools="hap-ibd"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Ashot Margaryan <ashotmarg2004@gmail.com>

################## INSTALL wget ####################
USER root
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

################## CREATE USER #####################
RUN groupadd -g 901 biodocker \
  && useradd -m -u 901 -g 901 biodocker

################## INSTALLATION ####################
WORKDIR /data/

RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless && \
    apt-get clean && \
    apt-get purge && \
    JAR_FILE=hap-ibd.jar && \
    mkdir /home/biodocker/bin && \
    wget https://faculty.washington.edu/browning/$JAR_FILE -O /usr/local/bin/$JAR_FILE && \
    ln -sv /usr/local/bin/$JAR_FILE /data/$JAR_FILE && \
    ln -sv /usr/local/bin/$JAR_FILE /home/biodocker/bin/$JAR_FILE && \
    ln -sv /usr/local/bin/$JAR_FILE /bin/$JAR_FILE && \
    echo '#!/bin/bash\njava -jar /usr/local/bin/hap-ibd.jar "$@"' > /usr/local/bin/hap-ibd && \
    chmod +x /usr/local/bin/hap-ibd

################## Make an "alias-like" command/file for running java -jar /home/biodocker/bin/hap-ibd.jar ####################
ENV PATH /usr/local/bin/:$PATH
USER biodocker

## run example: docker run hap-ibd java -jar hap-ibd.jar; or docker run hap-ibd hap-ibd (this second hap-ibd is an 'alias' for 'java -jar hap-ibd.jar')
