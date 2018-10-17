FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="berkeley-express" \ 
    container="berkeley-express" \ 
    about.summary="Streaming quantification for high-throughput sequencing" \ 
    about.home="http://bio.math.berkeley.edu/eXpress/index.html" \ 
    software.version="1.5.1-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/berkeley-express/copyright" \ 
    extra.binaries="/usr/bin/berkeley-express" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y berkeley-express && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
