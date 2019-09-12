FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="eigensoft" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="eigensoft" \ 
    about.summary="reduction of population bias for genetic analyses" \ 
    about.home="http://www.hsph.harvard.edu/faculty/alkes-price/software/" \ 
    software.version="7.2.1dfsg-1-deb" \ 
    upstream.version="7.2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="eigensoft" \ 
    about.copyright="2006-2016 Alkes Price <aprice@hsph.harvard.edu>," \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/eigensoft/copyright" \ 
    extra.binaries="/usr/bin/baseprog,/usr/bin/convertf,/usr/bin/eigenstrat,/usr/bin/eigenstratQTL,/usr/bin/evec2pca,/usr/bin/evec2pca-ped,/usr/bin/gc-eigensoft,/usr/bin/mergeit,/usr/bin/pca,/usr/bin/pcatoy,/usr/bin/smarteigenstrat,/usr/bin/smartpca,/usr/bin/smartrel,/usr/bin/smshrink,/usr/bin/twstats" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y eigensoft || apt-get install -y eigensoft) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
