FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="snpeff"
LABEL software.version="4.1"
LABEL description="Genetic variant annotation and effect prediction toolbox"
LABEL website="http://snpeff.sourceforge.net/"
LABEL documentation="http://snpeff.sourceforge.net/"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL tags="Genomics"


################## INSTALLATION ######################

ENV ZIP=snpEff_v4_1k_core.zip
ENV URL=https://github.com/BioDocker/software-archive/releases/download/snpEff
ENV FOLDER=snpEff
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST/$FOLDER'/snpEff.jar  \$@" > '$DST'/snpeff' && \
    chmod +x $DST/snpeff && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST/$FOLDER'/SnpSift.jar \$@" > '$DST'/snpsift' && \
    chmod +x $DST/snpsift

ENV PATH=$PATH:/home/biodocker/bin/snpEff/scripts:/home/biodocker/bin/snpEff/scripts/gsa

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["snpeff"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

