FROM biocontainers/biocontainers:v1.0.0_cv4

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="seq_crumbs"
LABEL software.version="0.1.9"
LABEL about.summary="A selection of tools used to process 'small sequences'" 
LABEL about.home="https://bioinf.comav.upv.es/seq_crumbs/"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.license_file="~/bin/seq_crumbs-0.1.9/LICENSE.txt"
LABEL extra.binaries="sff_extract"

MAINTAINER David Sharkey <davidsharkey95@gmail.com>

USER root

# Install libraries, compilers etc.
RUN apt-get update && apt-get install -y \
	build-essential \
	python-pip \
	wget 

USER biodocker

RUN pip install numpy && pip install biopython

ENV VERSION seq_crumbs-0.1.9

# Download seq_crumbs
RUN wget bioinf.comav.upv.es/downloads/$VERSION.tar.gz -O /home/biodocker/bin/$VERSION.tar.gz && \
	cd /home/biodocker/bin/ && tar -xvzf $VERSION.tar.gz && cd $VERSION 

USER root

# Install seq_crumbs
RUN cd /home/biodocker/bin/$VERSION && python setup.py install

USER biodocker

WORKDIR /data

# CMD ["sff_extract"]

# References: 
# biocontainers.pro/docs/developer-manual/biocontainers-dockerfile/
# https://bioinf.comav.upv.es/seq_crumbs/install.html
# https://docs.docker.com
# Stack Overflow: https://stackoverflow.com/questions/1078524/how-to-specify-the-location-with-wget 
# Leo Leopold Hertz: https://stackoverflow.com/users/54964/l%c3%a9o-l%c3%a9opold-hertz-%ec%a4%80%ec%98%81
# RichieHindle: https://stackoverflow.com/users/21886/richiehindle


