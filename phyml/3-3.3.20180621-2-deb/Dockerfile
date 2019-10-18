FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phyml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phyml" \ 
    about.summary="Phylogenetic estimation using Maximum Likelihood" \ 
    about.home="http://www.atgc-montpellier.fr/phyml" \ 
    software.version="3-3.3.20180621-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="phyml" \ 
    about.copyright="Stephane Guindon <guindon@stat.auckland.ac.nz>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/phyml/copyright" \ 
    extra.binaries="/usr/bin/phyml,/usr/bin/phyml-mpi" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:analysing,:comparing, works-with::biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phyml || apt-get install -y phyml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
