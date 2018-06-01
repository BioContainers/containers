FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="roary" \ 
    container="roary" \ 
    about.summary="high speed stand alone pan genome pipeline" \ 
    about.home="http://sanger-pathogens.github.io/Roary/" \ 
    software.version="3.8.0dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="roary" \ 
    about.copyright=" 2013 Wellcome Trust Sanger Institute" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/roary/copyright" \ 
    extra.binaries="/usr/bin/create_pan_genome,/usr/bin/create_pan_genome_plots,/usr/bin/extract_proteome_from_gff,/usr/bin/iterative_cdhit,/usr/bin/pan_genome_assembly_statistics,/usr/bin/pan_genome_core_alignment,/usr/bin/pan_genome_post_analysis,/usr/bin/pan_genome_reorder_spreadsheet,/usr/bin/parallel_all_against_all_blastp,/usr/bin/protein_alignment_from_nucleotides,/usr/bin/query_pan_genome,/usr/bin/roary,/usr/bin/roary-create_pan_genome_plots.R,/usr/bin/roary-pan_genome_reorder_spreadsheet,/usr/bin/roary-query_pan_genome,/usr/bin/transfer_annotation_to_groups" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline, role::program, scope::utility, use::analysing,:comparing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y roary && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
