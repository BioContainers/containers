
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="velvet"
LABEL software.version="1.2.10"
LABEL description="Short read de novo assembler using de Bruijn graphs"
LABEL website="http://www.ebi.ac.uk/~zerbino/velvet/ | https://github.com/dzerbino/velvet"
LABEL documentation="https://www.zfmk.de/dateien/atoms/files/aliscore_v.2.0_manual_0.pdf"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL tags="Genomics"

ENV ZIP=velvet_1.2.10.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/velvet/
ENV FOLDER=velvet_1.2.10
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    cp $DST/$FOLDER/velvet* $DST && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["velvetg"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

