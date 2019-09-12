FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ecopcr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ecopcr" \ 
    about.summary="estimate PCR barcode primers quality" \ 
    about.home="https://git.metabarcoding.org/obitools/ecopcr/wikis/home" \ 
    software.version="1.0.1dfsg-1-deb" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    about.copyright=" 1992-2014 Atelier de BioInformatique" \ 
    about.license="CeCILL_V2" \ 
    about.license_file="/usr/share/doc/ecopcr/copyright" \ 
    extra.binaries="/usr/bin/ecoPCR,/usr/bin/ecoPCRFilter,/usr/bin/ecoPCRFormat,/usr/bin/ecoSort,/usr/bin/ecofind,/usr/bin/ecogrep,/usr/bin/ecoisundertaxon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ecopcr || apt-get install -y ecopcr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
