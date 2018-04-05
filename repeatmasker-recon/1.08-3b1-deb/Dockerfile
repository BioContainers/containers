FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="repeatmasker-recon" \ 
    container="repeatmasker-recon" \ 
    about.summary="finds repeat families from biological sequences" \ 
    about.home="http://www.repeatmasker.org/" \ 
    software.version="1.08-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/repeatmasker-recon/copyright" \ 
    extra.binaries="/usr/bin/MSPCollect,/usr/bin/edgeredef,/usr/bin/eledef,/usr/bin/eleredef,/usr/bin/famdef,/usr/bin/imagespread,/usr/bin/repeatmasker-recon" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y repeatmasker-recon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
