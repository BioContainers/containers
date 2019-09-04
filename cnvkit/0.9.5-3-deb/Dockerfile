FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cnvkit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cnvkit" \ 
    about.summary="Copy number variant detection from targeted DNA sequencing" \ 
    about.home="http://cnvkit.readthedocs.org" \ 
    software.version="0.9.5-3-deb" \ 
    upstream.version="0.9.5" \ 
    version="1" \ 
    extra.identifiers.biotools="cnvkit" \ 
    about.copyright=" 2013-2017 Eric Talevich" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/cnvkit/copyright" \ 
    extra.binaries="/usr/bin/cnvkit,/usr/bin/cnvkit-cnv_annotate,/usr/bin/cnvkit-cnv_expression_correlate,/usr/bin/cnvkit-cnv_updater,/usr/bin/cnvkit-cnv_ztest,/usr/bin/cnvkit-guess_baits,/usr/bin/cnvkit-reference2targets,/usr/bin/cnvkit-skg_convert,/usr/bin/snpfilter.sh" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cnvkit || apt-get install -y cnvkit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
