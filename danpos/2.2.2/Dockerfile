################## BASE IMAGE ######################
FROM ubuntu:xenial

# Metadata
LABEL base_image="ubuntu:xenial" \
    version="3" \
    software="danpos" \
    software.version="2.2.2" \
    about.summary="A toolkit for Dynamic Analysis of Nucleosome and Protein Occupancy by Sequencing" \
    about.home="https://sites.google.com/site/danposdoc/news" \
    about.documentation="https://sites.google.com/site/danposdoc/home" \
    about.license="GPL-3.0" \
    about.license_file="http://www.gnu.org/licenses/gpl-3.0.txt" \
    extra.identifier.biotools="https://bio.tools/danpos" \
    extra.binaries="danpos.py" \
    about.tags="nucleosome"

MAINTAINER Nicholas Samuel Hill <nicholas.samuel.hill@gmail.com>

WORKDIR /root

RUN apt-get update && \
    apt-get install -y \
    python-setuptools \
    r-base \
    python-pip \
    python-dev \
    python-rpy2 \
    liblzma-dev \
    wget
    
RUN wget https://sourceforge.net/projects/samtools/files/samtools/0.1.7/samtools-0.1.7_x86_64-linux.tar.bz2/download && \
  tar -xvf download && \
  cd samtools-0.1.7_x86_64-linux && \
  chmod +x samtools && \
  cp samtools /usr/local/bin/ && \
  cd /root && \
  rm -rf download
 
RUN wget http://lilab.research.bcm.edu/dldcc-web/lilab/kaifuc/danpos/release/danpos-2.2.2.tgz && \
  tar -zxvf danpos-2.2.2.tgz && \
  chmod +x danpos-2.2.2/*.py && \
  cp danpos-2.2.2/*.py /usr/local/bin/ && \
  cd /root && \
  rm -rf danpos-2.2.2.tgz danpos-2.2.2
  
# ENTRYPOINT ["danpos.py"]

# CMD ["-h"]
