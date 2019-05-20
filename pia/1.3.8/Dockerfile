# Base Image
FROM biocontainers/biocontainers:08252016-4

# Metadata
LABEL base.image="biocontainers:08252016-4" \
  version="2" \
  software="PIA - Protein Inference Algorithms" \
  software.version="1.3.8" \
  about.summary="Compile PIA XML files and run analysis pipelines for protein inference with this image" \
  about.home="https://github.com/mpc-bioinformatics/pia" \
  about.documentation="https://github.com/julianu/pia-tutorial" \
  about.copyright="Ruhr-Universitaet Bochum, Medizinisches Proteom-Center, 2013-2018" \
  about.license="three-clause BSD license" \
  about.license_file="https://raw.githubusercontent.com/mpc-bioinformatics/pia/master/LICENSE" \
  extra.identifiers.biotools="pia" \
  extra.binaries="runpia.sh"
  about.tags="Proteomics"

# Maintainer
MAINTAINER Julian Uszkoreit <julian.uszkoreit@rub.de>

ENV ZIP_FILE=pia-1.3.8.zip \
  URL=https://github.com/mpc-bioinformatics/pia/releases/download/1.3.8 \
  USER_HOME=/home/biodocker \
  PIA_PATH=/home/biodocker/pia \
  PIA_JAR=/home/biodocker/pia/pia-1.3.8.jar

USER root
COPY ./runpia.sh $USER_HOME/bin/
RUN chmod +x $USER_HOME/bin/runpia.sh

USER biodocker

RUN set -x \
  && wget $URL/$ZIP_FILE -O $USER_HOME/$ZIP_FILE \
  && unzip $USER_HOME/$ZIP_FILE -d $PIA_PATH \
  && rm $USER_HOME/$ZIP_FILE

WORKDIR /data/

# ENTRYPOINT ["runpia.sh"]
