FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fml-asm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fml-asm" \ 
    about.summary="tool for assembling Illumina short reads in small regions" \ 
    about.home="https://github.com/lh3/fermi-lite" \ 
    software.version="0.1-5-deb" \ 
    upstream.version="0.1" \ 
    version="1" \ 
    about.copyright=" 2016 Broad Institute <hengli@broadinstitute.org>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/fml-asm/copyright" \ 
    extra.binaries="/usr/bin/fml-asm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fml-asm || apt-get install -y fml-asm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
