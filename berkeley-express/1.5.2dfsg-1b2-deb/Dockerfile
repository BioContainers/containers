FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="berkeley-express" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="berkeley-express" \ 
    about.summary="Streaming quantification for high-throughput sequencing" \ 
    about.home="http://bio.math.berkeley.edu/eXpress/index.html" \ 
    software.version="1.5.2dfsg-1b2-deb" \ 
    upstream.version="1.5.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/berkeley-express/copyright" \ 
    about.license_file="/usr/share/doc/berkeley-express/copyright" \ 
    extra.binaries="/usr/bin/berkeley-express" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y berkeley-express || apt-get install -y berkeley-express) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
