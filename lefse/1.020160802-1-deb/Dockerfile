FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lefse" \ 
    container="lefse" \ 
    about.summary="determine features of organisms, clades, taxonomic units, genes" \ 
    about.home="https://bitbucket.org/biobakery/biobakery/wiki/lefse" \ 
    software.version="1.020160802-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2016 Nicola Segata <nicola.segata@unitn.it> and Curtis Huttenhower" \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/lefse/copyright" \ 
    extra.binaries="/usr/bin/format_input,/usr/bin/lefse2circlader,/usr/bin/plot_cladogram,/usr/bin/plot_features,/usr/bin/plot_res,/usr/bin/qiime2lefse,/usr/bin/run_lefse" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y lefse && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
