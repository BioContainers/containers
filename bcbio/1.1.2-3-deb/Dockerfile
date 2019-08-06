FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bcbio" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bcbio" \ 
    about.summary="toolkit for analysing high-throughput sequencing data" \ 
    about.home="https://github.com/chapmanb/bcbio-nextgen" \ 
    software.version="1.1.2-3-deb" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    about.copyright="2013-2018 bcbio-nextgen contributors" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/bcbio/copyright" \ 
    extra.binaries="/usr/bin/bcbio_fastq_umi_prep.py,/usr/bin/bcbio_nextgen.py,/usr/bin/bcbio_prepare_samples.py,/usr/bin/bcbio_setup_genome.py,/usr/bin/cwltool2wdl.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bcbio || apt-get install -y bcbio) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
