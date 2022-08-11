################## BASE IMAGE ######################
FROM ubuntu:20.04
################## METADATA ######################
LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="bamdst"
LABEL software.version="1.0.9"
LABEL about.summary="bamdst - a BAM Depth Stat Tool"
LABEL about.home="https://github.com/shiquan/bamdst"
LABEL about.documentation="https://github.com/shiquan/bamdst#readme"
LABEL about.license_file="https://github.com/shiquan/bamdst/blob/master/LICENSE"
LABEL about.license="MIT"
LABEL about.tags="Genomics"

################## INSTALLATION ######################
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  git \
  libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev \
  perl \
  wget \
  && cd /usr/local/bin \
  && apt-get clean && apt-get purge \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/shiquan/bamdst.git && \
    cd bamdst && \
    make && \
    cp bamdst  /usr/local/bin/

RUN wget -qO- \
    https://github.com/shenwei356/csvtk/releases/download/v0.24.0/csvtk_linux_amd64.tar.gz \
    | tar -xz     && \
    cp csvtk /usr/local/bin/

WORKDIR /data/
