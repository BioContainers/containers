################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="raremetalworker"
LABEL software.version="4.13.7"
LABEL description="single variant analysis, generating summary statistics for gene level meta analyses"
LABEL website="http://genome.sph.umich.edu/wiki/RAREMETALWORKER"
LABEL documentation=" http://genome.sph.umich.edu/wiki/RAREMETALWORKER"
LABEL license=" http://genome.sph.umich.edu/wiki/RAREMETALWORKER"
LABEL tags="Genomics"


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

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

