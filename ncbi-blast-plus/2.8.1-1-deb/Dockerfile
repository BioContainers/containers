FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-blast-plus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-blast-plus" \ 
    about.summary="next generation suite of BLAST sequence search tools" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/" \ 
    software.version="2.8.1-1-deb" \ 
    upstream.version="2.8.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ncbi-blast-plus/copyright" \ 
    about.license_file="/usr/share/doc/ncbi-blast-plus/copyright" \ 
    extra.binaries="/usr/bin/blast_formatter,/usr/bin/blastdb_aliastool,/usr/bin/blastdb_convert,/usr/bin/blastdbcheck,/usr/bin/blastdbcmd,/usr/bin/blastdbcp,/usr/bin/blastn,/usr/bin/blastp,/usr/bin/blastx,/usr/bin/convert2blastmask,/usr/bin/deltablast,/usr/bin/dustmasker,/usr/bin/gene_info_reader,/usr/bin/get_species_taxids.sh,/usr/bin/legacy_blast,/usr/bin/makeblastdb,/usr/bin/makembindex,/usr/bin/makeprofiledb,/usr/bin/psiblast,/usr/bin/rpsblast+,/usr/bin/rpstblastn,/usr/bin/seedtop+,/usr/bin/segmasker,/usr/bin/seqdb_perf,/usr/bin/tblastn,/usr/bin/tblastx,/usr/bin/update_blastdb,/usr/bin/windowmasker,/usr/bin/windowmasker_2.2.22_adapter" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-blast+ || apt-get install -y ncbi-blast+) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
