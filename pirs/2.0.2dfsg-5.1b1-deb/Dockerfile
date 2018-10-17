FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pirs" \ 
    container="pirs" \ 
    about.summary="Profile based Illumina pair-end Reads Simulator" \ 
    about.home="https://github.com/galaxy001/pirs" \ 
    software.version="2.0.2dfsg-5.1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/pirs/copyright" \ 
    extra.binaries="/usr/bin/alignment_stator,/usr/bin/baseCalling_Matrix_analyzer,/usr/bin/baseCalling_Matrix_calculator,/usr/bin/baseCalling_Matrix_calculator.0,/usr/bin/baseCalling_Matrix_merger,/usr/bin/baseCalling_Matrix_merger.old,/usr/bin/gc_coverage_bias,/usr/bin/gc_coverage_bias_plot,/usr/bin/gethist,/usr/bin/ifollowQ,/usr/bin/ifollowQmerge,/usr/bin/ifollowQplot,/usr/bin/ifqQ,/usr/bin/indelstat_sam_bam,/usr/bin/itilestator,/usr/bin/loess,/usr/bin/pifollowQmerge,/usr/bin/pirs" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pirs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
