FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="delly" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="delly" \ 
    about.summary="Structural variant discovery by read analysis" \ 
    about.home="https://github.com/dellytools/delly" \ 
    software.version="0.8.1-2-deb" \ 
    upstream.version="0.8.1" \ 
    version="1" \ 
    about.copyright="2012-2018 Tobias Rausch <rausch@embl.de>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/delly/copyright" \ 
    extra.binaries="/usr/bin/delly,/usr/bin/dpe" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y delly || apt-get install -y delly) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
