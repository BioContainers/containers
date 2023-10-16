################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="evidential-gene"
LABEL software.version="22jan14"
LABEL about.summary="EvidentialGene is a genome informatics project for Evidence Directed Gene Construction for Eukaryotes"
LABEL about.home="http://arthropods.eugenes.org/EvidentialGene/evigene/"
LABEL about.documentation="http://arthropods.eugenes.org/EvidentialGene/evigene/docs/"
LABEL about.license_file="http://arthropods.eugenes.org/about/about-EvidentialGene/"
LABEL about.tags="Genomics, Transcriptomics"

################## MAINTAINER ######################
MAINTAINER Avani Bhojwani <avani.bhojwani@gmail.com>

################## INSTALLATION ######################

USER 0

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y perl cpanminus exonerate cd-hit ncbi-blast+ && \
    wget -O EvidentialGene.tar http://arthropods.eugenes.org/EvidentialGene/other/evigene_old/evigene_older/evigene22jan14.tar && \
    tar -xvf EvidentialGene.tar && rm EvidentialGene.tar && \
    chmod +x evigene/scripts/*.pl && \
    mv evigene /opt/ && \
    ln -s /usr/bin/cdhit /usr/bin/cd-hit && \
    ln -s /usr/bin/cdhit-est /usr/bin/cd-hit-est && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH="/opt/evigene/scripts:/opt/evigene/scripts/genoasm:/opt/evigene/scripts/genes:/opt/evigene/scripts/prot:/opt/evigene/scripts/genes/evgpipe_scriptwork:/opt/evigene/scripts/rnaseq:/opt/evigene/scripts/omcl:/opt/evigene/scripts/grid:/opt/evigene/scripts/ests:${PATH}"

USER biodocker

WORKDIR /data/