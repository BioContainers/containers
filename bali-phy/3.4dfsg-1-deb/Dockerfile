FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bali-phy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bali-phy" \ 
    about.summary="Bayesian Inference of Alignment and Phylogeny" \ 
    about.home="http://www.bali-phy.org" \ 
    software.version="3.4dfsg-1-deb" \ 
    upstream.version="3.4" \ 
    version="1" \ 
    extra.identifiers.biotools="bali-phy" \ 
    about.copyright="2004-2018 Benjamin Redelings <benjamin.redelings@gmail.com>" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/bali-phy/copyright" \ 
    extra.binaries="/usr/bin/alignment-cat,/usr/bin/alignment-chop-internal,/usr/bin/alignment-consensus,/usr/bin/alignment-distances,/usr/bin/alignment-draw,/usr/bin/alignment-find,/usr/bin/alignment-gild,/usr/bin/alignment-indices,/usr/bin/alignment-info,/usr/bin/alignment-max,/usr/bin/alignment-thin,/usr/bin/alignment-translate,/usr/bin/alignments-diff,/usr/bin/bali-phy,/usr/bin/bali-phy-pkg,/usr/bin/bali-subsample,/usr/bin/bp-analyze,/usr/bin/cut-range,/usr/bin/draw-tree,/usr/bin/mctree-mean-lengths,/usr/bin/model_P,/usr/bin/pickout,/usr/bin/statreport,/usr/bin/stats-select,/usr/bin/tree-mean-lengths,/usr/bin/tree-tool,/usr/bin/trees-bootstrap,/usr/bin/trees-consensus,/usr/bin/trees-distances,/usr/bin/trees-to-SRQ" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bali-phy || apt-get install -y bali-phy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
