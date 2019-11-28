FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="roguenarok" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="roguenarok" \ 
    about.summary="versatile and scalable algorithm for rogue taxon identification" \ 
    about.home="https://github.com/aberer/RogueNaRok" \ 
    software.version="1.0-3-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="2011 Andre J. Aberer <andre.aberer@googlemail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/roguenarok/copyright" \ 
    extra.binaries="/usr/bin/rnr-lsi,/usr/bin/rnr-mast,/usr/bin/rnr-prune,/usr/bin/rnr-tii,/usr/bin/roguenarok-parallel,/usr/bin/roguenarok-single" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y roguenarok || apt-get install -y roguenarok) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
