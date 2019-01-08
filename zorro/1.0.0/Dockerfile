################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="Zorro"
LABEL software.version="1.0.0"
LABEL about.summary="A probabilistic alignment masking program"
LABEL about.home="https://phylogenomics.blogspot.com.tr/2012/02/new-openaccess-paper-from-my-lab-on.html"
LABEL about.documentation="https://sourceforge.net/projects/probmask/files/"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="zorro"

################## MAINTAINER ######################
MAINTAINER Emre YILMAZ <emre@eres.tech>

USER biodocker

WORKDIR /home/biodocker/bin
RUN wget  -O zorro http://downloads.sourceforge.net/project/probmask/zorro_linux_x86_64 \ 
  && chmod 755 /home/biodocker/bin/zorro \
  && wget -O FastTree http://www.microbesonline.org/fasttree/FastTree \
  && chmod 755 /home/biodocker/bin/FastTree

ENV PATH /home/biodocker/bin:$PATH
WORKDIR /data/

