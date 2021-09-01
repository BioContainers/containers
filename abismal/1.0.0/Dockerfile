################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL version="1"
LABEL software="abismal"
LABEL software.version="1.0.0"
LABEL about.summary="abismal is a fast and memory-efficient mapper for short whole genome bisulfite sequencing reads"
LABEL about.home="http://smithlabcode.github.io/abismal"
LABEL about.documentation="http://smithlabcode.github.io/abismal"
LABEL about.license_file="http://smithlabcode.github.io/abismal"
LABEL about.license="GPL 3.0"
LABEL extra.identifiers.biotools="abismal"
LABEL about.tags="Genomics"
LABEL extra.binaries="abismal"

################## MAINTAINER ######################
MAINTAINER Guilherme Sena <desenabr@usc.edu>

################## INSTALLATION ######################
ENV ZIP=abismal-1.0.0zip
ENV URL=https://github.com/smithlabcode/abismal/releases/download/v1.0.0
ENV FOLDER=abismal-1.0.0-linux-x86_64
ENV DST=/home/biodocker/bin
ENV ULOCAL=/usr/local/bin

USER 0

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

RUN apt update
RUN apt install python3 -y

RUN ln -s $DST/* $ULOCAL/

USER biodocker

WORKDIR /data

# CMD ["abismal"]
