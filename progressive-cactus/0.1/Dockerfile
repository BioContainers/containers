FROM biocontainers/biocontainers:08252016-4

LABEL base_image="biocontainers:08252016-4"
LABEL version="2"
LABEL software="progressiveCactus"
LABEL software.version="0.1"
LABEL about.summary="multiple whole-genome alignment package"
LABEL about.home="https://github.com/glennhickey/progressiveCactus"
LABEL about.documentation="https://github.com/glennhickey/progressiveCactus"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.license_file="https://github.com/glennhickey/progressiveCactus/blob/master/LICENSE"
LABEL about.tags="Genomics"
LABEL extra.binaries="runProgressiveCactus.sh"

MAINTAINER Ricky Lim <rlim.email@gmail.com>

WORKDIR /home/biodocker/bin

USER root

RUN apt-get update && \
    apt-get install -y iputils-ping time && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/lib/python2.7/plat-*/_sysconfigdata_nd.py /usr/lib/python2.7/

USER biodocker

RUN git clone git://github.com/glennhickey/progressiveCactus.git && \
    cd progressiveCactus && \
    git checkout about.tags/0.1 -b 0.1 && \
    git submodule update --init

WORKDIR /home/biodocker/bin/progressiveCactus

RUN make

ENV PATH /home/biodocker/bin/progressiveCactus/bin:$PATH

WORKDIR /data/

# CMD ["runProgressiveCactus.sh", "-h"]

