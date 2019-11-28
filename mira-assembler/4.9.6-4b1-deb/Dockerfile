FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mira-assembler" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mira-assembler" \ 
    about.summary="Whole Genome Shotgun and EST Sequence Assembler" \ 
    about.home="http://chevreux.org/projects_mira.html" \ 
    software.version="4.9.6-4b1-deb" \ 
    upstream.version="4.9.6" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mira-assembler/copyright" \ 
    about.license_file="/usr/share/doc/mira-assembler/copyright" \ 
    extra.binaries="/usr/bin/mira,/usr/bin/mirabait,/usr/bin/miraconvert,/usr/bin/miramem,/usr/bin/miramer" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mira-assembler || apt-get install -y mira-assembler) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
