FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="soapsnp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="soapsnp" \ 
    about.summary="resequencing utility that can assemble consensus sequence of genomes" \ 
    about.home="http://soap.genomics.org.cn/soapsnp.html" \ 
    software.version="1.03-3-deb" \ 
    upstream.version="1.03" \ 
    version="1" \ 
    extra.identifiers.biotools="soapsnp" \ 
    about.copyright="2008  BGI shenzhen <soap@genomics.org.cn>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/soapsnp/copyright" \ 
    extra.binaries="/usr/bin/soapsnp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y soapsnp || apt-get install -y soapsnp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
