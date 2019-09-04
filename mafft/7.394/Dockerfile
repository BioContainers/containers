################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="mafft"
LABEL software.version="7.394"
LABEL about.summary="Multiple alignment program for amino acid or nucleotide sequences"
LABEL about.home="https://mafft.cbrc.jp/alignment/software/source.html"
LABEL about.documentation="https://mafft.cbrc.jp/alignment/software/source.html"
LABEL about.license_file="https://mafft.cbrc.jp/alignment/software/license.txt"
LABEL about.license="SPDX:Custom"
LABEL extra.identifiers.biotools="MAFFT_CBRC"
LABEL about.tags="Genomics"
LABEL extra.binarie="mafft"

################## MAINTAINER ######################

MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

USER biodocker

RUN ZIP=mafft-7.394-with-extensions-src.tgz && \
  wget https://mafft.cbrc.jp/alignment/software/$ZIP -O /tmp/$ZIP && \
  cd /tmp/ && tar xfv $ZIP


RUN mkdir -p /home/biodocker/bin/mafft/ && \
    cp -r /tmp/mafft-7.394-with-extensions/* /home/biodocker/bin/mafft/ && \
    rm -r /tmp/*


RUN cd /home/biodocker/bin/mafft/core/ && \
    make clean && make

RUN cd /home/biodocker/bin/mafft/extensions/ && \
    make clean && make

ENV PATH /home/biodocker/bin/mafft/core:$PATH
ENV PATH /home/biodocker/bin/mafft/extensions:$PATH

WORKDIR /data/

# CMD ["mafft"]
