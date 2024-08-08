FROM debian:sid

USER root

RUN apt-get -y -m update && apt-get install -y \
  libperl4-corelibs-perl \
  git \
  bioperl=1.7.8-1

RUN git clone --depth 1 https://github.com/CAFS-bioinformatics/LR_Gapcloser.git

RUN chmod -R a+x /LR_Gapcloser/src/
