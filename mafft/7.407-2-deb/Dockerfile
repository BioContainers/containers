FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mafft" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mafft" \ 
    about.summary="Multiple alignment program for amino acid or nucleotide sequences" \ 
    about.home="http://mafft.cbrc.jp/alignment/software/" \ 
    software.version="7.407-2-deb" \ 
    upstream.version="7.407" \ 
    version="1" \ 
    extra.identifiers.biotools="mafft" \ 
    about.copyright="20092017 Kazutaka Katoh" \ 
    about.license="mafft" \ 
    about.license_file="/usr/share/doc/mafft/copyright" \ 
    extra.binaries="/usr/bin/mafft,/usr/bin/mafft-homologs,/usr/bin/mafft-profile" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:plaintext, works-with::biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mafft || apt-get install -y mafft) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
