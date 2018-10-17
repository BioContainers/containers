FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbsim" \ 
    container="pbsim" \ 
    about.summary="simulator for PacBio sequencing reads" \ 
    about.home="https://code.google.com/archive/p/pbsim/" \ 
    software.version="1.0.3-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="pbsim" \ 
    about.copyright=" 2012 Michiaki Hamada (mhamada@k.u-tokyo.ac.jp)" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/pbsim/copyright" \ 
    extra.binaries="/usr/bin/pbsim" \ 
    extra.identifiers.conda="pbsim" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, role::program, use::simulating,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbsim && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
