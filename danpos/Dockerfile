FROM ubuntu:xenial

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
