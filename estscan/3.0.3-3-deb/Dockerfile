FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="estscan" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="estscan" \ 
    about.summary="ORF-independent detector of coding DNA sequences" \ 
    about.home="http://estscan.sourceforge.net/" \ 
    software.version="3.0.3-3-deb" \ 
    upstream.version="3.0.3" \ 
    version="1" \ 
    extra.identifiers.biotools="estscan" \ 
    about.copyright="1999-2009 Christian Iseli, LICR ITO, <Christian.Iseli@licr.org>" \ 
    about.license="ESTScan" \ 
    about.license_file="/usr/share/doc/estscan/copyright" \ 
    extra.binaries="/usr/bin/estscan,/usr/bin/evaluate_model,/usr/bin/extract_EST,/usr/bin/extract_UG_EST,/usr/bin/makesmat,/usr/bin/maskred,/usr/bin/prepare_data,/usr/bin/winsegshuffle" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y estscan || apt-get install -y estscan) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
