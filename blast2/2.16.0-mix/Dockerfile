FROM ubuntu:22.04
ARG version=2.16.0

LABEL maintainer="sebastian@toyoko.io"

USER root

RUN mkdir -p /blast/blastdb /blast/blastdb_custom
WORKDIR /blast


RUN if [ $(uname -m) = x86_64 ] ; then arch=x64; \
    apt-get -y -m update && apt-get install -y wget curl libidn-dev libnet-perl liblist-moreutils-perl perl-doc libgomp1 libxml2 libsqlite3-dev; \
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-${version}+-${arch}-linux.tar.gz && \
    tar xzf ncbi-blast-${version}+-${arch}-linux.tar.gz --strip-components=1 && rm ncbi-blast-${version}+-${arch}-linux.tar.gz; \
    fi

# Do this since there is no ARM binaries for now
RUN if [ $(uname -m) = aarch64 ] ; then arch=aarch64; \
    apt-get -y -m update && apt-get install -y wget curl libidn-dev libnet-perl liblist-moreutils-perl perl-doc libgomp1 libxml2 libsqlite3-dev build-essential && \
    wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.16.0+-src.tar.gz && \
    tar -xvzf ncbi-blast-2.16.0+-src.tar.gz && \
    rm ncbi-blast-2.16.0+-src.tar.gz && \
    cd ncbi-blast-2.16.0+-src/c++/ && ./configure && \
    cd ReleaseMT/build && make all_r; \
    fi

RUN if [ $(uname -m) = aarch64 ] ; then arch=aarch64; \
    rm -rf ncbi-blast-2.16.0+-src/c++/src && \
    mkdir bin && \
    mv ncbi-blast-2.16.0+-src/c++/ReleaseMT/bin/* bin/; \
    fi

RUN sed -i '$ a BLASTDB=/blast/blastdb:/blast/blastdb_custom' /etc/environment
ENV BLASTDB /blast/blastdb:/blast/blastdb_custom
ENV BLAST_DOCKER true
ENV PATH="/blast/bin:${PATH}"

CMD ["/bin/sh"]
