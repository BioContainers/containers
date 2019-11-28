FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aegean" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="aegean" \ 
    about.summary="integrated genome analysis toolkit" \ 
    about.home="http://standage.github.io/AEGeAn" \ 
    software.version="0.16.0dfsg-1-deb" \ 
    upstream.version="0.16.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/aegean/copyright" \ 
    about.license_file="/usr/share/doc/aegean/copyright" \ 
    extra.binaries="/usr/bin/canon-gff3,/usr/bin/gaeval,/usr/bin/locuspocus,/usr/bin/parseval,/usr/bin/pmrna,/usr/bin/tidygff3,/usr/bin/xtractore" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing, use::comparing,:converting" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y aegean || apt-get install -y aegean) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
