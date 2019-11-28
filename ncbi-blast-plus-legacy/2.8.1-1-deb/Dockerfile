FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-blast-plus-legacy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-blast-plus-legacy" \ 
    about.summary="NCBI Blast legacy call script" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/" \ 
    software.version="2.8.1-1-deb" \ 
    upstream.version="2.8.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ncbi-blast-plus-legacy/copyright" \ 
    about.license_file="/usr/share/doc/ncbi-blast-plus-legacy/copyright" \ 
    extra.binaries="/usr/bin/bl2seq,/usr/bin/blastall,/usr/bin/blastpgp,/usr/bin/fastacmd,/usr/bin/formatdb,/usr/bin/megablast,/usr/bin/rpsblast,/usr/bin/seedtop" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::shell,:commandline, role::program, scope::utility" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-blast+-legacy || apt-get install -y ncbi-blast+-legacy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
