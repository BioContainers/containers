FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="suitename" \ 
    container="suitename" \ 
    about.summary="categorize each suite in an RNA backbone" \ 
    about.home="http://kinemage.biochem.duke.edu/software/suitename.php" \ 
    software.version="0.3.070628-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/suitename/copyright" \ 
    extra.binaries="/usr/bin/suitename" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y suitename && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
