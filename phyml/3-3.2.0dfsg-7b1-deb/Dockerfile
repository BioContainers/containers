FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phyml" \ 
    container="phyml" \ 
    about.summary="Phylogenetic estimation using Maximum Likelihood" \ 
    about.home="http://www.atgc-montpellier.fr/phyml" \ 
    software.version="3-3.2.0dfsg-7b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/phyml/copyright" \ 
    extra.binaries="/usr/bin/phyml,/usr/bin/phyml-beagle,/usr/bin/phytime" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:analysing,:comparing, works-with::biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y phyml && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
