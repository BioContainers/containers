FROM continuumio/miniconda3
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="bowtie2"

ARG software_version=2.5.4

RUN conda config --add channels bioconda
RUN conda install conda-forge::libgcc-ng
RUN conda install ncurses bowtie2=$software_version

CMD ["/bin/sh"]



