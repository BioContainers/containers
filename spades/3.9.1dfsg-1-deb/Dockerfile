FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spades" \ 
    container="spades" \ 
    about.summary="genome assembler for single-cell and isolates data sets" \ 
    about.home="http://bioinf.spbau.ru/en/spades" \ 
    software.version="3.9.1dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="spades" \ 
    about.copyright="2011-2014 Saint-Petersburg Academic University" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/spades/copyright" \ 
    extra.binaries="/usr/bin/dipspades,/usr/bin/dipspades.py,/usr/bin/metaspades,/usr/bin/metaspades.py,/usr/bin/plasmidspades,/usr/bin/plasmidspades.py,/usr/bin/rnaspades,/usr/bin/rnaspades.py,/usr/bin/spades,/usr/bin/spades.py,/usr/bin/truspades,/usr/bin/truspades.py" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++,:python, interface::commandline,:program, scope::utility, works-with::biological-sequence,:file" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y spades && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
