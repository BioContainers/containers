FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bowtie2" \ 
    container="bowtie2" \ 
    about.summary="ultrafast memory-efficient short read aligner" \ 
    about.home="http://bowtie-bio.sourceforge.net/bowtie2" \ 
    software.version="2.3.0-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="bowtie2" \ 
    about.copyright=" 2009-2016 Ben Langmead, C. Trapnell, M. Pop, Steven L. Salzberg" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/bowtie2/copyright" \ 
    extra.binaries="/usr/bin/bowtie2,/usr/bin/bowtie2-align-l,/usr/bin/bowtie2-align-s,/usr/bin/bowtie2-build,/usr/bin/bowtie2-build-l,/usr/bin/bowtie2-build-s,/usr/bin/bowtie2-inspect,/usr/bin/bowtie2-inspect-l,/usr/bin/bowtie2-inspect-s" \ 
    extra.identifiers.conda="bowtie2" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:comparing, works-with::biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bowtie2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
