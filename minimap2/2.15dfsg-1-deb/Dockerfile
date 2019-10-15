FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minimap2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="minimap2" \ 
    about.summary="versatile pairwise aligner for genomic and spliced nucleotide sequences" \ 
    about.home="https://github.com/lh3/minimap2" \ 
    software.version="2.15dfsg-1-deb" \ 
    upstream.version="2.15" \ 
    version="1" \ 
    extra.identifiers.biotools="minimap2" \ 
    about.copyright=" 2017-2018 Broad Institute <hengli@broadinstitute.org>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/minimap2/copyright" \ 
    extra.binaries="/usr/bin/minimap2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y minimap2 || apt-get install -y minimap2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
