FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="eigensoft" \ 
    container="eigensoft" \ 
    about.summary="reduction of population bias for genetic analyses" \ 
    about.home="http://www.hsph.harvard.edu/faculty/alkes-price/software/" \ 
    software.version="6.1.4dfsg-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/eigensoft/copyright" \ 
    extra.binaries="/usr/bin/baseprog,/usr/bin/convertf,/usr/bin/eigenstrat,/usr/bin/eigenstratQTL,/usr/bin/evec2pca,/usr/bin/evec2pca-ped,/usr/bin/gc-eigensoft,/usr/bin/mergeit,/usr/bin/pca,/usr/bin/pcaselection,/usr/bin/pcatoy,/usr/bin/ploteig,/usr/bin/smarteigenstrat,/usr/bin/smartpca,/usr/bin/smartrel,/usr/bin/twstats" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y eigensoft && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
