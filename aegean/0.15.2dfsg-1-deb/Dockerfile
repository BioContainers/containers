FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aegean" \ 
    container="aegean" \ 
    about.summary="integrated genome analysis toolkit" \ 
    about.home="http://standage.github.io/AEGeAn" \ 
    software.version="0.15.2dfsg-1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/aegean/copyright" \ 
    extra.binaries="/usr/bin/canon-gff3,/usr/bin/gaeval,/usr/bin/locuspocus,/usr/bin/parseval,/usr/bin/pmrna,/usr/bin/tidygff3,/usr/bin/xtractore" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing, use::comparing,:converting" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y aegean && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
