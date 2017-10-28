# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1.0"
LABEL software="Zorro"
LABEL software.version="1.0"
LABEL description="A probabilistic alignment masking program"
LABEL website="https://phylogenomics.blogspot.com.tr/2012/02/new-openaccess-paper-from-my-lab-on.html"
LABEL documentation="https://sourceforge.net/projects/probmask/files/"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Emre YILMAZ <emre@eres.tech>

USER biodocker

WORKDIR /home/biodocker/bin
RUN wget  -O zorro https://10gbps-io.dl.sourceforge.net/project/probmask/zorro_linux_x86_64 \ 
  && chmod 755 /home/biodocker/bin/zorro \
  && wget -O FastTree http://www.microbesonline.org/fasttree/FastTree \
  && chmod 755 /home/biodocker/bin/FastTree

ENV PATH /home/biodocker/bin:$PATH
WORKDIR /data/

