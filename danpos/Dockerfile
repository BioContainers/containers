FROM ubuntu:xenial

# Metadata
LABEL base_image="biocontainers:latest"
LABEL software.version="2"
LABEL software="danpos"
LABEL software.version="2.2.2"
LABEL about.summary="A toolkit for Dynamic Analysis of Nucleosome and Protein Occupancy by Sequencing"
LABEL about.home="https://sites.google.com/site/danposdoc/news"
LABEL about.documentation="https://sites.google.com/site/danposdoc/home"
LABEL about.license="GNU GPL v3"
LABEL extra.identifiers.biotools="https://bio.tools/danpos"
LABEL about.tags="nucleosome"

MAINTAINER Nicholas Samuel Hill <nicholas.samuel.hill@gmail.com>

WORKDIR /root

RUN apt-get update && \
  apt-get install -y \
    python-setuptools \
    r-base \
    python-pip \
    python-dev \
    bzip2 \
    python-rpy2 \
    liblzma-dev \
    wget
    
RUN wget https://sourceforge.net/projects/samtools/files/samtools/0.1.7/samtools-0.1.7_x86_64-linux.tar.bz2/download && \
  tar -xvf download && \
  cd samtools-0.1.7_x86_64-linux && \
  chmod +x samtools && \
  cp samtools /usr/local/bin/
 
 
RUN wget http://lilab.research.bcm.edu/dldcc-web/lilab/kaifuc/danpos/release/danpos-2.2.2.tgz && \
  tar -zxvf danpos-2.2.2.tgz && \
  chmod +x danpos-2.2.2/*.py && \
  cp danpos-2.2.2/*.py /usr/local/bin/ && \
  cd /root && \
  rm -fr danpos-2.2.2.tgz danpos-2.2.2
  
ENTRYPOINT ["danpos.py"]

CMD ["-h"]
