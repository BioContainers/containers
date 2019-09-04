FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="altree" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="altree" \ 
    about.summary="program to perform phylogeny-based association and localization analysis" \ 
    about.home="https://gitlab.inria.fr/NGS/ALTree" \ 
    software.version="1.3.1-7b1-deb" \ 
    upstream.version="1.3.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/altree/copyright" \ 
    about.license_file="/usr/share/doc/altree/copyright" \ 
    extra.binaries="/usr/bin/altree,/usr/bin/altree-add-S,/usr/bin/altree-convert" \ 
    about.tags="devel::lang:perl, devel::library, field::biology,:biology:bioinformatics, implemented-in::c, implemented-in::perl,:commandline, role::devel-lib, role::program,:shared-lib, scope::utility, use::analysing, use::comparing,:TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y altree || apt-get install -y altree) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
