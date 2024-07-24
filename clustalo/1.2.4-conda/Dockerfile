################## BASE IMAGE ######################

FROM continuumio/miniconda3

################## METADATA ######################

LABEL version="1"
LABEL about.summary="making accurate alignments of many protein sequences"
LABEL software="Clustal Omega"
LABEL software.version="1.2.4"
LABEL about.tags="Genomics"
LABEL about.home="http://www.clustal.org/omega/"
LABEL about.license="GPL-3.0"
LABEL about.author="Sievers F, Wilm A, Dineen DG, Gibson TJ, Karplus K, Li W, Lopez R, McWilliam H, Remmert M, Söding J, Thompson JD, Higgins DG "

################## MAINTAINER ######################
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>

RUN conda install -c conda-forge -c bioconda clustalo==1.2.4

# NOTE: Conda version has binaries for AMD64 and ARM v8, DEB version has AMD64, ARM v8 and ARM v7 (RASPI)
