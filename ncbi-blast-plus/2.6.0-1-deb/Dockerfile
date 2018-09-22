FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-blast-plus" \ 
    container="ncbi-blast-plus" \ 
    about.summary="next generation suite of BLAST sequence search tools" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/" \ 
    software.version="2.6.0-1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ncbi-blast-plus/copyright" \ 
    extra.binaries="/usr/bin/blast_formatter,/usr/bin/blastdb_aliastool,/usr/bin/blastdbcheck,/usr/bin/blastdbcmd,/usr/bin/blastdbcp,/usr/bin/blastn,/usr/bin/blastp,/usr/bin/blastx,/usr/bin/convert2blastmask,/usr/bin/deltablast,/usr/bin/dustmasker,/usr/bin/gene_info_reader,/usr/bin/legacy_blast,/usr/bin/makeblastdb,/usr/bin/makembindex,/usr/bin/makeprofiledb,/usr/bin/psiblast,/usr/bin/rpsblast+,/usr/bin/rpstblastn,/usr/bin/seedtop+,/usr/bin/segmasker,/usr/bin/seqdb_perf,/usr/bin/tblastn,/usr/bin/tblastx,/usr/bin/update_blastdb,/usr/bin/windowmasker,/usr/bin/windowmasker_2.2.22_adapter" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncbi-blast+ && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
