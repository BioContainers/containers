FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bppphyview" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bppphyview" \ 
    about.summary="Bio++ Phylogenetic Viewer" \ 
    about.home="http://biopp.univ-montp2.fr/wiki/index.php/Main_Page" \ 
    software.version="0.6.1-1-deb" \ 
    upstream.version="0.6.1" \ 
    version="1" \ 
    about.copyright="2010-2018 Julien Yann Dutheil <julien.dutheil@univ-montp2.fr>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/bppphyview/copyright" \ 
    extra.binaries="/usr/bin/phyview" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::qt,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bppphyview || apt-get install -y bppphyview) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
