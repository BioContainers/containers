FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bitseq" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bitseq" \ 
    about.summary="Bayesian Inference of Transcripts from Sequencing Data" \ 
    about.home="https://github.com/BitSeq/BitSeq" \ 
    software.version="0.7.5dfsg-4-deb" \ 
    upstream.version="0.7.5" \ 
    version="1" \ 
    extra.identifiers.biotools="bitseq" \ 
    about.copyright=" 2013-2014 Peter Glaus" \ 
    about.license="Artistic-2" \ 
    about.license_file="/usr/share/doc/bitseq/copyright" \ 
    extra.binaries="/usr/bin/biocUpdate,/usr/bin/checkTR,/usr/bin/convertSamples,/usr/bin/estimateDE,/usr/bin/estimateExpression,/usr/bin/estimateHyperPar,/usr/bin/estimateVBExpression,/usr/bin/extractSamples,/usr/bin/extractTranscriptInfo,/usr/bin/getCounts,/usr/bin/getFoldChange,/usr/bin/getGeneExpression,/usr/bin/getPPLR,/usr/bin/getVariance,/usr/bin/getWithinGeneExpression,/usr/bin/parseAlignment,/usr/bin/transposeLargeFile" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bitseq || apt-get install -y bitseq) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
