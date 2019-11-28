FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seer" \ 
    about.summary="genomic sequence element (kmer) enrichment analysis" \ 
    about.home="https://github.com/johnlees/seer" \ 
    software.version="1.1.4-2b2-deb" \ 
    upstream.version="1.1.4" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/seer/copyright" \ 
    about.license_file="/usr/share/doc/seer/copyright" \ 
    extra.binaries="/usr/bin/R_mds,/usr/bin/blast_top_hits,/usr/bin/blastn_to_phandango,/usr/bin/combineKmers,/usr/bin/filter_seer,/usr/bin/hits_to_fastq,/usr/bin/kmds,/usr/bin/map_back,/usr/bin/mapping_to_phandango,/usr/bin/mash2matrix,/usr/bin/reformat_output,/usr/bin/seer" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seer || apt-get install -y seer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
