FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioperl-run" \ 
    container="bioperl-run" \ 
    about.summary="BioPerl wrappers: scripts" \ 
    about.home="http://search.cpan.org/dist/BioPerl-Run/" \ 
    software.version="1.7.1-3-deb" \ 
    version="1" \ 
    about.copyright=" 19972016 Bioperl Team <bioperl-l@bioperl.org>" \ 
    about.license="Perl" \ 
    about.license_file="/usr/share/doc/bioperl-run/copyright" \ 
    extra.binaries="/usr/bin/bp_bioperl_application_installer.pl,/usr/bin/bp_multi_hmmsearch.pl,/usr/bin/bp_panalysis.pl,/usr/bin/bp_papplmaker.pl,/usr/bin/bp_run_neighbor.pl,/usr/bin/bp_run_protdist.pl" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bioperl-run && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
