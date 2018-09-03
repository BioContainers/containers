FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ismrmrd-tools" \ 
    container="ismrmrd-tools" \ 
    about.summary="command-line tools for ISMRMRD" \ 
    about.home="http://ismrmrd.github.io/" \ 
    software.version="1.3.3-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ismrmrd-tools/copyright" \ 
    extra.binaries="/usr/bin/ismrmrd_generate_cartesian_shepp_logan,/usr/bin/ismrmrd_info,/usr/bin/ismrmrd_read_timing_test,/usr/bin/ismrmrd_recon_cartesian_2d,/usr/bin/ismrmrd_test_xml" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ismrmrd-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
