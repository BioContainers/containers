FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dazzdb" \ 
    container="dazzdb" \ 
    about.summary="manage nucleotide sequencing read data" \ 
    about.home="https://github.com/thegenemyers/DAZZ_DB" \ 
    software.version="1.020161112-2-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 Eugene W. Myers <gene.myers@gmail.com>" \ 
    about.license="EWM-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/dazzdb/copyright" \ 
    extra.binaries="/usr/bin/Catrack,/usr/bin/DAM2fasta,/usr/bin/DB2arrow,/usr/bin/DB2fasta,/usr/bin/DB2quiva,/usr/bin/DBdump,/usr/bin/DBdust,/usr/bin/DBrm,/usr/bin/DBshow,/usr/bin/DBsplit,/usr/bin/DBstats,/usr/bin/DBwipe,/usr/bin/arrow2DB,/usr/bin/dsimulator,/usr/bin/fasta2DAM,/usr/bin/fasta2DB,/usr/bin/quiva2DB,/usr/bin/rangen" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dazzdb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
