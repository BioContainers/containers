FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="soapec"
LABEL software.version="2.03"
LABEL about.summary="A correction tool for SOAPdenovo"
LABEL about.home="http://soap.genomics.org.cn/soapdenovo.html"
LABEL about.documentation="http://soap.genomics.org.cn/soapdenovo.html"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.binaries="Corrector_HA"

################## BEGIN INSTALLATION ######################

ENV ZIP=SOAPec_bin_v2.03.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/soapec
ENV FOLDER=SOAPec_bin_v2.03
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mv $DST/$FOLDER/bin/* /home/biodocker/bin && \
    cd / && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
# CMD ["Corrector_HA"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

