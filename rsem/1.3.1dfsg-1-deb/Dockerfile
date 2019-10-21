FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rsem" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rsem" \ 
    about.summary="RNA-Seq by Expectation-Maximization" \ 
    about.home="http://deweylab.biostat.wisc.edu/rsem/" \ 
    software.version="1.3.1dfsg-1-deb" \ 
    upstream.version="1.3.1" \ 
    version="1" \ 
    extra.identifiers.biotools="rsem" \ 
    about.copyright="(c) 2009-2015 Bo Li bli25 [at] berkeley [dot] edu" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/rsem/copyright" \ 
    extra.binaries="/usr/bin/convert-sam-for-rsem,/usr/bin/extract-transcript-to-gene-map-from-trinity,/usr/bin/rsem-bam2readdepth,/usr/bin/rsem-bam2wig,/usr/bin/rsem-build-read-index,/usr/bin/rsem-calculate-credibility-intervals,/usr/bin/rsem-calculate-expression,/usr/bin/rsem-control-fdr,/usr/bin/rsem-extract-reference-transcripts,/usr/bin/rsem-gen-transcript-plots,/usr/bin/rsem-generate-data-matrix,/usr/bin/rsem-generate-ngvector,/usr/bin/rsem-get-unique,/usr/bin/rsem-gff3-to-gtf,/usr/bin/rsem-parse-alignments,/usr/bin/rsem-plot-model,/usr/bin/rsem-plot-transcript-wiggles,/usr/bin/rsem-prepare-reference,/usr/bin/rsem-preref,/usr/bin/rsem-refseq-extract-primary-assembly,/usr/bin/rsem-run-em,/usr/bin/rsem-run-gibbs,/usr/bin/rsem-sam-validator,/usr/bin/rsem-scan-for-paired-end-reads,/usr/bin/rsem-simulate-reads,/usr/bin/rsem-synthesis-reference-transcripts,/usr/bin/rsem-tbam2gbam,/usr/bin/rsem_perl_utils.pm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rsem || apt-get install -y rsem) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
