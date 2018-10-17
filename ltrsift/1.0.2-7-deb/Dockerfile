FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ltrsift" \ 
    container="ltrsift" \ 
    about.summary="postprocessing and classification of LTR retrotransposons" \ 
    about.home="http://www.zbh.uni-hamburg.de/LTRsift" \ 
    software.version="1.0.2-7-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ltrsift/copyright" \ 
    extra.binaries="/usr/bin/ltrsift,/usr/bin/ltrsift_encode" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:graphical,:x11, role::program, scope::utility,:gtk, use::analysing, use::browsing, use::comparing,:organizing,:viewing, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ltrsift && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
