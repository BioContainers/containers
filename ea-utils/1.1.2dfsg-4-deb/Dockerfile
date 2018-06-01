FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ea-utils" \ 
    container="ea-utils" \ 
    about.summary="command-line tools for processing biological sequencing data" \ 
    about.home="https://expressionanalysis.github.io/ea-utils/" \ 
    software.version="1.1.2dfsg-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="ea-utils" \ 
    about.copyright=" 2011 Erik Aronesty <erik@q32.com>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/ea-utils/copyright" \ 
    extra.binaries="/usr/bin/determine-phred,/usr/bin/ea-alc,/usr/bin/fastq-clipper,/usr/bin/fastq-join,/usr/bin/fastq-mcf,/usr/bin/fastq-multx,/usr/bin/fastq-stats,/usr/bin/fastx-graph,/usr/bin/randomFQ,/usr/bin/sam-stats,/usr/bin/varcall" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ea-utils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
