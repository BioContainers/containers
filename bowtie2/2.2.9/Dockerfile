#################################################################
# Dockerfile
#
# Version:          1
# Software:         bowtie2
# Software Version: 2.2.9
# Description:      An ultrafast memory-efficient short read aligner
# Website:          http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
# Tags:             Genomics
# Provides:         bowtie2 2.2.9
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/bowtie2 2.2.9/.
# Pull Cmd:         docker pull biodckr/bowtie2
# Run Cmd:          docker run --rm -it biodckr/bowtie2 <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=bowtie2-2.2.9-linux-x86_64.zip
ENV URL=https://github.com/BenLangmead/bowtie2/releases/download/v2.2.9/
ENV FOLDER=bowtie2-2.2.9
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["bowtie2"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>


