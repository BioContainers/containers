FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="soapaligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="soapaligner" \ 
    about.summary="aligner of short reads of next generation sequencers" \ 
    about.home="http://soap.genomics.org.cn/soapaligner.html" \ 
    software.version="2.20-3-deb" \ 
    upstream.version="2.20" \ 
    version="1" \ 
    about.copyright="2004 Wong Chi Kwong" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/soapaligner/copyright" \ 
    extra.binaries="/usr/bin/soap" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y soapaligner || apt-get install -y soapaligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
