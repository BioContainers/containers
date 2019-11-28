FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="infernal" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="infernal" \ 
    about.summary="inference of RNA secondary structural alignments" \ 
    about.home="http://eddylab.org/infernal/" \ 
    software.version="1.1.2-2-deb" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    about.copyright=" 2001-2014 HHMI Janelia Farm" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/infernal/copyright" \ 
    extra.binaries="/usr/bin/cmalign,/usr/bin/cmbuild,/usr/bin/cmcalibrate,/usr/bin/cmconvert,/usr/bin/cmemit,/usr/bin/cmfetch,/usr/bin/cmpress,/usr/bin/cmscan,/usr/bin/cmsearch,/usr/bin/cmstat" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y infernal || apt-get install -y infernal) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
