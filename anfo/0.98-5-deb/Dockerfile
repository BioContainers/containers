FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="anfo" \ 
    container="anfo" \ 
    about.summary="Short Read Aligner/Mapper from MPG" \ 
    about.home="http://bioinf.eva.mpg.de/anfo/" \ 
    software.version="0.98-5-deb" \ 
    version="1" \ 
    about.copyright=" 2009 Udo Stenzel <udo_stenzel@eva.mpg.de>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/anfo/copyright" \ 
    extra.binaries="/usr/bin/anfo,/usr/bin/anfo-tool,/usr/bin/dnaindex,/usr/bin/fa2dna" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y anfo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
