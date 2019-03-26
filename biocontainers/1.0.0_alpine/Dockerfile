# Base image
FROM alpine:3.9.2

################## METADATA ######################
LABEL base_image="alpine:3.9.2"
LABEL version="1"
LABEL software="biocontainers"
LABEL software.version="1.0.0_alpine"
LABEL about.summary="Base image for BioContainers based on Alpine Linux"
LABEL about.home="http://biocontainers.pro"
LABEL about.documentation="https://github.com/BioContainers/specs/wiki"
LABEL about.license_file="https://github.com/BioContainers/containers/blob/master/LICENSE"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Genomics,Proteomics,Transcriptomics,General,Metabolomics"

################## MAINTAINER ######################
LABEL maintainer="Giacomo Tartari<giacomo.tartari@gmail.com>"

RUN addgroup -S biodocker && adduser -S biodocker -G biodocker

USER biodocker

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/sh"]

WORKDIR /data
