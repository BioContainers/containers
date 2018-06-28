FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="daligner" \ 
    container="daligner" \ 
    about.summary="local alignment discovery between long nucleotide sequencing reads" \ 
    about.home="https://dazzlerblog.wordpress.com" \ 
    software.version="1.020161119-1-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 Eugene W. Myers, Jr. <gene.myers@gmail.com>" \ 
    about.license="BSD-3-Clause~EWM" \ 
    about.license_file="/usr/share/doc/daligner/copyright" \ 
    extra.binaries="/usr/bin/HPC.daligner,/usr/bin/LAcat,/usr/bin/LAcheck,/usr/bin/LAdump,/usr/bin/LAindex,/usr/bin/LAmerge,/usr/bin/LAshow,/usr/bin/LAsort,/usr/bin/LAsplit,/usr/bin/daligner" \ 
    about.tags="implemented-in::c, interface::commandline, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y daligner && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
