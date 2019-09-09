FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cdbfasta" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cdbfasta" \ 
    about.summary="Constant DataBase indexing and retrieval tools for multi-FASTA files" \ 
    about.home="http://cdbfasta.sourceforge.net/" \ 
    software.version="0.99-20100722-5-deb" \ 
    upstream.version="0.99" \ 
    version="1" \ 
    about.copyright=" 2002-2010 Geo Pertea <geo.pertea@gmail.com>," \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/cdbfasta/copyright" \ 
    extra.binaries="/usr/bin/cdbfasta,/usr/bin/cdbyank" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cdbfasta || apt-get install -y cdbfasta) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
