FROM ubuntu:20.04

LABEL authors="Laise Florentino (lcf@ebi.ac.uk), Matthias Blum (mblum@ebi.ac.uk)"

ARG VERSION=5.69-101.0
ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update -y && \
    apt-get install -y wget python3.8 python2.7 openjdk-11-jre-headless libpcre2-dev libgomp1 perl-doc && \
    ln -s /usr/bin/python3.8 /usr/bin/python3 && ln -s /usr/bin/python3.8 /usr/bin/python

WORKDIR /opt

RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/alt/interproscan-core-${VERSION}.tar.gz && \
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/alt/interproscan-core-${VERSION}.tar.gz.md5 && \
    md5sum -c interproscan-core-${VERSION}.tar.gz.md5 && \
    tar -zxf interproscan-core-${VERSION}.tar.gz && \
    rm interproscan-core-${VERSION}.tar.gz && \
    mv /opt/interproscan-${VERSION} /opt/interproscan

WORKDIR /opt/interproscan
ENTRYPOINT ["bash", "./interproscan.sh"]
