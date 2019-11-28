################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="bedtools"
LABEL software.version="2.28.0"
LABEL about.summary="a powerful toolset for genome arithmetic"
LABEL about.home="http://bedtools.readthedocs.io/en/latest/"
LABEL about.documentation="http://quinlanlab.org/tutorials/bedtools/bedtools.html"
LABEL about.license_file="https://github.com/arq5x/bedtools2/blob/master/LICENSE"
LABEL about.license="SPDX:LGPL-2.0-only"
LABEL extra.identifiers.biotools="bedtools"
LABEL extra.binaries="bedtools"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER David Mas-Ponte <david.mas.p+gh@gmail.com>

RUN conda install bedtools=2.28.0

WORKDIR /data/

# ENTRYPOINT ["bedtools"]
