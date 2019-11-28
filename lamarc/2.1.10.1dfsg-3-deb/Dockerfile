FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lamarc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lamarc" \ 
    about.summary="Likelihood Analysis with Metropolis Algorithm using Random Coalescence" \ 
    about.home="http://evolution.gs.washington.edu/lamarc/" \ 
    software.version="2.1.10.1dfsg-3-deb" \ 
    upstream.version="2.1.10.1" \ 
    version="1" \ 
    about.copyright="2002-2005 Mary K. Kuhner, Peter Beerli, and Joseph Felsenstein" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/lamarc/copyright" \ 
    extra.binaries="/usr/bin/lam_conv,/usr/bin/lamarc" \ 
    about.tags="uitoolkit::wxwidgets" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y lamarc || apt-get install -y lamarc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
