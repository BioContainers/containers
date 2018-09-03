FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="velvet-long" \ 
    container="velvet-long" \ 
    about.summary="Nucleic acid sequence assembler for very short reads, long version" \ 
    about.home="http://www.ebi.ac.uk/~zerbino/velvet/" \ 
    software.version="1.2.10dfsg1-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/velvet-long/copyright" \ 
    extra.binaries="/usr/bin/velvetg_63,/usr/bin/velvetg_63_long,/usr/bin/velvetg_long,/usr/bin/velveth_63,/usr/bin/velveth_63_long,/usr/bin/velveth_long" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y velvet-long && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
