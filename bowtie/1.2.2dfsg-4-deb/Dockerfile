FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bowtie" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bowtie" \ 
    about.summary="Ultrafast memory-efficient short read aligner" \ 
    about.home="http://bowtie-bio.sourceforge.net/" \ 
    software.version="1.2.2dfsg-4-deb" \ 
    upstream.version="1.2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="bowtie" \ 
    about.copyright=" 2009-2014 Ben Langmead, C. Trapnell, M. Pop, Steven L. Salzberg" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bowtie/copyright" \ 
    extra.binaries="/usr/bin/bowtie,/usr/bin/bowtie-align-l,/usr/bin/bowtie-align-l-debug,/usr/bin/bowtie-align-s,/usr/bin/bowtie-align-s-debug,/usr/bin/bowtie-build,/usr/bin/bowtie-build-l,/usr/bin/bowtie-build-l-debug,/usr/bin/bowtie-build-s,/usr/bin/bowtie-build-s-debug,/usr/bin/bowtie-inspect,/usr/bin/bowtie-inspect-l,/usr/bin/bowtie-inspect-l-debug,/usr/bin/bowtie-inspect-s,/usr/bin/bowtie-inspect-s-debug" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, science::calculation,:utility, use::analysing, use::comparing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bowtie || apt-get install -y bowtie) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
