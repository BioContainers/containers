FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ecopcr" \ 
    container="ecopcr" \ 
    about.summary="estimate PCR barcode primers quality" \ 
    about.home="http://www.grenoble.prabi.fr/trac/ecoPCR/" \ 
    software.version="0.5.0dfsg-1-deb" \ 
    version="1" \ 
    about.copyright=" 1992-2014 Atelier de BioInformatique" \ 
    about.license="CeCILL_V2" \ 
    about.license_file="/usr/share/doc/ecopcr/copyright" \ 
    extra.binaries="/usr/bin/ecoPCR,/usr/bin/ecoPCRFilter,/usr/bin/ecoPCRFormat,/usr/bin/ecoSort,/usr/bin/ecofind,/usr/bin/ecogrep,/usr/bin/ecoisundertaxon" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ecopcr && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
