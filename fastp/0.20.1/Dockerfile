################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################
LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL software="fastp"
LABEL software.version="0.20.1"
LABEL about.summary="A tool designed to provide fast all-in-one preprocessing for FastQ files"
LABEL about.home="https://github.com/OpenGene/fastp/"
LABEL about.documentation="https://github.com/OpenGene/fastp/"
LABEL about.license_file="https://github.com/OpenGene/fastp/"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="fastp"
LABEL about.tags="Genomics"
LABEL extra.binaries="fastp"
LABEL citation = "Shifu Chen, Yanqing Zhou, Yaru Chen, Jia Gu; fastp: an ultra-fast all-in-one FASTQ preprocessor, Bioinformatics, Volume 34, Issue 17, 1 September 2018, Pages i884–i890, https://doi.org/10.1093/bioinformatics/bty560"

################## MAINTAINER ######################
MAINTAINER Alvin Chen <ychen@aperiomics.com>

################## INSTALLATION ######################

RUN conda install fastp=0.20.1

WORKDIR /data/

# CMD ["bwa"]