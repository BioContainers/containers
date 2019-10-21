FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="velvet-long" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="velvet-long" \ 
    about.summary="Nucleic acid sequence assembler for very short reads, long version" \ 
    about.home="http://www.ebi.ac.uk/~zerbino/velvet/" \ 
    software.version="1.2.10dfsg1-5-deb" \ 
    upstream.version="1.2.10" \ 
    version="1" \ 
    extra.identifiers.biotools="velvet" \ 
    about.copyright=" 2006-2011 Daniel Zerbino <zerbino@ebi.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/velvet-long/copyright" \ 
    extra.binaries="/usr/bin/velvetg_127,/usr/bin/velvetg_127_long,/usr/bin/velvetg_63,/usr/bin/velvetg_63_long,/usr/bin/velvetg_long,/usr/bin/velveth_127,/usr/bin/velveth_127_long,/usr/bin/velveth_63,/usr/bin/velveth_63_long,/usr/bin/velveth_long" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y velvet-long || apt-get install -y velvet-long) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
