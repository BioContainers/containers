################## BASE IMAGE ######################
FROM debian:11-slim

################## METADATA ######################

LABEL base_image="debian:11-slim"
LABEL version="1"
LABEL software="openbugs"
LABEL software.version="3.2.3"
LABEL about.summary="Bayesian analysis of complex statistical models using Markov chain Monte Carlo (MCMC) methods"
LABEL about.home="https://www.mrc-bsu.cam.ac.uk/software/bugs/openbugs/"
LABEL about.documentation="https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2021/06/OpenBUGS_Manual.pdf"
LABEL about.license_file="/opt/Openbugs/COPYING"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
LABEL MAINTAINER="Olivier Sallou <olivier.sallou@irisa.fr>"


RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make  gcc-multilib wget automake && \
    mkdir -p /opt/Openbugs && \
    cd /tmp && \
    wget https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2018/04/OpenBUGS-3.2.3.tar.gz && \
    tar xvzf OpenBUGS-3.2.3.tar.gz && mv OpenBUGS-3.2.3/* /opt/Openbugs/ && rm -f OpenBUGS-3.2.3.tar.gz && \
    cd /opt/Openbugs &&  ./configure &&  make && make install && \
    apt-get remove -y wget gcc-multilib make automake && apt-get clean && apt-get purge
