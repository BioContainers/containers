################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="allcatchr"
LABEL software.version="1.0.0"
LABEL about.summary="Gene expression classifier to identify B-precursor ALL subtypes and underlying developmental trajectories"
LABEL about.home="https://github.com/ThomasBeder/ALLCatchR"
LABEL about.documentation="https://github.com/ThomasBeder/ALLCatchR"
LABEL about.license_file="https://github.com/ThomasBeder/ALLCatchR/blob/main/LICENSE.txt"
LABEL about.license="MIT"
LABEL extra.identifiers.biotools="allcatchr"
LABEL about.tags="Transcriptomics"


################## MAINTAINER ######################

MAINTAINER Nadine Wolgast <NadineWolgast@gmx.de>

################## INSTALLATION ######################

USER biodocker
ENV ZIP=main.zip
ENV URL=https://github.com/ThomasBeder/ALLCatchR/archive/refs/heads/
ENV FOLDER=ALLCatchR-main
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    R -e "devtools::install_github('ThomasBeder/ALLCatchR')" && \
    cd / && \
    rm -rf $DST/$FOLDER

WORKDIR /data/




