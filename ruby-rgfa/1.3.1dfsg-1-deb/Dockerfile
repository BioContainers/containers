FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ruby-rgfa" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ruby-rgfa" \ 
    about.summary="parse, edit and write GFA format graphs in Ruby" \ 
    about.home="http://github.com/ggonnella/rgfa" \ 
    software.version="1.3.1dfsg-1-deb" \ 
    upstream.version="1.3.1" \ 
    version="1" \ 
    about.copyright="(c) 2016 Giorgio Gonnella and CONTRIBUTORS" \ 
    about.license="ISC" \ 
    about.license_file="/usr/share/doc/ruby-rgfa/copyright" \ 
    extra.binaries="/usr/bin/gfadiff,/usr/bin/rgfa-findcrisprs,/usr/bin/rgfa-mergelinear,/usr/bin/rgfa-simdebruijn" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ruby-rgfa || apt-get install -y ruby-rgfa) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
