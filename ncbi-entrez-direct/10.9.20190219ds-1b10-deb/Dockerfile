FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-entrez-direct" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-entrez-direct" \ 
    about.summary="NCBI Entrez utilities on the command line" \ 
    about.home="http://www.ncbi.nlm.nih.gov/books/NBK179288" \ 
    software.version="10.9.20190219ds-1b10-deb" \ 
    upstream.version="10.9.20190219" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ncbi-entrez-direct/copyright" \ 
    about.license_file="/usr/share/doc/ncbi-entrez-direct/copyright" \ 
    extra.binaries="/usr/bin/amino-acid-composition,/usr/bin/archive-pubmed,/usr/bin/between-two-genes,/usr/bin/download-pubmed,/usr/bin/download-sequence,/usr/bin/eaddress,/usr/bin/eblast,/usr/bin/ecitmatch,/usr/bin/econtact,/usr/bin/edirect,/usr/bin/edirutil,/usr/bin/efetch,/usr/bin/efilter,/usr/bin/einfo,/usr/bin/elink,/usr/bin/enotify,/usr/bin/entrez-phrase-search,/usr/bin/epost,/usr/bin/eproxy,/usr/bin/esearch,/usr/bin/espell,/usr/bin/esummary,/usr/bin/fetch-pubmed,/usr/bin/filter-stop-words,/usr/bin/ftp-cp,/usr/bin/ftp-ls,/usr/bin/gbf2xml,/usr/bin/index-pubmed,/usr/bin/intersect-uid-lists,/usr/bin/join-into-groups-of,/usr/bin/nquire,/usr/bin/pm-index,/usr/bin/pm-invert,/usr/bin/pm-merge,/usr/bin/pm-prepare,/usr/bin/pm-promote,/usr/bin/pm-refresh,/usr/bin/pm-stash,/usr/bin/protein-neighbors,/usr/bin/rchive,/usr/bin/reorder-columns,/usr/bin/run-ncbi-converter,/usr/bin/sort-uniq-count,/usr/bin/sort-uniq-count-rank,/usr/bin/stream-pubmed,/usr/bin/transmute,/usr/bin/word-at-a-time,/usr/bin/xtract,/usr/bin/xy-plot" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-entrez-direct || apt-get install -y ncbi-entrez-direct) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
