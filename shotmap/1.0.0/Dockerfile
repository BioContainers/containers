################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="shotmap"
LABEL software.version="1.0.0"
LABEL about.summary="A Shotgun Metagenome Annotation Pipeline"
LABEL about.home="https://github.com/sharpton/shotmap"
LABEL about.documentation="https://github.com/sharpton/shotmap"
LABEL about.license_file="https://github.com/sharpton/shotmap/blob/master/LICENSE"
LABEL about.license="SPDX:GPL-3"
LABEL about.tags="Metagenomics"

################## MAINTAINER ######################
MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

USER biodocker

RUN ZIP=1.0.zip && \
  wget https://github.com/sharpton/shotmap/archive/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/shotmap/ && \
  chmod -R 755 /home/biodocker/bin/shotmap/* && \
  rm /tmp/$ZIP

RUN mv /home/biodocker/bin/shotmap/shotmap-1.0/* /home/biodocker/bin/shotmap/ && \
    rm -r /home/biodocker/bin/shotmap/shotmap-1.0/

ENV PATH /home/biodocker/bin/shotmap:$PATH

WORKDIR /data/

CMD ["shotmap"]
