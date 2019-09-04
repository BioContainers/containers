FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bppsuite" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bppsuite" \ 
    about.summary="Bio++ program suite" \ 
    about.home="http://biopp.univ-montp2.fr/wiki/index.php/Main_Page" \ 
    software.version="2.4.1-1-deb" \ 
    upstream.version="2.4.1" \ 
    version="1" \ 
    about.copyright="2010-2018 Julien Yann Dutheil <julien.dutheil@univ-montp2.fr>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/bppsuite/copyright" \ 
    extra.binaries="/usr/bin/bppalnscore,/usr/bin/bppancestor,/usr/bin/bppconsense,/usr/bin/bppdist,/usr/bin/bppmixedlikelihoods,/usr/bin/bppml,/usr/bin/bpppars,/usr/bin/bpppopstats,/usr/bin/bppreroot,/usr/bin/bppseqgen,/usr/bin/bppseqman,/usr/bin/bpptreedraw" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bppsuite || apt-get install -y bppsuite) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
