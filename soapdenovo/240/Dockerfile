################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="soapdenovo"
LABEL software.version="240"
LABEL about.summary="a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes"
LABEL about.home="http://soap.genomics.org.cn/soapdenovo.html"
LABEL about.documentation="http://soap.genomics.org.cn/soapdenovo.html"
LABEL license="http://soap.genomics.org.cn/soapdenovo.html"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

ENV ZIP=SOAPdenovo2-bin-LINUX-generic-r240.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/soapdenovo
ENV FOLDER=SOAPdenovo2-bin-LINUX-generic-r240
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  mv $DST/$FOLDER/SOAPdenovo* /home/biodocker/bin && \
  cd / && \
  rm -rf $DST/$FOLDER

WORKDIR /data/
