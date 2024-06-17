################## BASE IMAGE ######################

FROM continuumio/miniconda3

################## METADATA ######################

LABEL version="1"
LABEL about.summary="Model-based Analysis of ChIP-Exo"
LABEL software="MACE"
LABEL software.version="1.2"
LABEL about.tags="Genomics"
LABEL about.home="http://chipexo.sourceforge.net/"
LABEL about.software="https://sourceforge.net/projects/chipexo/files/MACE-1.2.tar.gz"
LABEL about.documentation="http://chipexo.sourceforge.net/"
LABEL about.license="GPL-3.0"
LABEL about.author="Wang, Liguo"

################## MAINTAINER ######################
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>

RUN conda install -c conda-forge -c bioconda clustalo==1.2.4
