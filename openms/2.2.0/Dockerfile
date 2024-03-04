################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="6"
LABEL software="OpenMS"
LABEL software.version="2.2.0"
LABEL about.summary="C++ libraries ans tools for MS/MS data analysis"
LABEL about.home="http://www.openms.org/"
LABEL about.documentation="http://ftp.mi.fu-berlin.de/pub/OpenMS/release2.2.0-about.documentation/html/index.html"
LABEL about.license_file="https://github.com/OpenMS/OpenMS/blob/develop/LICENSE"
LABEL about.license="SPDX:BSD-1-Clause"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="openms"

################## MAINTAINER ######################
MAINTAINER Hannes Rost <hannes.rost@utoronto.ca>

USER root

# install build dependencies: boost
RUN      apt-get -y update && \
         apt-get -y install -y apt-utils && \
         apt-get install -y --no-install-recommends --no-install-suggests libboost-date-time1.58.0 \
                                 libboost-iostreams1.58.0 \
                                 libboost-regex1.58.0 \
                                 libboost-math1.58.0 \
                                 libboost-random1.58.0 && \
         apt-get -y install sudo && \
         apt-get -y clean && \
         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install build dependencies: libsvm, zlib, glpk, xerces
RUN      apt-get -y update && \
         apt-get install -y --no-install-recommends --no-install-suggests zlib1g libbz2-1.0 && \
         apt-get install -y --no-install-recommends --no-install-suggests libsvm3 zlib1g libxerces-c3.1 libbz2-1.0 libglpk36 && \
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

#giving access to non_Root_user without creating a header folder such as ".config"

RUN      apt-get -y update && \
         echo "ALL     ALL=NOPASSWD:  ALL" >> /etc/sudoers && \
         echo '#!/bin/sh\nsudo -E -H -u root FileInfo "$@"' > /usr/local/bin/FileInfo_anyuser && \
         chmod ugo+rx /usr/local/bin/FileInfo* && \
         echo '#!/bin/sh\nsudo -E -H -u root FileConverter "$@"' > /usr/local/bin/FileConverter_anyuser && \
         chmod ugo+rx /usr/local/bin/FileConverter* && \
         /sbin/ldconfig -v && \
         apt-get clean && \
         apt-get purge && \
         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

#################### END INSTALLATION #########################

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1
