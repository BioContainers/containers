FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastlink" \ 
    container="fastlink" \ 
    about.summary="faster version of pedigree programs of Linkage" \ 
    about.home="http://www.ncbi.nlm.nih.gov/CBBResearch/Schaffer/fastlink.html" \ 
    software.version="4.1P-fix100dfsg-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/fastlink/copyright" \ 
    extra.binaries="/usr/bin/ilink,/usr/bin/linkmap,/usr/bin/lodscore,/usr/bin/mlink,/usr/bin/unknown" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::TODO, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastlink && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
