FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="snpeff"
LABEL software.version="4.1k"
LABEL about.summary="Genetic variant annotation and effect prediction toolbox"
LABEL about.home="http://snpeff.sourceforge.net/"
LABEL about.documentation="http://snpeff.sourceforge.net/"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="snpeff"
LABEL extra.binaries="snpeff"


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
# CMD ["snpeff"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

