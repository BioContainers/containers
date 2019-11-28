FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="subread" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="subread" \ 
    about.summary="toolkit for processing next-gen sequencing data" \ 
    about.home="http://sourceforge.net/projects/subread/" \ 
    software.version="1.6.3dfsg-1-deb" \ 
    upstream.version="1.6.3" \ 
    version="1" \ 
    extra.identifiers.biotools="subread" \ 
    about.copyright="2011-2018, Dr Yang Liao, Dr Wei Shi" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/subread/copyright" \ 
    extra.binaries="/usr/bin/exactSNP,/usr/bin/featureCounts,/usr/bin/subindel,/usr/bin/subjunc,/usr/bin/sublong,/usr/bin/subread-align,/usr/bin/subread-buildindex" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y subread || apt-get install -y subread) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
