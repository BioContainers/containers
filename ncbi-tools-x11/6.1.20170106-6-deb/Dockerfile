FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-tools-x11" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-tools-x11" \ 
    about.summary="NCBI libraries for biology applications (X-based utilities)" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/" \ 
    software.version="6.1.20170106-6-deb" \ 
    upstream.version="6.1.20170106" \ 
    version="1" \ 
    about.copyright="1996-2017 NCBI" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ncbi-tools-x11/copyright" \ 
    extra.binaries="/usr/bin/Cn3D-3.0,/usr/bin/Psequin,/usr/bin/ddv,/usr/bin/entrez,/usr/bin/entrez2,/usr/bin/sbtedit,/usr/bin/sequin,/usr/bin/udv" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:biology:structural, implemented-in::c, interface::3d,:commandline,:graphical,:x11,:client, role::program, science::visualisation, scope::utility,:motif, use::analysing, use::calculating, use::editing,:searching,:viewing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-tools-x11 || apt-get install -y ncbi-tools-x11) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
