FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gentle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gentle" \ 
    about.summary="suite to plan genetic cloning" \ 
    about.home="http://gentle.magnusmanske.de" \ 
    software.version="1.9cvs20100605dfsg1-7b1-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/gentle/copyright" \ 
    about.license_file="/usr/share/doc/gentle/copyright" \ 
    extra.binaries="/usr/bin/GENtle" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, interface::graphical,:x11, role::program, uitoolkit::wxwidgets, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gentle || apt-get install -y gentle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
