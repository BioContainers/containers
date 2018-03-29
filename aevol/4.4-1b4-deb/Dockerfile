FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aevol" \ 
    container="aevol" \ 
    about.summary="digital genetics model to run Evolution Experiments in silico" \ 
    about.home="http://www.aevol.fr/" \ 
    software.version="4.4-1b4-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/aevol/copyright" \ 
    extra.binaries="/usr/bin/aevol_create,/usr/bin/aevol_misc_ancstats,/usr/bin/aevol_misc_compute_pop_stats,/usr/bin/aevol_misc_create_eps,/usr/bin/aevol_misc_extract,/usr/bin/aevol_misc_fixed_mutations,/usr/bin/aevol_misc_gene_families,/usr/bin/aevol_misc_lineage,/usr/bin/aevol_misc_robustness,/usr/bin/aevol_misc_view_generation,/usr/bin/aevol_modify,/usr/bin/aevol_propagate,/usr/bin/aevol_run" \ 
    about.tags="interface::graphical" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y aevol && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
