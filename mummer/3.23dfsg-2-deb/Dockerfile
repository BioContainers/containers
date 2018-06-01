FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mummer" \ 
    container="mummer" \ 
    about.summary="Efficient sequence alignment of full genomes" \ 
    about.home="http://mummer.sourceforge.net/" \ 
    software.version="3.23dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="mummer" \ 
    about.copyright=" 2003 by Stefan Kurtz and The Institute for Genomic Research." \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/mummer/copyright" \ 
    extra.binaries="/usr/bin/combineMUMs,/usr/bin/delta-filter,/usr/bin/delta2blocks,/usr/bin/delta2maf,/usr/bin/dnadiff,/usr/bin/exact-tandems,/usr/bin/gaps,/usr/bin/mapview,/usr/bin/mgaps,/usr/bin/mummer,/usr/bin/mummer-annotate,/usr/bin/mummerplot,/usr/bin/nucmer,/usr/bin/nucmer2xfig,/usr/bin/promer,/usr/bin/repeat-match,/usr/bin/run-mummer1,/usr/bin/run-mummer3,/usr/bin/show-aligns,/usr/bin/show-coords,/usr/bin/show-diff,/usr/bin/show-snps,/usr/bin/show-tiling" \ 
    extra.identifiers.conda="mummer" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::comparing,:TODO,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mummer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
