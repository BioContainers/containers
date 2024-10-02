FROM debian:buster-slim
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="3d-dna" \ 
    base_image="debian:buster-slim" \  
    about.summary="" \ 
    about.home="http://biopython.org" \ 
    software.version="1.84-pip" \ 
    upstream.version="1.84" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/biopython/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt-get install -y wget lastz openjdk-11-jdk python python-scipy && apt clean && apt purge && rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://github.com/aidenlab/3d-dna/archive/refs/tags/201008.tar.gz && tar xvfz 201008.tar.gz && rm 201008.tar.gz


#RUN python3 -m venv biopython && . biopython/bin/activate && pip install biopython==1.84
