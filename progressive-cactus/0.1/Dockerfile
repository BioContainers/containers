FROM biocontainers/biocontainers:08252016-4

LABEL base.image="biocontainers:08252016-4"
LABEL version="1"
LABEL software="progressiveCactus"
LABEL software.version="0.1"
LABEL description="multiple whole-genome alignment package"
LABEL website="https://github.com/glennhickey/progressiveCactus"
LABEL documentation="https://github.com/glennhickey/progressiveCactus"
LABEL license="GPL-3.0"
LABEL license_file="https://github.com/glennhickey/progressiveCactus/blob/master/LICENSE"
LABEL tags="genomics"

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
    git checkout tags/0.1 -b 0.1 && \
    git submodule update --init

WORKDIR /home/biodocker/bin/progressiveCactus

RUN make

ENV PATH /home/biodocker/bin/progressiveCactus/bin:$PATH

WORKDIR /data/

CMD ["runProgressiveCactus.sh", "-h"]

