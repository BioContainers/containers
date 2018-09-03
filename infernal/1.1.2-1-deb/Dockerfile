FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="infernal" \ 
    container="infernal" \ 
    about.summary="inference of RNA secondary structural alignments" \ 
    about.home="http://infernal.janelia.org/" \ 
    software.version="1.1.2-1-deb" \ 
    version="1" \ 
    about.copyright=" 2001-2014 HHMI Janelia Farm" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/infernal/copyright" \ 
    extra.binaries="/usr/bin/cmalign,/usr/bin/cmbuild,/usr/bin/cmcalibrate,/usr/bin/cmconvert,/usr/bin/cmemit,/usr/bin/cmfetch,/usr/bin/cmpress,/usr/bin/cmscan,/usr/bin/cmsearch,/usr/bin/cmstat" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y infernal && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
