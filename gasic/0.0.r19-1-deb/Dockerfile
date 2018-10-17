FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gasic" \ 
    container="gasic" \ 
    about.summary="genome abundance similarity correction" \ 
    about.home="http://sourceforge.net/projects/gasic/" \ 
    software.version="0.0.r19-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2013 Martin S. Lindner <LindnerM@rki.de>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/gasic/copyright" \ 
    extra.binaries="/usr/bin/correct_abundances,/usr/bin/create_matrix,/usr/bin/quality_check,/usr/bin/run_mappers" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gasic && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
