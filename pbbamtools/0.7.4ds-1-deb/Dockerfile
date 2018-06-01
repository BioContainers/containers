FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbbamtools" \ 
    container="pbbamtools" \ 
    about.summary="processing Pacific Biosciences binary alignment/map files" \ 
    about.home="http://pbbam.readthedocs.org/en/latest/index.html" \ 
    software.version="0.7.4ds-1-deb" \ 
    version="1" \ 
    about.copyright="2014-2016 Pacific Biosciences of California, Inc. <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbbamtools/copyright" \ 
    extra.binaries="/usr/bin/pbindex,/usr/bin/pbindexdump,/usr/bin/pbmerge" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbbamtools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
