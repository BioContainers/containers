################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="cpat"
LABEL software.version="1.2.4"
LABEL about.summary="Coding Potential Assessment Tool"
LABEL about.home="http://rna-cpat.sourceforge.net/"
LABEL about.documentation="http://rna-cpat.sourceforge.net/"
LABEL about.license_file="http://rna-cpat.sourceforge.net/#license"
LABEL about.license="SPDX:GPL-2.0+"
LABEL extra.identifiers.biotools="cpat"
LABEL about.tags="field::biology, field::biology:bioinformatics, rna"
LABEL extra.binaries="cpat.py"

################## MAINTAINER ######################
MAINTAINER Sequencing Analysis Support Core, Leiden University Medical Center <sasc@lumc.nl>

################## INSTALLATION ######################

RUN conda install cpat=1.2.4

WORKDIR /data/

# CMD ["cpat.py"]
