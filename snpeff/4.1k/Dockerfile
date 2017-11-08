#################################################################
# Dockerfile
#
# Version:          1
# Software:         snpeff
# Software Version: 4.1k
# Description:      Genetic variant annotation and effect prediction toolbox
# Website:          http://sourceforge.net/projects/snpeff/|http://snpeff.sourceforge.net/
# Tags:             Genomics
# Provides:         snpeff 4.1k
################## BASE IMAGE ###################### :       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/snpeff 4.1k/.
# Pull Cmd:         docker pull biodckrdev/snpeff
# Run Cmd:          docker run --rm -it biodckrdev/snpeff <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

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

