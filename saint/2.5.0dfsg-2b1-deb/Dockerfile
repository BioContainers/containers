FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="saint" \ 
    container="saint" \ 
    about.summary="Significance Analysis of INTeractome" \ 
    about.home="http://saint-apms.sourceforge.net/Main.html" \ 
    software.version="2.5.0dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/saint/copyright" \ 
    extra.binaries="/usr/bin/saint-int-ctrl,/usr/bin/saint-reformat,/usr/bin/saint-spc-ctrl,/usr/bin/saint-spc-noctrl,/usr/bin/saint-spc-noctrl-matrix" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y saint && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
