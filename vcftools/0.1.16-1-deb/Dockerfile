FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vcftools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="vcftools" \ 
    about.summary="Collection of tools to work with VCF files" \ 
    about.home="https://vcftools.github.io/" \ 
    software.version="0.1.16-1-deb" \ 
    upstream.version="0.1.16" \ 
    version="1" \ 
    extra.identifiers.biotools="vcftools" \ 
    about.copyright="2009 - 2011, Adam Auton   (cpp)" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/vcftools/copyright" \ 
    extra.binaries="/usr/bin/fill-aa,/usr/bin/fill-an-ac,/usr/bin/fill-fs,/usr/bin/fill-ref-md5,/usr/bin/vcf-annotate,/usr/bin/vcf-compare,/usr/bin/vcf-concat,/usr/bin/vcf-consensus,/usr/bin/vcf-contrast,/usr/bin/vcf-convert,/usr/bin/vcf-fix-newlines,/usr/bin/vcf-fix-ploidy,/usr/bin/vcf-indel-stats,/usr/bin/vcf-isec,/usr/bin/vcf-merge,/usr/bin/vcf-phased-join,/usr/bin/vcf-query,/usr/bin/vcf-shuffle-cols,/usr/bin/vcf-sort,/usr/bin/vcf-stats,/usr/bin/vcf-subset,/usr/bin/vcf-to-tab,/usr/bin/vcf-tstv,/usr/bin/vcf-validator,/usr/bin/vcftools" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y vcftools || apt-get install -y vcftools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
