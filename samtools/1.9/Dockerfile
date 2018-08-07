################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="Samtools"
LABEL software.version="1.9"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"

################## MAINTAINER ######################
MAINTAINER John McGonigle <j.e.mcgonigle@gmail.com>
RUN conda install samtools=1.9
RUN conda install -c conda-forge ncurses # Fix to deal with the issue with libtinfow.so.5

WORKDIR /data/

CMD ["samtools"]
