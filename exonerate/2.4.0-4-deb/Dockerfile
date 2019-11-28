FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="exonerate" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="exonerate" \ 
    about.summary="generic tool for pairwise sequence comparison" \ 
    about.home="https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate" \ 
    software.version="2.4.0-4-deb" \ 
    upstream.version="2.4.0" \ 
    version="1" \ 
    extra.identifiers.biotools="exonerate" \ 
    about.copyright=" 2000-2008 Guy St.C. Slater <guy.slater@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/exonerate/copyright" \ 
    extra.binaries="/usr/bin/esd2esi,/usr/bin/exonerate,/usr/bin/exonerate-server,/usr/bin/fasta2esd,/usr/bin/fastaannotatecdna,/usr/bin/fastachecksum,/usr/bin/fastaclean,/usr/bin/fastaclip,/usr/bin/fastacomposition,/usr/bin/fastadiff,/usr/bin/fastaexplode,/usr/bin/fastafetch,/usr/bin/fastahardmask,/usr/bin/fastaindex,/usr/bin/fastalength,/usr/bin/fastanrdb,/usr/bin/fastaoverlap,/usr/bin/fastareformat,/usr/bin/fastaremove,/usr/bin/fastarevcomp,/usr/bin/fastasoftmask,/usr/bin/fastasort,/usr/bin/fastasplit,/usr/bin/fastasubseq,/usr/bin/fastatranslate,/usr/bin/fastavalidcds,/usr/bin/ipcress" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::TODO,:searching, works-with-format::TODO, works-with-format::plaintext,:TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y exonerate || apt-get install -y exonerate) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
