FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-edger" \ 
    container="bioconductor-edger" \ 
    about.summary="Empirical analysis of digital gene expression data in R" \ 
    about.home="http://www.bioconductor.org/packages/release/bioc/html/edgeR.html" \ 
    software.version="3.14.0dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2007-2014 Mark Robinson <mrobinson@wehi.edu.au>, Davis McCarthy <dmccarthy@wehi.edu.au>, Gordon Smyth <smyth@wehi.edu.au>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/bioconductor-edger/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::r,:commandline" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-edger && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
