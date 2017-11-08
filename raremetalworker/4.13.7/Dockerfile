#################################################################
# Dockerfile
#
# Version:          1
# Software:         raremetalworker
# Software Version: 4.13.7
# Description:      single variant analysis, generating summary statistics for gene level meta analyses
# Website:          http://genome.sph.umich.edu/wiki/RAREMETALWORKER
# Tags:             Genomics
# Provides:         raremetalworker 4.13.7
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/raremetalworker 4.13.7/.
# Pull Cmd:         docker pull biodckrdev/raremetalworker
# Run Cmd:          docker run --rm -it biodckrdev/raremetalworker <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=RAREMETAL_WORKER_Linux_executables_4.13.7.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/raremetalworker
ENV FOLDER=Linux_executables_4.13.7
ENV DST=/home/biodocker/bin/

RUN set -xeu && wget $URL/$ZIP -O $DST/$ZIP && \
    tar axvf $DST/$ZIP -C $DST --strip-components=1 && \
    rm $DST/$ZIP && \
    cd / && \
    ls $DST

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["raremetal"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

