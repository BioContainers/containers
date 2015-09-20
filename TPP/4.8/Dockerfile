#################################################################
# Dockerfile
#
# Version:          1
# Software:         TPP
# Software Version: 4.8
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/tpp 4.8/.
# Pull Cmd:         docker pull biodckr/tpp
# Run Cmd:          docker run --rm biodckr/tpp
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

RUN ZIP=tpp-4.8.0.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/TPP/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    ln -vs /home/biodocker/bin/tpp/bin/* /home/biodocker/bin/    

#    bash -c 'echo -e "#!/bin/bash\n/home/biodocker/bin/tpp_src/" > /home/biodocker/bin/tpp' && \
#    chmod +x /home/biodocker/bin/tpp

WORKDIR /data

CMD ["tandem"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
