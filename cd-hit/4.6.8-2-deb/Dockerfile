FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cd-hit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cd-hit" \ 
    about.summary="suite of programs designed to quickly group sequences" \ 
    about.home="http://weizhong-lab.ucsd.edu/cd-hit/" \ 
    software.version="4.6.8-2-deb" \ 
    upstream.version="4.6.8" \ 
    version="1" \ 
    extra.identifiers.biotools="cd-hit" \ 
    about.copyright=" 2009-2015 Weizhong Li <liwz@sdsc.edu>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/cd-hit/copyright" \ 
    extra.binaries="/usr/bin/cd-hit,/usr/bin/cd-hit-2d,/usr/bin/cd-hit-2d-para,/usr/bin/cd-hit-454,/usr/bin/cd-hit-div,/usr/bin/cd-hit-est,/usr/bin/cd-hit-est-2d,/usr/bin/cd-hit-para,/usr/bin/cdhit,/usr/bin/cdhit-2d,/usr/bin/cdhit-454,/usr/bin/cdhit-est,/usr/bin/cdhit-est-2d,/usr/bin/clstr2tree,/usr/bin/clstr_merge,/usr/bin/clstr_merge_noorder,/usr/bin/clstr_reduce,/usr/bin/clstr_renumber,/usr/bin/clstr_rev,/usr/bin/clstr_sort_by,/usr/bin/clstr_sort_prot_by,/usr/bin/make_multi_seq" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:perl, interface::commandline, role::program,:comparing, works-with::biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cd-hit || apt-get install -y cd-hit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
