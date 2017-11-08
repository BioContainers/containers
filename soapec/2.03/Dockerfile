FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="soapec"
LABEL software.version="2.03"
LABEL description="A correction tool for SOAPdenovo"
LABEL website="http://soap.genomics.org.cn/soapdenovo.html"
LABEL documentation="http://soap.genomics.org.cn/soapdenovo.html"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL tags="Genomics"


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
CMD ["Corrector_HA"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

