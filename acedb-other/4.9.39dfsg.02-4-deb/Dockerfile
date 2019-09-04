FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="acedb-other" \ 
    about.summary="retrieval of DNA or protein sequences" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-4-deb" \ 
    upstream.version="4.9.39" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other/copyright" \ 
    extra.binaries="/usr/bin/efetch" \ 
    about.tags="field::biology, field::biology:bioinformatics, interface::commandline,:program, scope::utility" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y acedb-other || apt-get install -y acedb-other) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
