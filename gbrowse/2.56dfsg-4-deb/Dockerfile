FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gbrowse" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gbrowse" \ 
    about.summary="GMOD Generic Genome Browser" \ 
    about.home="http://www.gbrowse.org/" \ 
    software.version="2.56dfsg-4-deb" \ 
    upstream.version="2.56" \ 
    version="1" \ 
    extra.identifiers.biotools="gbrowse" \ 
    about.copyright=" 2002 Cold Spring Harbor Laboratory and University of California, Berkeley" \ 
    about.license="GPL-1+ or Artistic-2.0" \ 
    about.license_file="/usr/share/doc/gbrowse/copyright" \ 
    extra.binaries="/usr/bin/bed2gff3,/usr/bin/gbrowse_aws_balancer,/usr/bin/gbrowse_change_passwd,/usr/bin/gbrowse_clean,/usr/bin/gbrowse_configure_slaves,/usr/bin/gbrowse_create_account,/usr/bin/gbrowse_grow_cloud_vol,/usr/bin/gbrowse_import_ucsc_db,/usr/bin/gbrowse_metadb_config,/usr/bin/gbrowse_set_admin_passwd,/usr/bin/gbrowse_slave,/usr/bin/gbrowse_syn_load_alignment_database,/usr/bin/gbrowse_syn_load_alignments_msa,/usr/bin/gbrowse_sync_aws_slave,/usr/bin/gtf2gff3,/usr/bin/load_genbank,/usr/bin/make_das_conf,/usr/bin/scan_gbrowse,/usr/bin/ucsc_genes2gff,/usr/bin/wiggle2gff3" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:web, role::program, use::analysing, use::viewing,:application,:cgi" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gbrowse || apt-get install -y gbrowse) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
