FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbconsensuscore" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbconsensuscore" \ 
    about.summary="algorithms for PacBio multiple sequence consensus -- Python 3" \ 
    about.home="https://github.com/PacificBiosciences/ConsensusCore" \ 
    software.version="1.1.1dfsg-1-deb-py3" \ 
    upstream.version="1.1.1" \ 
    version="1" \ 
    about.copyright="2011-2015 Pacific Biosciences <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbconsensuscore/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-pbconsensuscore || apt-get install -y python3-pbconsensuscore) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
