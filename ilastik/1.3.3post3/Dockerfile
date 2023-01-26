FROM ubuntu:22.04 

LABEL base_image="ubuntu:22.04"
LABEL version="1"
LABEL software="ilastik"
LABEL software.version="1.3.3post3"
LABEL about.summary="the interactive learning and segmentation toolkit"
LABEL about.home="https://ilastik.org"
LABEL about.license="GPL-2.0-or-later"
LABEL about.license_file="https://github.com/ilastik/ilastik/blob/main/LICENSE"
LABEL about.documentation="https://ilastik.org/documentation/index.html"
LABEL extra.identifiers.biotools=ilastik


MAINTAINER Yi Sun <sunyi000@gmail.com>


ARG DEBIAN_FRONTEND="noninteractive"
ARG ILASTIK_VERSION="1.3.3post3"

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US:en  \
    NUMBA_CACHE_DIR=/tmp/numba_cache \
    BIOIMAGEIO_CACHE_PATH="/tmp/pybio_cache" \
    PATH="/opt/ilastik-$ILASTIK_VERSION-Linux:$PATH"
    


RUN apt-get update -qq && \
    apt-get install -y  \
            apt-utils \
            locales \
            build-essential \
            libglu1-mesa-dev \
            qtcreator \
            libgl1-mesa-glx \
            nautilus \
            xdg-utils \
            wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

WORKDIR /opt/
RUN wget https://files.ilastik.org/ilastik-1.3.3post3-Linux.tar.bz2 && \
    tar xjf ilastik-1.*-Linux.tar.bz2


#ENTRYPOINT["run_ilastik.sh"]
