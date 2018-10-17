FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rapmap" \ 
    container="rapmap" \ 
    about.summary="rapid sensitive and accurate DNA read mapping via quasi-mapping" \ 
    about.home="https://github.com/COMBINE-lab/RapMap" \ 
    software.version="0.4.0dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2014-2016 COMputational BIology and Network Evolution lab" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/rapmap/copyright" \ 
    extra.binaries="/usr/bin/RunRapMap.sh,/usr/bin/rapmap,/usr/bin/rapmap_pseudoindex,/usr/bin/rapmap_pseudomap,/usr/bin/rapmap_quasiindex,/usr/bin/rapmap_quasimap" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rapmap && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
