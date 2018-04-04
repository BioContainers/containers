FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bio-rainbow" \ 
    container="bio-rainbow" \ 
    about.summary="clustering and assembling short reads for bioinformatics" \ 
    about.home="http://sourceforge.net/projects/bio-rainbow/" \ 
    software.version="2.0.4-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bio-rainbow/copyright" \ 
    extra.binaries="/usr/bin/bio-rainbow,/usr/bin/ezmsim,/usr/bin/rbasm,/usr/bin/select_all_rbcontig.pl,/usr/bin/select_best_rbcontig.pl,/usr/bin/select_best_rbcontig_plus_read1.pl,/usr/bin/select_sec_rbcontig.pl" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bio-rainbow && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
