FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bio-tradis" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bio-tradis" \ 
    about.summary="analyse the output from TraDIS analyses of genomic sequences" \ 
    about.home="https://github.com/sanger-pathogens/Bio-Tradis" \ 
    software.version="1.4.1dfsg-1-deb" \ 
    upstream.version="1.4.1" \ 
    version="1" \ 
    extra.identifiers.biotools="bio-tradis" \ 
    about.copyright="2013-2017 Wellcome Trust Sanger Institute" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/bio-tradis/copyright" \ 
    extra.binaries="/usr/bin/add_tradis_tags,/usr/bin/bacteria_tradis,/usr/bin/check_tradis_tags,/usr/bin/combine_tradis_plots,/usr/bin/filter_tradis_tags,/usr/bin/remove_tradis_tags,/usr/bin/tradis_comparison,/usr/bin/tradis_comparison.R,/usr/bin/tradis_essentiality,/usr/bin/tradis_essentiality.R,/usr/bin/tradis_gene_insert_sites,/usr/bin/tradis_merge_plots,/usr/bin/tradis_plot" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bio-tradis || apt-get install -y bio-tradis) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
