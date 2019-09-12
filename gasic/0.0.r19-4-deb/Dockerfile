FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gasic" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gasic" \ 
    about.summary="genome abundance similarity correction" \ 
    about.home="http://sourceforge.net/projects/gasic/" \ 
    software.version="0.0.r19-4-deb" \ 
    version="1" \ 
    about.copyright="2012-2013 Martin S. Lindner <LindnerM@rki.de>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/gasic/copyright" \ 
    extra.binaries="/usr/bin/correct_abundances,/usr/bin/create_matrix,/usr/bin/quality_check,/usr/bin/run_mappers" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gasic || apt-get install -y gasic) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
