################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="gapcloser"
LABEL software.version="1.12-r6"
LABEL about.summary="A novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes"
LABEL about.home="http://soap.genomics.org.cn/gapcloser.html"
LABEL about.documentation="http://soap.genomics.org.cn/gapcloser.html"
LABEL about.license_file="http://soap.genomics.org.cn/gapcloser.html"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.tags="Genomics"
LABEL extra.binaries="GapCloser"

################## INSTALLATION ######################
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
# CMD ["GapCloser"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

