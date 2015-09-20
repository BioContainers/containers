#################################################################
# Dockerfile
#
# Version:          1
# Software:         Clustal-omega
# Software Version: 1.2.1-1
# Base Image:       biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/clustalo 1.2.1-1/.
# Pull Cmd:         docker pull biodckr/clustalo
# Run Cmd:          docker run --rm biodckr/clustalo
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

USER root

# Install Clustalo
RUN apt-get update && apt-get install -y clustalo

USER biodocker

CMD ["clustalo", "--help"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
