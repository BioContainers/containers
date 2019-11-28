FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tnseq-transit" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="tnseq-transit" \ 
    about.summary="statistical calculations of essentiality of genes or genomic regions" \ 
    about.home="http://pythonhosted.org/tnseq-transit/transit_overview.html" \ 
    software.version="2.2.1-2bpo91-deb" \ 
    upstream.version="2.2.1" \ 
    version="2" \ 
    about.license="custom, see /usr/share/doc/tnseq-transit/copyright" \ 
    about.license_file="/usr/share/doc/tnseq-transit/copyright" \ 
    extra.binaries="/usr/bin/transit,/usr/bin/transit-tpp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y tnseq-transit && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
