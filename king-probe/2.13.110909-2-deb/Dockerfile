FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="king-probe" \ 
    container="king-probe" \ 
    about.summary="Evaluate and visualize protein interatomic packing" \ 
    about.home="http://kinemage.biochem.duke.edu/software/probe.php" \ 
    software.version="2.13.110909-2-deb" \ 
    version="1" \ 
    about.copyright="2014 David C. Richardson" \ 
    about.license="probe" \ 
    about.license_file="/usr/share/doc/king-probe/copyright" \ 
    extra.binaries="/usr/bin/king-probe" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y king-probe && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
