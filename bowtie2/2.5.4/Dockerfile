FROM debian:bookworm-slim

MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="bowtie2"

ARG software_version=2.5.4

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update
RUN apt-get install -y wget 
RUN apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

USER 0
RUN mkdir -p /opt
RUN cd /opt
# https://github.com/BenLangmead/bowtie2/releases/download/v2.5.4/bowtie2-2.5.4-linux-x86_64.zip
# https://github.com/BenLangmead/bowtie2/releases/download/v2.5.4/bowtie2-2.5.4-linux-aarch64.zip
RUN if [ $(uname -m) = x86_64 ] ; then arch=x86_64; \
    elif [ $(uname -m) = aarch64 ] ; then arch=aarch64; \
    else echo "Architecture $(uname -m) is not supported" >&2; exit 1; \
    fi &&  wget https://github.com/BenLangmead/bowtie2/releases/download/v${software_version}/bowtie2-${software_version}-linux-${arch}.zip \
    && unzip bowtie2-${software_version}-linux-${arch}.zip \
    && rm bowtie2-${software_version}-linux-${arch}.zip

ENV PATH="/opt/bowtie2-${software_version}-linux-${arch}/:${PATH}"

CMD ["/bin/sh"]

WORKDIR /data/
