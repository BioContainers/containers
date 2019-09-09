FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clonalorigin" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clonalorigin" \ 
    about.summary="inference of homologous recombination in bacteria using whole genome sequences" \ 
    about.home="https://github.com/xavierdidelot/clonalorigin" \ 
    software.version="1.0-3-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    extra.identifiers.biotools="clonalorigin" \ 
    about.copyright=" 2008-2010 Xavier Didelot, Aaron Darling, et. al." \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/clonalorigin/copyright" \ 
    extra.binaries="/usr/bin/blocksplit,/usr/bin/clonalorigin,/usr/bin/computeMedians,/usr/bin/makeMauveWargFile,/usr/bin/warg" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clonalorigin || apt-get install -y clonalorigin) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
