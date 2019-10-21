FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="repeatmasker-recon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="repeatmasker-recon" \ 
    about.summary="finds repeat families from biological sequences" \ 
    about.home="http://www.repeatmasker.org/" \ 
    software.version="1.08-4-deb" \ 
    upstream.version="1.08" \ 
    version="1" \ 
    about.copyright="2001 Washington University School of Medicine" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/repeatmasker-recon/copyright" \ 
    extra.binaries="/usr/bin/MSPCollect,/usr/bin/edgeredef,/usr/bin/eledef,/usr/bin/eleredef,/usr/bin/famdef,/usr/bin/imagespread,/usr/bin/repeatmasker-recon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y repeatmasker-recon || apt-get install -y repeatmasker-recon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
