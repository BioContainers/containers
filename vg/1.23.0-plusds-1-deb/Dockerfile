# Base Image
FROM debian:bullseye-20200327-slim

## The Debian package is compiled for multiple levels of SIMD, so it will use
## the highest level of SIMD available on the system running this container

# Metadata
LABEL base_image="debian:testing"
LABEL version="1"
LABEL software="vg"
LABEL software.version="1.23.0-plusds-1-deb"
LABEL about.summary="tools for working with genome variation graphs"
LABEL about.home="https://github.com/vgteam/vg#vg"
LABEL about.documentation="https://vgteam.github.io/vg/"
LABEL about.license="SPDX:MIT"
LABEL about.license_file="/usr/share/doc/vg/copyright"

# Maintainer
MAINTAINER Michael R. Crusoe <michael.crusoe@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  vg=1.23.0+ds-1
