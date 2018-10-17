FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="iqtree" \ 
    container="iqtree" \ 
    about.summary="efficient phylogenetic software by maximum likelihood" \ 
    about.home="http://www.cibiv.at/software/iqtree/" \ 
    software.version="1.5.3dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2013-2015 Lam Tung Nguyen <tung.nguyen@univie.ac.at>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/iqtree/copyright" \ 
    extra.binaries="/usr/bin/iqtree,/usr/bin/iqtree-mpi,/usr/bin/iqtree-omp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y iqtree && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
