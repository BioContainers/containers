#################################################################
# Dockerfile
#
# Version:          1
# Software:         soapec
# Software Version: 2.03
# Description:      a correction tool for SOAPdenovo
# Website:          http://soap.genomics.org.cn/soapdenovo.html
# Tags:             Genomics
# Provides:         soapec 2.03
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/soapec 2.03/.
# Pull Cmd:         docker pull biodckrdev/soapec
# Run Cmd:          docker run --rm -it biodckrdev/soapec <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

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

