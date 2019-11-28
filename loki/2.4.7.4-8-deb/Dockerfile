FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="loki" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="loki" \ 
    about.summary="MCMC linkage analysis on general pedigrees" \ 
    software.version="2.4.7.4-8-deb" \ 
    upstream.version="2.4.7.4" \ 
    version="1" \ 
    about.copyright="1997-2004 Simon C. Heath <heath@cng.fr>" \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/loki/copyright" \ 
    extra.binaries="/usr/bin/hist,/usr/bin/loki,/usr/bin/loki_count,/usr/bin/loki_dist,/usr/bin/loki_ext,/usr/bin/loki_freq,/usr/bin/loki_sort_error,/usr/bin/prep,/usr/bin/qavg" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:program, scope::utility, use::TODO, use::analysing,:TODO, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y loki || apt-get install -y loki) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
