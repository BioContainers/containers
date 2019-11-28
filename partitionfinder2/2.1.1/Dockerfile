################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="partitionfinder2"
LABEL software.version="2.1.1"
LABEL about.summary="PartitionFinder 2: program for simultaneously choosing partitioning schemes and models of molecular evolution for phylogenetic analyses of DNA, protein, and morphological data"
LABEL about.home="https://github.com/brettc/partitionfinder"
LABEL about.documentation="https://github.com/brettc/partitionfinder/blob/master/docs/Manual_v2.1.x.pdf"
LABEL about.license_file="https://github.com/brettc/partitionfinder/blob/master/LICENSE"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.binaries="partitionfinder2"

################## MAINTAINER ######################

MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

USER root

# apt update and install global requirements
RUN apt-get clean all && apt-get update && apt-get upgrade -y && apt-get install -y python2.7 python-dev && \
        apt-get clean && \
        apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp/ && curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python2.7 get-pip.py && \
    rm /tmp/get-pip.py

RUN pip install pandas numpy pyparsing scipy sklearn tables

USER biodocker

RUN ZIP=v2.1.1.zip && \
    wget https://github.com/brettc/partitionfinder/archive/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/partitionfinder2/ && \
    mv /home/biodocker/bin/partitionfinder2/partitionfinder-2.1.1/* /home/biodocker/bin/partitionfinder2/ && \
    rm -r /home/biodocker/bin/partitionfinder2/partitionfinder-2.1.1/ && \
    rm /tmp/$ZIP

RUN chmod +x /home/biodocker/bin/partitionfinder2/*.py

ENV PATH /home/biodocker/bin/partitionfinder2:$PATH

WORKDIR /data/

# CMD ["partitionfinder2"]
