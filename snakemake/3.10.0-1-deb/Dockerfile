FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snakemake" \ 
    container="snakemake" \ 
    about.summary="pythonic workflow management system" \ 
    about.home="https://bitbucket.org/snakemake/snakemake" \ 
    software.version="3.10.0-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="snakemake" \ 
    about.copyright="2015 Johannes Kster <johannes.koester@tu-dortmund.de>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/snakemake/copyright" \ 
    extra.binaries="/usr/bin/snakemake,/usr/bin/snakemake-bash-completion" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y snakemake && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
