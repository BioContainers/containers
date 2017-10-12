FROM biocontainers/biocontainers:08252016-4

LABEL base.image="biocontainers:08252016-4"
LABEL version="0.1"
LABEL software="progressiveCactus"
LABEL software.version="08092017"
LABEL description="multiple whole-genome alignment package"
LABEL website="https://github.com/glennhickey/progressiveCactus"
LABEL documentation="https://github.com/glennhickey/progressiveCactus"
LABEL license="https://github.com/glennhickey/progressiveCactus/blob/master/LICENSE"
LABEL tags="genomics"

MAINTAINER Ricky Lim <rlim.email@gmail.com>

WORKDIR /home/biodocker/bin

# Download and checkout the source code
RUN git clone git://github.com/glennhickey/progressiveCactus.git && \
    cd progressiveCactus && \
    git checkout tags/0.1 -b 0.1

WORKDIR /home/biodocker/bin/progressiveCactus

RUN git submodule update --init

# Build the source code
USER root

RUN ln -s /usr/lib/python2.7/plat-*/_sysconfigdata_nd.py /usr/lib/python2.7/ && \
    pip install --upgrade virtualenv && \
    make

USER biodocker

RUN /bin/bash -c "source environment"

ENV PATH /home/biodocker/bin/progressiveCactus/bin:$PATH

WORKDIR /data/

CMD ["runProgressiveCactus.sh", "-h"]
