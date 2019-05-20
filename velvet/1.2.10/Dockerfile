
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="velvet"
LABEL software.version="1.2.10"
LABEL about.summary="Short read de novo assembler using de Bruijn graphs"
LABEL about.home="http://www.ebi.ac.uk/~zerbino/velvet/ | https://github.com/dzerbino/velvet"
LABEL about.documentation="https://www.zfmk.de/dateien/atoms/files/aliscore_v.2.0_manual_0.pdf"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="velvet"
LABEL extra.binaries="velvetg"

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
# CMD ["velvetg"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

