############################# Dockerfile ####################################
FROM biocontainers/biocontainers:latest

############################# METADATA ######################################

LABEL    software="allcatchr" \
    base_image="biocontainers:latest" \
    container="allcatchr" \
    about.summary="The gene expression classifier ALLCatchR identifies B-precursor ALL subtypes and underlying developmental trajectories" \
    about.home="https://github.com/ThomasBeder/ALLCatchR" \
    software.version="1.0.0" \
    version="1" \
    extra.identifiers.biotools="allcatchr" \
    about.copyright="2022, Thomas Beder" \
    about.license="MIT" \
    about.license_file="https://github.com/ThomasBeder/ALLCatchR/blob/main/LICENSE.txt" \
    maintainer="Nadine Wolgast <NadineWolgast@gmx.de.br>"\

################## BEGIN INSTALLATION ######################

# Change user to root
USER root
ENV ZIP=ALLCatchR-main.zip
ENV URL=https://github.com/ThomasBeder/ALLCatchR.git
ENV FOLDER=allcatchr-1.0.0
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    ./configure && \
    make && \
    make install && \
    cp /usr/local/lib/ALLCatchR-1.0* /lib/x86_64-linux-gnu/ && \
    cd / && \
    rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
# CMD ["allcatchr"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Nadine Wolgast <NadineWolgast@gmx.de>

