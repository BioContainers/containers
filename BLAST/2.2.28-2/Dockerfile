#################################################################
# Dockerfile
#
# Version:          1
# Software:         NCBI BLAST+
# Software Version: 2.2.28-2
# Description:      basic local alignment search tool
# Website:          http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download
# Tags:             Genomics|Protemomics|Transcriptomics|General
# Provides:         blast 2.2.28-2
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/ncbi-blast 2.2.28-2/.
# Pull Cmd:         docker pull biodckr/ncbi-blast
# Run Cmd:          docker run --rm biodckr/ncbi-blast <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

USER root

# Install BLAST toolkit
RUN apt-get update && \
    apt-get install -y \
      ncbi-blast+=2.2.28-2 && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

CMD ["blastn", "-help"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
