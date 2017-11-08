#################################################################
# Dockerfile
#
# Version:          1
# Software:         jbrowse
# Software Version: 1.11.6
# Description:      JBrowse is a fast, embeddable genome browser built completely with JavaScript and HTML5, with optional run-once data formatting tools written in Perl.
# Website:          http://jbrowse.org/
# Tags:             Genomics
# Provides:         jbrowse 1.11.6
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/jbrowse 1.11.6/.
# Pull Cmd:         docker pull biodckrdev/jbrowse
# Run Cmd:          docker run --rm -p 8000:8000 biodckrdev/jbrowse
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

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

