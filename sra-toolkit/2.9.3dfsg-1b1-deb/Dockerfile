FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sra-toolkit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sra-toolkit" \ 
    about.summary="utilities for the NCBI Sequence Read Archive" \ 
    about.home="https://github.com/ncbi/sra-tools/" \ 
    software.version="2.9.3dfsg-1b1-deb" \ 
    upstream.version="2.9.3" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/sra-toolkit/copyright" \ 
    about.license_file="/usr/share/doc/sra-toolkit/copyright" \ 
    extra.binaries="/usr/bin/abi-dump,/usr/bin/abi-load,/usr/bin/align-info,/usr/bin/bam-load,/usr/bin/cache-mgr,/usr/bin/cg-load,/usr/bin/copycat,/usr/bin/fasterq-dump,/usr/bin/fastq-dump,/usr/bin/fastq-load,/usr/bin/helicos-load,/usr/bin/illumina-dump,/usr/bin/illumina-load,/usr/bin/kar,/usr/bin/kdbmeta,/usr/bin/latf-load,/usr/bin/pacbio-load,/usr/bin/prefetch,/usr/bin/rcexplain,/usr/bin/remote-fuser,/usr/bin/sam-dump,/usr/bin/sff-dump,/usr/bin/sff-load,/usr/bin/sra-pileup,/usr/bin/sra-sort,/usr/bin/sra-stat,/usr/bin/srapath,/usr/bin/srf-load,/usr/bin/test-sra,/usr/bin/vdb-config,/usr/bin/vdb-copy,/usr/bin/vdb-decrypt,/usr/bin/vdb-dump,/usr/bin/vdb-encrypt,/usr/bin/vdb-get,/usr/bin/vdb-lock,/usr/bin/vdb-passwd,/usr/bin/vdb-unlock,/usr/bin/vdb-validate" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sra-toolkit || apt-get install -y sra-toolkit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
