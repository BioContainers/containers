FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="suitename" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="suitename" \ 
    about.summary="categorize each suite in an RNA backbone" \ 
    about.home="http://kinemage.biochem.duke.edu/software/suitename.php" \ 
    software.version="0.3.070628-2-deb" \ 
    upstream.version="0.3.070628" \ 
    version="1" \ 
    about.copyright="2007 David C. Richardson" \ 
    about.license="suitename" \ 
    about.license_file="/usr/share/doc/suitename/copyright" \ 
    extra.binaries="/usr/bin/suitename" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y suitename || apt-get install -y suitename) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
