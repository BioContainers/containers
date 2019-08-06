FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="anfo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="anfo" \ 
    about.summary="Short Read Aligner/Mapper from MPG" \ 
    about.home="http://bioinf.eva.mpg.de/anfo/" \ 
    software.version="0.98-7-deb" \ 
    upstream.version="0.98" \ 
    version="1" \ 
    about.copyright=" 2009 Udo Stenzel <udo_stenzel@eva.mpg.de>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/anfo/copyright" \ 
    extra.binaries="/usr/bin/anfo,/usr/bin/anfo-tool,/usr/bin/dnaindex,/usr/bin/fa2dna" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y anfo || apt-get install -y anfo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
