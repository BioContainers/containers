FROM ubuntu:14.04 as build

ARG VERSION=0.0.0

RUN apt-get update && apt-get -y install \
        build-essential \
        python \
        git \
        python-dev \
        wget

WORKDIR /tmp

# Download the source code
RUN git config --global url."https://".insteadOf git:// && \
    git clone git://github.com/glennhickey/progressiveCactus.git && \
    cd progressiveCactus && \
    git pull && \
    git submodule update --init

RUN cd progressiveCactus && make

LABEL base.image="ubuntu:14.04"
LABEL version="0.0.0"
LABEL software="progressiveCactus"
LABEL description="whole-genome alignment package"
LABEL website="https://github.com/glennhickey/progressiveCactus"
LABEL documentation="https://github.com/glennhickey/progressiveCactus"
LABEL license="https://github.com/glennhickey/progressiveCactus/blob/master/LICENSE"
LABEL tags="genomics"

RUN /bin/bash -c "source progressiveCactus/environment"

CMD ["bash", "progressiveCactus/bin/runProgressiveCactus.sh", "-h"]
