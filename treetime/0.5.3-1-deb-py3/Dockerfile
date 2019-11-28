FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="treetime" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="treetime" \ 
    about.summary="inference of time stamped phylogenies and ancestral reconstruction (Python 3)" \ 
    about.home="https://github.com/neherlab/treetime" \ 
    software.version="0.5.3-1-deb-py3" \ 
    upstream.version="0.5.3" \ 
    version="1" \ 
    about.copyright="2016-208 Pavel Sagulenko, Emma Hodcroft, and Richard Neher" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/treetime/copyright" \ 
    extra.binaries="/usr/bin/treetime" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-treetime || apt-get install -y python3-treetime) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
