#################################################################
# Dockerfile
#
# Version:          1
# Software:         gapcloser
# Software Version: 1.12-r6
# Description:      a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes
# Website:          http://soap.genomics.org.cn/gapcloser.html
# Tags:             Genomics
# Provides:         gapcloser 1.12-r6
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/gapcloser v1.12-r6/.
# Pull Cmd:         docker pull biodckrdev/gapcloser
# Run Cmd:          docker run --rm -it biodckrdev/gapcloser <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=GapCloser-bin-v1.12-r6.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/gapcloser
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["GapCloser"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

