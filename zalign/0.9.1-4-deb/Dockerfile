FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="zalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="zalign" \ 
    about.summary="parallel local alignment of biological sequences" \ 
    about.home="https://launchpad.net/zalign" \ 
    software.version="0.9.1-4-deb" \ 
    upstream.version="0.9.1" \ 
    version="1" \ 
    about.copyright="2006-2009 Rodolfo Bezerra Batista <rodolfo.batista@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/zalign/copyright" \ 
    extra.binaries="/usr/bin/mpialign,/usr/bin/zalign" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y zalign || apt-get install -y zalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
