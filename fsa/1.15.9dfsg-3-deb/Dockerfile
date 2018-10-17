FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fsa" \ 
    container="fsa" \ 
    about.summary="Fast Statistical Alignment of protein, RNA or DNA sequences" \ 
    about.home="http://fsa.sourceforge.net/" \ 
    software.version="1.15.9dfsg-3-deb" \ 
    version="1" \ 
    about.copyright=" 2010-2014 Ariel Schwartz, Chuong Do, Robert Bradley, Jaeyoung Do, Colin Dewey, Ian Holmes, Lars Barquist" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/fsa/copyright" \ 
    extra.binaries="/usr/bin/fsa,/usr/bin/fsa-translate,/usr/bin/gapcleaner,/usr/bin/isect_mercator_alignment_gff,/usr/bin/map_coords,/usr/bin/map_gff_coords,/usr/bin/percentid,/usr/bin/prot2codon,/usr/bin/slice_fasta,/usr/bin/slice_fasta_gff,/usr/bin/slice_mercator_alignment" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fsa && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
