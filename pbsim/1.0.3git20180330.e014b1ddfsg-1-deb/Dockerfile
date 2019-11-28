FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbsim" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbsim" \ 
    about.summary="simulator for PacBio sequencing reads" \ 
    about.home="https://github.com/pfaucon/PBSIM-PacBio-Simulator" \ 
    software.version="1.0.3git20180330.e014b1ddfsg-1-deb" \ 
    upstream.version="1.0.3" \ 
    version="1" \ 
    extra.identifiers.biotools="pbsim" \ 
    about.copyright=" 2012 Michiaki Hamada (mhamada@k.u-tokyo.ac.jp)" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/pbsim/copyright" \ 
    extra.binaries="/usr/bin/pbsim" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, role::program, use::simulating,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pbsim || apt-get install -y pbsim) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
