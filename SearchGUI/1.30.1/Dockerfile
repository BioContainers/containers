#################################################################
# Dockerfile
#
# Version:          1
# Software:         SearchGUI
# Software Version: 1.30.1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/searchgui 1.30.1/.
# Pull Cmd:         docker pull biodckr/searchgui
# Run Cmd:          docker run --rm biodckr/searchgui
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER biodocker

RUN GZ=SearchGUI-1.30.1-mac_and_linux.tar.gz && \
    wget http://genesis.ugent.be/maven2/eu/isas/searchgui/SearchGUI/1.30.1/$GZ -O /tmp/$GZ && \
    tar axvf /tmp/$GZ -C /home/biodocker/bin/ && \
    rm /tmp/$GZ && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/SearchGUI-1.30.1/SearchGUI-1.30.1.jar $@"' > /home/biodocker/bin/SearchGUI && \
    chmod +x /home/biodocker/bin/SearchGUI

WORKDIR /data

CMD ["SearchGUI"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
