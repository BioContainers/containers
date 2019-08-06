FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bedops" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bedops" \ 
    about.summary="high-performance genomic feature operations" \ 
    about.home="https://github.com/bedops/bedops" \ 
    software.version="2.4.35dfsg-1-deb" \ 
    upstream.version="2.4.35" \ 
    version="1" \ 
    extra.identifiers.biotools="bedops" \ 
    about.copyright="2011-2018 Shane J. Neph, M. Scott Kuehn and Alex P. Reynolds" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/bedops/copyright" \ 
    extra.binaries="/usr/bin/bam2bed,/usr/bin/bam2bed_gnuParallel,/usr/bin/bam2bed_sge,/usr/bin/bam2bed_slurm,/usr/bin/bam2starch,/usr/bin/bam2starch_gnuParallel,/usr/bin/bam2starch_sge,/usr/bin/bam2starch_slurm,/usr/bin/bedextract,/usr/bin/bedmap,/usr/bin/bedops,/usr/bin/bedops-starch,/usr/bin/closest-features,/usr/bin/convert2bed,/usr/bin/gff2bed,/usr/bin/gff2starch,/usr/bin/gtf2bed,/usr/bin/gtf2starch,/usr/bin/gvf2bed,/usr/bin/gvf2starch,/usr/bin/psl2bed,/usr/bin/psl2starch,/usr/bin/rmsk2bed,/usr/bin/rmsk2starch,/usr/bin/sam2bed,/usr/bin/sam2starch,/usr/bin/sort-bed,/usr/bin/starch-diff,/usr/bin/starchcat,/usr/bin/starchcluster_gnuParallel,/usr/bin/starchcluster_sge,/usr/bin/starchcluster_slurm,/usr/bin/starchstrip,/usr/bin/unstarch,/usr/bin/update-sort-bed-migrate-candidates,/usr/bin/update-sort-bed-slurm,/usr/bin/update-sort-bed-starch-slurm,/usr/bin/vcf2bed,/usr/bin/vcf2starch,/usr/bin/wig2bed,/usr/bin/wig2starch" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bedops || apt-get install -y bedops) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
