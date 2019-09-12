FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="examl" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="examl" \ 
    about.summary="Exascale Maximum Likelihood (ExaML) code for phylogenetic inference" \ 
    about.home="https://github.com/stamatak/ExaML" \ 
    software.version="3.0.21-2-deb" \ 
    upstream.version="3.0.21" \ 
    version="1" \ 
    about.copyright="2006-2017 Alexandros Stamatakis" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/examl/copyright" \ 
    extra.binaries="/usr/bin/examl,/usr/bin/examl-AVX,/usr/bin/examl-OMP,/usr/bin/examl-OMP-AVX,/usr/bin/parse-examl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y examl || apt-get install -y examl) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
