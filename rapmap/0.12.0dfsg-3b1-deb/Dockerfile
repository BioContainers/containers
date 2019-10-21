FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rapmap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rapmap" \ 
    about.summary="rapid sensitive and accurate DNA read mapping via quasi-mapping" \ 
    about.home="https://github.com/COMBINE-lab/RapMap" \ 
    software.version="0.12.0dfsg-3b1-deb" \ 
    upstream.version="0.12.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/rapmap/copyright" \ 
    about.license_file="/usr/share/doc/rapmap/copyright" \ 
    extra.binaries="/usr/bin/RunRapMap.sh,/usr/bin/rapmap,/usr/bin/rapmap_pseudoindex,/usr/bin/rapmap_pseudomap,/usr/bin/rapmap_quasiindex,/usr/bin/rapmap_quasimap" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rapmap || apt-get install -y rapmap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
