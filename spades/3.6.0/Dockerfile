FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="spades"
LABEL software.version="3.6.0"
LABEL about.summary="Tools (written in C using htslib) for manipulating next-generation sequencing data"
LABEL about.home="http://bioinf.spbau.ru/spades"
LABEL about.documentation="http://bioinf.spbau.ru/spades"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="Spades"
LABEL extra.binaries="bwa-spades"


################## BEGIN INSTALLATION ######################

ENV ZIP=SPAdes-3.6.0-Linux.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/spades
ENV FOLDER=SPAdes-3.6.0-Linux
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mv $DST/$FOLDER/bin/* /home/biodocker/bin && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
# CMD ["bwa-spades"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

