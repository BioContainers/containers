############################### Dockerfile ##################################

FROM biocontainers/biocontainers:v1.0.0_cv4

################################### Metadata ################################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="jbrowse"
LABEL software.version="1.11.6"
LABEL about.summary="JBrowse is a fast, embeddable genome browser built completely with JavaScript and HTML5, with optional run-once data formatting tools written in Perl."
LABEL about.home="http://jbrowse.org/"
LABEL about.tags="Genomics"
LABEL about.license_file="http://jbrowse.org/code/JBrowse-1.13.0/LICENSE"
LABEL about.license="SPDX:LGPL-3.0-only"
LABEL about.provides="jbrowse 1.11.6"
LABEL extra.identifiers.biotools="jbrowse"

################## BEGIN INSTALLATION ######################

#apt-get install libpng-dev libgd2-noxpm-dev build-essential

ENV ZIP=JBrowse-1.11.6.zip
ENV URL=https://github.com/BioDocker/software-archive/releases/download/jbrowse/
ENV DST=/home/biodocker/
ENV FOLDER=JBrowse-1.11.6

RUN mkdir -p $DST && \
    wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    cd $DST && \
    mv JBrowse-1.11.6 jbrowse && \
    cd jbrowse && \
    ./setup.sh

# CHANGE WORKDIR TO /DATA
WORKDIR /home/biodocker/jbrowse

# DEFINE DEFAULT COMMAND
CMD ["python", "-m", "SimpleHTTPServer", "8000"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

