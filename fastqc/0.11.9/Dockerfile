################# BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################
LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL version="8"
LABEL software="fastqc"
LABEL software.version="0.11.9"
LABEL about.summary="A quality control tool for high throughput sequence data."
LABEL about.home="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
LABEL about.documentation="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/"
LABEL about.license_file="https://www.gnu.org/copyleft/gpl.html"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="fastqc"
LABEL about.tags="General"
LABEL extra.binaries="fastqc"


################## MAINTAINER ######################
LABEL maintainer="Alvin Chen <ychen@aperiomics.com>"

################## INSTALLATION ######################
USER root

ENV ZIP=fastqc_v0.11.9.zip
ENV URL=https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
ENV FOLDER=FastQC
ENV DST=/opt/fastqc
ENV ULOCAL=/usr/local/bin

RUN mkdir -p $DST

RUN apt-get update && apt-get install -y openjdk-8-jre-headless && \
    wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER && chmod +x $DST/fastqc && \
    ln -s $DST/fastqc $ULOCAL/fastqc

WORKDIR /data/
# fastqc binary is available in path, as a wrapper to java command
# graphical interface needs X11, not available in container, only 
# command-line should be used (non-interactive)
