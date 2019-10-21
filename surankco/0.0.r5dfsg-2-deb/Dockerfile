FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="surankco" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="surankco" \ 
    about.summary="Supervised Ranking of Contigs in de novo Assemblies" \ 
    about.home="https://sourceforge.net/projects/surankco/" \ 
    software.version="0.0.r5dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2014-215 Mathias Kuhring <KuhringM@rki.de>, Robert Koch Institute, Germany," \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/surankco/copyright" \ 
    extra.binaries="/usr/bin/surankco-feature,/usr/bin/surankco-prediction,/usr/bin/surankco-score,/usr/bin/surankco-training" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y surankco || apt-get install -y surankco) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
