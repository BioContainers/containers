FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cct" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="cct" \ 
    about.summary="visually comparing bacterial, plasmid, chloroplast, or mitochondrial sequences" \ 
    about.home="http://stothard.afns.ualberta.ca/downloads/CCT/" \ 
    software.version="20170919dfsg-1bpo91-deb" \ 
    upstream.version="20170919" \ 
    version="1" \ 
    extra.identifiers.biotools="cct" \ 
    about.license="custom, see /usr/share/doc/cct/copyright" \ 
    about.license_file="/usr/share/doc/cct/copyright" \ 
    extra.binaries="/usr/bin/build_blast_atlas,/usr/bin/build_blast_atlas_all_vs_all,/usr/bin/cgview_comparison_tool,/usr/bin/convert_vcf_to_features,/usr/bin/create_zoomed_maps,/usr/bin/fetch_all_refseq_bacterial_genomes,/usr/bin/fetch_all_refseq_chloroplast_genomes,/usr/bin/fetch_all_refseq_mitochondrial_genomes,/usr/bin/fetch_genome_by_accession,/usr/bin/fetch_refseq_bacterial_genomes_by_name,/usr/bin/ncbi_search,/usr/bin/redraw_maps,/usr/bin/remove_long_seqs,/usr/bin/remove_short_seqs" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cct && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
