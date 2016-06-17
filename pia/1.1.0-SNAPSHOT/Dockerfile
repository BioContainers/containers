#################################################################
# Dockerfile
#
# Version:          1
# Software:         PIA - Protein Inference Algorithms
# Software Version: 1.1.0-SNAPSHOT
# Description:      Compile PIA XML files and run pipelines with this image
# Website:          https://github.com/mpc-bioinformatics/pia
# Tags:             Proteomics
# Provides:         PIA-1.1.0-SNAPSHOT
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/pia 1.1.0-SNAPSHOT/.
# Pull Cmd:         docker pull biodckr/pia
# Run Cmd:          docker run --rm -v /mnt/data:/data biodckr/pia [compiler, pia]
# Extra:            Make sure to mount the volume with your data you want to compile or run the pipeline on.
#################################################################

# Set the base image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################
ENV ZIP_FILE pia-1.1.0-SNAPSHOT.zip
ENV URL https://github.com/mpc-bioinformatics/pia/releases/download/1.1.0-SNAPSHOT
ENV USER_HOME /home/biodocker
ENV PIA_PATH /home/biodocker/pia
ENV PIA_JAR $PIA_PATH/pia-1.1.0-SNAPSHOT.jar

RUN set -x \
  && wget $URL/$ZIP_FILE -O $USER_HOME/$ZIP_FILE \
  && unzip $USER_HOME/$ZIP_FILE -d $PIA_PATH \
  && rm $USER_HOME/$ZIP_FILE

COPY ./runpia.sh /

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

##################### INSTALLATION END ##########################

ENTRYPOINT ["/runpia.sh"]

# File Author / Maintainer
MAINTAINER Julian Uszkoreit <julian.uszkoreit@rub.de>
