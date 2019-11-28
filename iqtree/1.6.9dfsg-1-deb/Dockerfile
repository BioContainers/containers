FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="iqtree" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="iqtree" \ 
    about.summary="efficient phylogenetic software by maximum likelihood" \ 
    about.home="http://www.cibiv.at/software/iqtree/" \ 
    software.version="1.6.9dfsg-1-deb" \ 
    upstream.version="1.6.9" \ 
    version="1" \ 
    about.copyright="2013-2018 Lam Tung Nguyen <tung.nguyen@univie.ac.at>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/iqtree/copyright" \ 
    extra.binaries="/usr/bin/iqtree,/usr/bin/iqtree-mpi,/usr/bin/iqtree-omp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y iqtree || apt-get install -y iqtree) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
