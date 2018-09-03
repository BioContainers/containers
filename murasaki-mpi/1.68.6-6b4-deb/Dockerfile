FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="murasaki-mpi" \ 
    container="murasaki-mpi" \ 
    about.summary="homology detection tool across multiple large genomes (MPI-version)" \ 
    about.home="http://murasaki.dna.bio.keio.ac.jp/wiki/" \ 
    software.version="1.68.6-6b4-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/murasaki-mpi/copyright" \ 
    extra.binaries="/usr/bin/geneparse-mpi,/usr/bin/mbfa-mpi,/usr/bin/murasaki-mpi" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y murasaki-mpi && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
