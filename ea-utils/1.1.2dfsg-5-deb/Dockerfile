FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ea-utils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ea-utils" \ 
    about.summary="command-line tools for processing biological sequencing data" \ 
    about.home="https://expressionanalysis.github.io/ea-utils/" \ 
    software.version="1.1.2dfsg-5-deb" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    extra.identifiers.biotools="ea-utils" \ 
    about.copyright=" 2011 Erik Aronesty <erik@q32.com>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/ea-utils/copyright" \ 
    extra.binaries="/usr/bin/determine-phred,/usr/bin/ea-alc,/usr/bin/fastq-clipper,/usr/bin/fastq-join,/usr/bin/fastq-mcf,/usr/bin/fastq-multx,/usr/bin/fastq-stats,/usr/bin/fastx-graph,/usr/bin/randomFQ,/usr/bin/sam-stats,/usr/bin/varcall" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ea-utils || apt-get install -y ea-utils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
