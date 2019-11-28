FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="last-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="last-align" \ 
    about.summary="genome-scale comparison of biological sequences" \ 
    about.home="http://last.cbrc.jp/" \ 
    software.version="963-2-deb" \ 
    upstream.version="963" \ 
    version="1" \ 
    about.copyright=" 20082015 Martin C. Frith" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/last-align/copyright" \ 
    extra.binaries="/usr/bin/fastq-interleave,/usr/bin/last-dotplot,/usr/bin/last-map-probs,/usr/bin/last-merge-batches,/usr/bin/last-pair-probs,/usr/bin/last-postmask,/usr/bin/last-split,/usr/bin/last-split8,/usr/bin/last-train,/usr/bin/lastal,/usr/bin/lastal8,/usr/bin/lastdb,/usr/bin/lastdb8,/usr/bin/maf-convert,/usr/bin/maf-cut,/usr/bin/maf-join,/usr/bin/maf-sort,/usr/bin/maf-swap,/usr/bin/parallel-fasta,/usr/bin/parallel-fastq" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y last-align || apt-get install -y last-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
