################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="ssaha2"
LABEL software.version="2.5.5"
LABEL about.summary="SSAHA2 maps DNA sequencing reads onto a genomic reference sequence using a combination of word hashing and dynamic programming"
LABEL about.home="http://www.sanger.ac.uk/science/tools/ssaha2-0"
LABEL about.documentation="http://www.sanger.ac.uk/science/tools/ssaha2-0"
LABEL about.license_file="http://www.sanger.ac.uk/science/tools/ssaha2-0"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="SSAHA2"
LABEL about.tags="Genomics"
LABEL extra.binaries="ssaha2"

################## MAINTAINER ######################

MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

USER biodocker

RUN ZIP=ssaha2_v2.5.5_x86_64.tgz && \
  wget ftp://ftp.sanger.ac.uk/pub/resources/software/ssaha2/ssaha2_v2.5.5_x86_64.tgz -O /tmp/$ZIP && \
  ls -la /tmp/$ZIP && mkdir -p /home/biodocker/bin/ssaha2/ && \
  tar -zxvf /tmp/$ZIP -C /home/biodocker/bin/ssaha2/  && \
  mv /home/biodocker/bin/ssaha2/ssaha2_v2.5.5_x86_64/* /home/biodocker/bin/ssaha2/ && \
  rm -r /home/biodocker/bin/ssaha2/ssaha2_v2.5.5_x86_64/ && \
  ls -la /home/biodocker/bin/ssaha2/ && \
  chmod -R 755 /home/biodocker/bin/ssaha2/* && rm -r /tmp/$ZIP

ENV PATH /home/biodocker/bin/ssaha2:$PATH

WORKDIR /data/

# CMD ["ssaha2"]
