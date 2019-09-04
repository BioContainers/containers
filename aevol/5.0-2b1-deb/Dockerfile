FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aevol" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="aevol" \ 
    about.summary="digital genetics model to run Evolution Experiments in silico" \ 
    about.home="http://www.aevol.fr/" \ 
    software.version="5.0-2b1-deb" \ 
    upstream.version="5.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/aevol/copyright" \ 
    about.license_file="/usr/share/doc/aevol/copyright" \ 
    extra.binaries="/usr/bin/aevol_create,/usr/bin/aevol_misc_ancestor_robustness,/usr/bin/aevol_misc_ancestor_stats,/usr/bin/aevol_misc_create_eps,/usr/bin/aevol_misc_extract,/usr/bin/aevol_misc_lineage,/usr/bin/aevol_misc_mutagenesis,/usr/bin/aevol_misc_robustness,/usr/bin/aevol_misc_view,/usr/bin/aevol_modify,/usr/bin/aevol_propagate,/usr/bin/aevol_run" \ 
    about.tags="interface::graphical, interface::x11, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y aevol || apt-get install -y aevol) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
