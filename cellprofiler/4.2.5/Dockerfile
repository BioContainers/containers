FROM ubuntu:20.04

LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="CellProfiler"
LABEL software.version="4.2.5"
LABEL about.summary="cell image analylsis software"
LABEL about.home="https://cellprofiler.org"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/CellProfiler/CellProfiler/blob/main/LICENSE"
LABEL about.documentation="https://cellprofiler.org/getting-started"
LABEL extra.identifiers.biotools=CellProfiler


MAINTAINER Yi Sun <sunyi000@gmail.com>


ARG DEBIAN_FRONTEND="noninteractive"
ARG CELLPROFILER_VERSION="4.2.5"

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8 \
    LANGUAGE en_US:en  \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update -qq && \
    apt-get install -y -q --no-install-recommends \
	    locales \
            tzdata \
            apt-utils \
            make \
            gcc \
            build-essential \
            libgtk-3-dev \
            python3-dev \
            wget \
            python3-pip \
            openjdk-8-jdk-headless \
            default-libmysqlclient-dev \
            libnotify-dev \
            libsdl2-dev  && \            
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

RUN pip3 install -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-20.04 wxPython==4.1.0

RUN pip3 install numpy wheel cython attrdict && \
    pip3 install CellProfiler==$CELLPROFILER_VERSION

#ENTRYPOINT ["cellprofiler"]



