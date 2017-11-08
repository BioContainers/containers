

FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="spades"
LABEL software.version="3.6.0"
LABEL description="Tools (written in C using htslib) for manipulating next-generation sequencing data"
LABEL website="http://bioinf.spbau.ru/spades"
LABEL documentation="http://bioinf.spbau.ru/spades"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL tags="Genomics"

# Set the base image to Ubuntu
FROM biodckr/biodocker

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
CMD ["bwa-spades"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

