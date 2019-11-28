FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="srst2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="srst2" \ 
    about.summary="Short Read Sequence Typing for Bacterial Pathogens" \ 
    about.home="https://katholt.github.io/srst2/" \ 
    software.version="0.2.0-6-deb" \ 
    upstream.version="0.2.0" \ 
    version="1" \ 
    about.copyright="2012-2015 Michael Inouye <minouye@unimelb.edu.au>, Harriet Dashnow <h.dashnow@gmail.com>," \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/srst2/copyright" \ 
    extra.binaries="/usr/bin/VFDB_cdhit_to_csv,/usr/bin/VFDBgenus,/usr/bin/csv_to_gene_db,/usr/bin/get_all_vfdb,/usr/bin/get_genus_vfdb,/usr/bin/getmlst,/usr/bin/slurm_srst2,/usr/bin/srst2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y srst2 || apt-get install -y srst2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
