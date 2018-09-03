# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:08252016-4"
LABEL version="1"
LABEL software="PIA - Protein Inference Algorithms"
LABEL software.version="1.3.0"
LABEL description="Compile PIA XML files and run analysis pipelines for protein inference with this image"
LABEL website="https://github.com/mpc-bioinformatics/pia"
LABEL documentation="https://github.com/julianu/pia-tutorial"
LABEL license="https://github.com/mpc-bioinformatics/pia"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Julian Uszkoreit <julian.uszkoreit@rub.de>

ENV ZIP_FILE pia-1.3.0.zip
ENV URL https://github.com/mpc-bioinformatics/pia/releases/download/1.3.0
ENV USER_HOME /home/biodocker
ENV PIA_PATH /home/biodocker/pia
ENV PIA_JAR $PIA_PATH/pia-1.3.0.jar

USER biodocker

RUN set -x \
  && wget $URL/$ZIP_FILE -O $USER_HOME/$ZIP_FILE \
  && unzip $USER_HOME/$ZIP_FILE -d $PIA_PATH \
  && rm $USER_HOME/$ZIP_FILE

COPY ./runpia.sh $USER_HOME/bin/

WORKDIR /data/

ENTRYPOINT ["runpia.sh"]
