FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="king" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="king" \ 
    about.summary="interactive system for three-dimensional vector graphics" \ 
    about.home="http://kinemage.biochem.duke.edu/software/king.php" \ 
    software.version="2.23.161103dfsg1-3-deb" \ 
    upstream.version="2.23.161103" \ 
    version="1" \ 
    about.copyright="2002-2011 Ian W. Davis <ian.w.davis@gmail.com>," \ 
    about.license="KiNG-License" \ 
    about.license_file="/usr/share/doc/king/copyright" \ 
    extra.binaries="/usr/bin/king" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y king || apt-get install -y king) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
