FROM debian:buster-backports

LABEL base.image="debian:buster-backports"
LABEL version=2
LABEL software="Biocontainers debian based image"
LABEL software.version="debian-buster-backports"
LABEL about.summary="Base image for BioDocker"
LABEL about.home="http://biocontainers.pro"
LABEL about.documentation="https://github.com/BioContainers/specs/wiki"
LABEL about.license_file="https://github.com/BioContainers/containers/blob/master/LICENSE"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Genomics,Proteomics,Transcriptomics,General,Metabolomics"

MAINTAINER Mateo Boudet <mateo.boudet@irisa.fr>

ENV DEBIAN_FRONTEND noninteractive
RUN mkdir /data /config

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Add user biodocker with password biodocker
RUN groupadd fuse && \
    useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

# Change user
USER biodocker

ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

RUN mkdir /home/biodocker/bin

VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

WORKDIR /data
