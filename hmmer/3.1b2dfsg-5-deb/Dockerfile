FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hmmer" \ 
    container="hmmer" \ 
    about.summary="profile hidden Markov models for protein sequence analysis" \ 
    about.home="http://hmmer.org/" \ 
    software.version="3.1b2dfsg-5-deb" \ 
    version="1" \ 
    about.copyright="1992-2010 Sean R. Eddy <eddy@genetics.wustl.edu>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/hmmer/copyright" \ 
    extra.binaries="/usr/bin/alimask,/usr/bin/hmmalign,/usr/bin/hmmbuild,/usr/bin/hmmc2,/usr/bin/hmmconvert,/usr/bin/hmmemit,/usr/bin/hmmerfm-exactmatch,/usr/bin/hmmfetch,/usr/bin/hmmlogo,/usr/bin/hmmpgmd,/usr/bin/hmmpress,/usr/bin/hmmscan,/usr/bin/hmmsearch,/usr/bin/hmmsim,/usr/bin/hmmstat,/usr/bin/jackhmmer,/usr/bin/makehmmerdb,/usr/bin/nhmmer,/usr/bin/nhmmscan,/usr/bin/phmmer" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::searching,:plaintext, works-with::db" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hmmer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
