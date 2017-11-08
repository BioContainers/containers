#################################################################
# Dockerfile
#
# Version:          1
# Software:         tophat
# Software Version: 2.1.1
# Description:      TopHat is a fast splice junction mapper for RNA-Seq reads
# Website:          https://ccb.jhu.edu/software/tophat/index.shtml
# Tags:             Genomics
# Provides:         tophat 2.2.1
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/tophat 2.1.1/.
# Pull Cmd:         docker pull biodckrdev/tophat
# Run Cmd:          docker run --rm -it biodckrdev/tophat <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV TAR=tophat-2.1.1.Linux_x86_64.tar.gz
ENV URL=https://ccb.jhu.edu/software/tophat/downloads/
ENV FOLDER=tophat-2.1.1.Linux_x86_64
ENV DST=/home/biodocker/bin

RUN wget $URL/$TAR -O $DST/$TAR && \
    tar xzfv $DST/$TAR && \
    rm $DST/$TAR && \
    mv $FOLDER/* $DST && \
    rmdir $FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["tophat"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>


