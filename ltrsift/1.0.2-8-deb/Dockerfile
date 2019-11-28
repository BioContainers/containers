FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ltrsift" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ltrsift" \ 
    about.summary="postprocessing and classification of LTR retrotransposons" \ 
    about.home="http://www.zbh.uni-hamburg.de/LTRsift" \ 
    software.version="1.0.2-8-deb" \ 
    upstream.version="1.0.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ltrsift/copyright" \ 
    about.license_file="/usr/share/doc/ltrsift/copyright" \ 
    extra.binaries="/usr/bin/ltrsift,/usr/bin/ltrsift_encode" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline,:graphical,:x11,:program, scope::utility, uitoolkit::gtk, use::analysing,:browsing,:comparing,:organizing,:viewing,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ltrsift || apt-get install -y ltrsift) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
