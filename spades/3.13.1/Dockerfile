FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="1"
LABEL software="spades"
LABEL software.version="3.13.1"
LABEL about.summary="Tools (written in C using htslib) for manipulating next-generation sequencing data"
LABEL about.home="http://cab.spbu.ru/software/spades/"
LABEL about.documentation="http://cab.spbu.ru/software/spades/"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="Spades"


################## BEGIN INSTALLATION ######################

ENV ZIP=SPAdes-3.13.1-Linux.tar.gz
ENV URL=http://cab.spbu.ru/files/release3.13.1
ENV FOLDER=SPAdes-3.13.1-Linux
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mv $DST/$FOLDER/bin/* /home/biodocker/bin && \
    mv $DST/$FOLDER/share /home/biodocker && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
# CMD ["spades-bwa"]

##################### INSTALLATION END #####################

MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

