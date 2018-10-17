FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="loki" \ 
    container="loki" \ 
    about.summary="MCMC linkage analysis on general pedigrees" \ 
    software.version="2.4.7.4-6b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/loki/copyright" \ 
    extra.binaries="/usr/bin/hist,/usr/bin/loki,/usr/bin/loki_count,/usr/bin/loki_dist,/usr/bin/loki_ext,/usr/bin/loki_freq,/usr/bin/loki_sort_error,/usr/bin/prep,/usr/bin/qavg" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:program, scope::utility, use::TODO, use::analysing,:TODO, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y loki && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
