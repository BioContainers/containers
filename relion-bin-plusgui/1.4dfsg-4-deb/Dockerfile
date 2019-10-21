FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="relion-bin-plusgui" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="relion-bin-plusgui" \ 
    about.summary="parallel toolkit for 3D reconstructions in cryo-electron microscopy" \ 
    about.home="http://www2.mrc-lmb.cam.ac.uk/relion/index.php/Main_Page" \ 
    software.version="1.4dfsg-4-deb" \ 
    upstream.version="1.4" \ 
    version="1" \ 
    about.copyright="2014, Sjors Scheres at the MRC Laboratory of Molecular Biology" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/relion-bin-plusgui/copyright" \ 
    extra.binaries="/usr/bin/relion_autopick,/usr/bin/relion_display,/usr/bin/relion_find_tiltpairs,/usr/bin/relion_image_handler,/usr/bin/relion_maingui,/usr/bin/relion_manualpick,/usr/bin/relion_mask_create,/usr/bin/relion_particle_polish,/usr/bin/relion_particle_sort,/usr/bin/relion_postprocess,/usr/bin/relion_preprocess,/usr/bin/relion_project,/usr/bin/relion_reconstruct,/usr/bin/relion_refine,/usr/bin/relion_run_ctffind,/usr/bin/relion_stack_create,/usr/bin/relion_star_compare,/usr/bin/relion_star_datablock_ctfdat,/usr/bin/relion_star_datablock_singlefiles,/usr/bin/relion_star_datablock_stack,/usr/bin/relion_star_loopheader,/usr/bin/relion_star_plottable,/usr/bin/relion_star_printtable,/usr/bin/relion_tiltpair_plot" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y relion-bin+gui || apt-get install -y relion-bin+gui) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
