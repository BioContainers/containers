FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioperl-run" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bioperl-run" \ 
    about.summary="BioPerl wrappers: scripts" \ 
    about.home="https://metacpan.org/release/BioPerl-Run" \ 
    software.version="1.7.2-4-deb" \ 
    upstream.version="1.7.2" \ 
    version="1" \ 
    about.copyright=" 19972016 Bioperl Team <bioperl-l@bioperl.org>" \ 
    about.license="Perl" \ 
    about.license_file="/usr/share/doc/bioperl-run/copyright" \ 
    extra.binaries="/usr/bin/bp_bioperl_application_installer.pl,/usr/bin/bp_multi_hmmsearch.pl,/usr/bin/bp_panalysis.pl,/usr/bin/bp_papplmaker.pl,/usr/bin/bp_run_neighbor.pl,/usr/bin/bp_run_protdist.pl" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bioperl-run || apt-get install -y bioperl-run) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
