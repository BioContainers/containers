FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="samtools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="samtools" \ 
    about.summary="processing sequence alignments in SAM, BAM and CRAM formats" \ 
    about.home="http://www.htslib.org/" \ 
    software.version="1.9-4-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    extra.identifiers.biotools="samtools" \ 
    about.copyright=" 20082016, Genome Research Ltd. (GRL)" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/samtools/copyright" \ 
    extra.binaries="/usr/bin/ace2sam,/usr/bin/blast2sam.pl,/usr/bin/bowtie2sam.pl,/usr/bin/export2sam.pl,/usr/bin/interpolate_sam.pl,/usr/bin/maq2sam-long,/usr/bin/maq2sam-short,/usr/bin/md5fa,/usr/bin/md5sum-lite,/usr/bin/novo2sam.pl,/usr/bin/plot-bamstats,/usr/bin/psl2sam.pl,/usr/bin/sam2vcf.pl,/usr/bin/samtools,/usr/bin/samtools.pl,/usr/bin/seq_cache_populate.pl,/usr/bin/soap2sam.pl,/usr/bin/varfilter.py,/usr/bin/wgsim,/usr/bin/wgsim_eval.pl,/usr/bin/zoom2sam.pl" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, network::client, protocol::ftp, protocol::http,:program, scope::utility, uitoolkit::ncurses, use::analysing,:calculating,:filtering, works-with::biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y samtools || apt-get install -y samtools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
