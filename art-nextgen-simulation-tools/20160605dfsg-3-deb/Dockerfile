FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="art-nextgen-simulation-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="art-nextgen-simulation-tools" \ 
    about.summary="simulation tools to generate synthetic next-generation sequencing reads" \ 
    about.home="http://www.niehs.nih.gov/research/resources/software/biostatistics/art/" \ 
    software.version="20160605dfsg-3-deb" \ 
    upstream.version="20160605" \ 
    version="1" \ 
    about.copyright="2008-2015 Weichun Huang <whduke@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/art-nextgen-simulation-tools/copyright" \ 
    extra.binaries="/usr/bin/aln2bed,/usr/bin/art_454,/usr/bin/art_SOLiD,/usr/bin/art_illumina,/usr/bin/art_profiler_454,/usr/bin/art_profiler_illumina" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y art-nextgen-simulation-tools || apt-get install -y art-nextgen-simulation-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
