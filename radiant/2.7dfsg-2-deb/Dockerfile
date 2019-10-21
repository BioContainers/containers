FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="radiant" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="radiant" \ 
    about.summary="explore hierarchical metagenomic data with zoomable pie charts" \ 
    about.home="https://github.com/marbl/Krona/wiki" \ 
    software.version="2.7dfsg-2-deb" \ 
    upstream.version="2.7" \ 
    version="1" \ 
    about.copyright="2011-2016 Battelle National Biodefense Institute (BNBI)" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/radiant/copyright" \ 
    extra.binaries="/usr/bin/kronatools_updateTaxonomy,/usr/bin/ktClassifyBLAST,/usr/bin/ktGetContigMagnitudes,/usr/bin/ktGetLCA,/usr/bin/ktGetLibPath,/usr/bin/ktGetTaxIDFromAcc,/usr/bin/ktGetTaxInfo,/usr/bin/ktImportBLAST,/usr/bin/ktImportDiskUsage,/usr/bin/ktImportEC,/usr/bin/ktImportFCP,/usr/bin/ktImportGalaxy,/usr/bin/ktImportKrona,/usr/bin/ktImportMETAREP-EC,/usr/bin/ktImportMETAREP-blast,/usr/bin/ktImportMGRAST,/usr/bin/ktImportPhymmBL,/usr/bin/ktImportRDP,/usr/bin/ktImportRDPComparison,/usr/bin/ktImportTaxonomy,/usr/bin/ktImportText,/usr/bin/ktImportXML" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y radiant || apt-get install -y radiant) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
