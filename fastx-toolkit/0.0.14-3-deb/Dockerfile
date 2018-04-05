FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastx-toolkit" \ 
    container="fastx-toolkit" \ 
    about.summary="FASTQ/A short nucleotide reads pre-processing tools" \ 
    about.home="http://hannonlab.cshl.edu/fastx_toolkit/" \ 
    software.version="0.0.14-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="fastx-toolkit" \ 
    about.copyright="20082013 Assaf Gordon <assafgordon@gmail.com>" \ 
    about.license="AGPL-3+" \ 
    about.license_file="/usr/share/doc/fastx-toolkit/copyright" \ 
    extra.binaries="/usr/bin/fasta_clipping_histogram.pl,/usr/bin/fasta_formatter,/usr/bin/fasta_nucleotide_changer,/usr/bin/fastq_masker,/usr/bin/fastq_quality_boxplot_graph.sh,/usr/bin/fastq_quality_converter,/usr/bin/fastq_quality_filter,/usr/bin/fastq_quality_trimmer,/usr/bin/fastq_to_fasta,/usr/bin/fastx_artifacts_filter,/usr/bin/fastx_barcode_splitter.pl,/usr/bin/fastx_clipper,/usr/bin/fastx_collapser,/usr/bin/fastx_nucleotide_distribution_graph.sh,/usr/bin/fastx_nucleotide_distribution_line_graph.sh,/usr/bin/fastx_quality_stats,/usr/bin/fastx_renamer,/usr/bin/fastx_reverse_complement,/usr/bin/fastx_trimmer,/usr/bin/fastx_uncollapser" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastx-toolkit && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
