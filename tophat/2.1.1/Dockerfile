FROM biocontainers/"biocontainers:latest

################################### METADATA ######################  ######################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="tophat"
LABEL software.version="2.1.1"
LABEL about.summary="TopHat is a fast splice junction mapper for RNA-Seq reads"
LABEL about.home="https://ccb.jhu.edu/software/tophat/index.shtml"
LABEL about.documentation="https://ccb.jhu.edu/software/tophat/index.shtml"
LABEL about.license_file="https://opensource.org/licenses/Artistic-2.0"
LABEL about.license="SPDX:Artistic-2.0"
LABEL about.tags="Genomics, Transcriptomics"

################## BEGIN INSTALLATION ######################

ENV TAR=tophat-2.1.1.Linux_x86_64.tar.gz
ENV URL=https://ccb.jhu.edu/software/tophat/downloads/
ENV FOLDER=tophat-2.1.1.Linux_x86_64
ENV DST=/home/biodocker/bin

RUN wget $URL/$TAR -O $DST/$TAR && \
    tar xzfv $DST/$TAR && \
    rm $DST/$TAR && \
    mv $FOLDER/* $DST && \
    rmdir $FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["tophat"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>


