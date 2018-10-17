FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seer" \ 
    container="seer" \ 
    about.summary="genomic sequence element (kmer) enrichment analysis" \ 
    about.home="https://github.com/johnlees/seer" \ 
    software.version="1.1.2-3-deb" \ 
    version="1" \ 
    about.copyright="2015-2016 John Lees <john@johnlees.me>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/seer/copyright" \ 
    extra.binaries="/usr/bin/R_mds,/usr/bin/blast_top_hits,/usr/bin/combineKmers,/usr/bin/filter_seer,/usr/bin/hits_to_fastq,/usr/bin/kmds,/usr/bin/map_back,/usr/bin/mapping_to_phandango,/usr/bin/mash2matrix,/usr/bin/reformat_output,/usr/bin/seer" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y seer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
