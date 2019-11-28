FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="daligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="daligner" \ 
    about.summary="local alignment discovery between long nucleotide sequencing reads" \ 
    about.home="https://dazzlerblog.wordpress.com" \ 
    software.version="1.0git20180524.fd21879-1-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="2013-2018 Eugene W. Myers, Jr. <gene.myers@gmail.com>" \ 
    about.license="BSD-3-Clause~EWM" \ 
    about.license_file="/usr/share/doc/daligner/copyright" \ 
    extra.binaries="/usr/bin/HPC.daligner,/usr/bin/LAcat,/usr/bin/LAcheck,/usr/bin/LAdump,/usr/bin/LAindex,/usr/bin/LAmerge,/usr/bin/LAshow,/usr/bin/LAsort,/usr/bin/LAsplit,/usr/bin/daligner" \ 
    about.tags="implemented-in::c, interface::commandline, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y daligner || apt-get install -y daligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
