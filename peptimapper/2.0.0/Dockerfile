FROM centos:centos7

#####BIOCONTAINERS LABELS#####
LABEL version="1" \ 
	software="peptimapper" \ 
	software.version="2.0.0" \ 
    about.summary="Also called EctoLine, Peptimapper is composed of a subset of PepLine (2.0.1), ad redistribution of PepNovo+ (3.1 beta) and glue scripts to run a Pepline/EctoLine analysis." \ 
    about.home="https://github.com/laeticlo/Ectoline" \ 
    about.license="SPDX:GPL-3.0-only" \ 
    about.license_file="https://github.com/laeticlo/Ectoline/blob/master/LICENSE-GPL-3.0.txt" \ 
	base_image="centos:centos7"

# name of the maintainer of this image
MAINTAINER laetitia.guillot@univ-rennes1.fr
USER root
# install the latest upgrades
RUN yum -y update && yum clean all
RUN yum -y install csh
RUN yum -y install unzip
RUN yum -y install zip
# install dos2unix et git
RUN yum -y install git git-core git-daemon-run
RUN yum -y install dos2unix

RUN git clone https://github.com/laeticlo/Ectoline.git EctoLine
RUN dos2unix /EctoLine/thirdparty/pepnovo/pepnovo.3.1b/Models/*.*
RUN dos2unix /EctoLine/thirdparty/pepnovo/pepnovo.3.1b/Models/*/*.*

ENV PATH /EctoLine/ports/x386-linux/bin:$PATH
ENV PATH /EctoLine/scripts:$PATH


