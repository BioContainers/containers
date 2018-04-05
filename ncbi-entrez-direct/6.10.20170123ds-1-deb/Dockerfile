FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-entrez-direct" \ 
    container="ncbi-entrez-direct" \ 
    about.summary="NCBI Entrez utilities on the command line" \ 
    about.home="http://www.ncbi.nlm.nih.gov/books/NBK179288" \ 
    software.version="6.10.20170123ds-1-deb" \ 
    version="1" \ 
    about.copyright="Jonathan Kans, NCBI" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/ncbi-entrez-direct/copyright" \ 
    extra.binaries="/usr/bin/amino-acid-composition,/usr/bin/between-two-genes,/usr/bin/eaddress,/usr/bin/ecitmatch,/usr/bin/econtact,/usr/bin/edirect,/usr/bin/edirutil,/usr/bin/efetch,/usr/bin/efilter,/usr/bin/einfo,/usr/bin/elink,/usr/bin/enotify,/usr/bin/entrez-phrase-search,/usr/bin/epost,/usr/bin/eproxy,/usr/bin/esearch,/usr/bin/espell,/usr/bin/esummary,/usr/bin/filter-stop-words,/usr/bin/ftp-cp,/usr/bin/ftp-ls,/usr/bin/join-into-groups-of,/usr/bin/nquire,/usr/bin/reorder-columns,/usr/bin/sort-uniq-count,/usr/bin/sort-uniq-count-rank,/usr/bin/word-at-a-time,/usr/bin/xtract,/usr/bin/xy-plot" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncbi-entrez-direct && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
