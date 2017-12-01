################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="2.2"
LABEL software="OpenMS"
LABEL software.version="2.2"
LABEL description="C++ libraries ans tools for MS/MS data analysis"
LABEL website="http://www.openms.org/"
LABEL documentation="http://ftp.mi.fu-berlin.de/pub/OpenMS/release2.2.0-documentation/html/index.html"
LABEL license="http://www.openms.org/"
LABEL tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Hannes Rost <hannes.rost@utoronto.ca>

USER root

# install build dependencies: boost
RUN      apt-get -y update && \
         apt-get install -y --no-install-recommends --no-install-suggests libboost-date-time1.58.0 \
                                 libboost-iostreams1.58.0 \
                                 libboost-regex1.58.0 \
                                 libboost-math1.58.0 \
                                 libboost-random1.58.0 && \
         apt-get clean && \
         apt-get purge && \
         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install build dependencies: libsvm, zlib, glpk, xerces
RUN      apt-get -y update && \
         apt-get install -y --no-install-recommends --no-install-suggests zlib1g libbz2-1.0 && \
         apt-get install -y --no-install-recommends --no-install-suggests libsvm3 zlib1g libxerces-c3.1 libbz2-1.0 libglpk36 && \
         apt-get clean && \
         apt-get purge && \
         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install build dependencies: qt
RUN      apt-get -y update && \
         apt-get install -y --no-install-recommends --no-install-suggests libqtcore4 libqt4-network && \
         apt-get install -y --no-install-recommends --no-install-suggests libqt4-opengl libqt4-svg && \
         apt-get install -y --no-install-recommends --no-install-suggests libqtwebkit4  && \
         apt-get clean && \
         apt-get purge && \
         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/local/
RUN wget https://github.com/Roestlab/containers/releases/download/openms2.2.0/openms2.2.0.zip && unzip openms2.2.0.zip && rm openms2.2.0.zip

ENV PATH /usr/local/bin/:$PATH
ENV LD_LIBRARY_PATH /usr/local/lib/:$LD_LIBRARY_PATH

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

#################### END INSTALLATION #########################

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

