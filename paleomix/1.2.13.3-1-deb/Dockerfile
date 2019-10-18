FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="paleomix" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="paleomix" \ 
    about.summary="pipelines and tools for the processing of ancient and modern HTS data" \ 
    about.home="http://geogenetics.ku.dk/publications/paleomix" \ 
    software.version="1.2.13.3-1-deb" \ 
    upstream.version="1.2.13.3" \ 
    version="1" \ 
    extra.identifiers.biotools="paleomix" \ 
    about.copyright="2014-2017 Mikkel Schubert" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/paleomix/copyright" \ 
    extra.binaries="/usr/bin/bam_pipeline,/usr/bin/bam_rmdup_collapsed,/usr/bin/conv_gtf_to_bed,/usr/bin/paleomix,/usr/bin/phylo_pipeline,/usr/bin/trim_pipeline" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y paleomix || apt-get install -y paleomix) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
