FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="saint" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="saint" \ 
    about.summary="Significance Analysis of INTeractome" \ 
    about.home="http://saint-apms.sourceforge.net/Main.html" \ 
    software.version="2.5.0dfsg-3-deb" \ 
    upstream.version="2.5.0" \ 
    version="1" \ 
    extra.identifiers.biotools="saint" \ 
    about.copyright=" 2010-2012 Hyung Won Choi <hyung_won_choi@nuhs.edu.sg>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/saint/copyright" \ 
    extra.binaries="/usr/bin/saint-int-ctrl,/usr/bin/saint-reformat,/usr/bin/saint-spc-ctrl,/usr/bin/saint-spc-noctrl,/usr/bin/saint-spc-noctrl-matrix" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y saint || apt-get install -y saint) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
