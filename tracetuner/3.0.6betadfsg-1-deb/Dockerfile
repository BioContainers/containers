FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tracetuner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tracetuner" \ 
    about.summary="interpretation of DNA Sanger sequencing data" \ 
    about.home="https://sourceforge.net/projects/tracetuner/" \ 
    software.version="3.0.6betadfsg-1-deb" \ 
    version="1" \ 
    about.copyright="1999-2003 Paracel, Inc." \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/tracetuner/copyright" \ 
    extra.binaries="/usr/bin/checkbc,/usr/bin/checkbcphd,/usr/bin/checkqv,/usr/bin/checkqvphd,/usr/bin/lut,/usr/bin/train,/usr/bin/ttuner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tracetuner || apt-get install -y tracetuner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
