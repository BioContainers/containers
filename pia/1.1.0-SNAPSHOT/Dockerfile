################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="PIA - Protein Inference Algorithms"
LABEL software.version="1.1.0-SNAPSHOT"
LABEL about.summary="Compile PIA XML files and run pipelines with this image"
LABEL about.home="https://github.com/mpc-bioinformatics/pia"
LABEL about.documentation="https://github.com/mpc-bioinformatics/pia"
LABEL about.license_file="https://github.com/mpc-bioinformatics/pia"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="pia"

################## MAINTAINER ######################
MAINTAINER Julian Uszkoreit <julian.uszkoreit@rub.de>

ENV ZIP_FILE 1.1.0-SNAPSHOT.zip
ENV URL https://github.com/mpc-bioinformatics/pia/archive
ENV USER_HOME /home/biodocker
ENV PIA_PATH /home/biodocker/pia
ENV PIA_JAR $PIA_PATH/pia-1.1.0-SNAPSHOT.jar

RUN set -x \
  && wget $URL/$ZIP_FILE -O $USER_HOME/$ZIP_FILE \
  && unzip $USER_HOME/$ZIP_FILE -d $PIA_PATH \
  && rm $USER_HOME/$ZIP_FILE

USER biodocker

COPY ./runpia.sh $HOME/bin

WORKDIR /data/

ENTRYPOINT ["runpia.sh"]
