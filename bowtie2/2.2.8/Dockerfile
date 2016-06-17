#################################################################
# Dockerfile
#
# Version:          2
# Software:         bowtie2
# Software Version: 2.2.8
# Description:      An ultrafast memory-efficient short read aligner
# Website:          http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
# Tags:             Genomics
# Provides:         bowtie2 2.2.8
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/bowtie2 2.2.8/.
# Pull Cmd:         docker pull biodckr/bowtie2
# Run Cmd:          docker run --rm -it biodckr/bowtie2
#################################################################

# Source Image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install bowtie2=2.2.8

# Change workdir to /data/
WORKDIR /data/

# Define default command
CMD ["bowtie2"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
