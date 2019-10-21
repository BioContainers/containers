FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spades" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="spades" \ 
    about.summary="genome assembler for single-cell and isolates data sets" \ 
    about.home="http://cab.spbu.ru/software/spades/" \ 
    software.version="3.13.0dfsg2-2-deb" \ 
    upstream.version="3.13.0" \ 
    version="1" \ 
    extra.identifiers.biotools="spades" \ 
    about.copyright="2011-2014 Saint-Petersburg Academic University" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/spades/copyright" \ 
    extra.binaries="/usr/bin/metaspades,/usr/bin/metaspades.py,/usr/bin/plasmidspades,/usr/bin/plasmidspades.py,/usr/bin/rnaspades,/usr/bin/rnaspades.py,/usr/bin/spades,/usr/bin/spades.py,/usr/bin/truspades,/usr/bin/truspades.py" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++,:python, interface::commandline,:program, scope::utility, works-with::biological-sequence,:file" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y spades || apt-get install -y spades) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
