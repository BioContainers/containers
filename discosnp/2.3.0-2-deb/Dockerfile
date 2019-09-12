FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="discosnp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="discosnp" \ 
    about.summary="discovering Single Nucleotide Polymorphism from raw set(s) of reads" \ 
    about.home="http://colibread.inria.fr/discosnp/" \ 
    software.version="2.3.0-2-deb" \ 
    upstream.version="2.3.0" \ 
    version="1" \ 
    extra.identifiers.biotools="discosnp" \ 
    about.copyright="2013 INRIA / IRISA" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/discosnp/copyright" \ 
    extra.binaries="/usr/bin/kissnp2,/usr/bin/kissreads2,/usr/bin/run_discoSnp++.sh,/usr/bin/run_discoSnpRad.sh" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y discosnp || apt-get install -y discosnp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
