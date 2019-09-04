################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="raremetalworker"
LABEL software.version="4.13.7"
LABEL about.summary="single variant analysis, generating summary statistics for gene level meta analyses"
LABEL about.home="http://genome.sph.umich.edu/wiki/RAREMETALWORKER"
LABEL about.documentation="http://genome.sph.umich.edu/wiki/RAREMETALWORKER|https://github.com/statgen/Raremetal"
LABEL about.license_file="http://genome.sph.umich.edu/wiki/RAREMETALWORKER"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="RAREMETAL"
LABEL extra.binaries="raremetal"


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
# CMD ["raremetal"]

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

