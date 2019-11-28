FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="king-probe" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="king-probe" \ 
    about.summary="Evaluate and visualize protein interatomic packing" \ 
    about.home="http://kinemage.biochem.duke.edu/software/probe.php" \ 
    software.version="2.16.160404git20180613.a09b012-1-deb" \ 
    upstream.version="2.16.160404" \ 
    version="1" \ 
    about.copyright="2014 David C. Richardson" \ 
    about.license="probe" \ 
    about.license_file="/usr/share/doc/king-probe/copyright" \ 
    extra.binaries="/usr/bin/king-probe" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y king-probe || apt-get install -y king-probe) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
