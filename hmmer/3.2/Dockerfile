################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="hmmer"
LABEL software.version="3.2"
LABEL about.summary="Biosequence analysis using profile hidden Markov models"
LABEL about.home="http://hmmer.org/"
LABEL about.documentation="http://hmmer.org/documentation.html"
LABEL about.license="BSD-3-clause"
LABEL extra.identifiers.biotools="hmmer3"
LABEL about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::searching,:plaintext, works-with::db"

################## MAINTAINER ######################

MAINTAINER Fábio Madeira <fabiomadeira@me.com>

################## INSTALLATION ######################

RUN conda install hmmer=3.2

WORKDIR /data/
USER biodocker
