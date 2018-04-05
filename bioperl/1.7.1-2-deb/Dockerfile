FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioperl" \ 
    container="bioperl" \ 
    about.summary="Perl tools for computational molecular biology" \ 
    about.home="http://www.bioperl.org/" \ 
    software.version="1.7.1-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="bioperl" \ 
    about.copyright="The Bioperl developers." \ 
    about.license="Perl" \ 
    about.license_file="/usr/share/doc/bioperl/copyright" \ 
    extra.binaries="/usr/bin/bp_aacomp,/usr/bin/bp_biofetch_genbank_proxy,/usr/bin/bp_bioflat_index,/usr/bin/bp_biogetseq,/usr/bin/bp_blast2tree,/usr/bin/bp_bulk_load_gff,/usr/bin/bp_chaos_plot,/usr/bin/bp_classify_hits_kingdom,/usr/bin/bp_composite_LD,/usr/bin/bp_das_server,/usr/bin/bp_dbsplit,/usr/bin/bp_download_query_genbank,/usr/bin/bp_extract_feature_seq,/usr/bin/bp_fast_load_gff,/usr/bin/bp_fastam9_to_table,/usr/bin/bp_fetch,/usr/bin/bp_filter_search,/usr/bin/bp_find-blast-matches,/usr/bin/bp_flanks,/usr/bin/bp_gccalc,/usr/bin/bp_genbank2gff,/usr/bin/bp_genbank2gff3,/usr/bin/bp_generate_histogram,/usr/bin/bp_heterogeneity_test,/usr/bin/bp_hivq,/usr/bin/bp_hmmer_to_table,/usr/bin/bp_index,/usr/bin/bp_load_gff,/usr/bin/bp_local_taxonomydb_query,/usr/bin/bp_make_mrna_protein,/usr/bin/bp_mask_by_search,/usr/bin/bp_meta_gff,/usr/bin/bp_mrtrans,/usr/bin/bp_mutate,/usr/bin/bp_netinstall,/usr/bin/bp_nexus2nh,/usr/bin/bp_nrdb,/usr/bin/bp_oligo_count,/usr/bin/bp_pairwise_kaks,/usr/bin/bp_parse_hmmsearch,/usr/bin/bp_process_gadfly,/usr/bin/bp_process_sgd,/usr/bin/bp_process_wormbase,/usr/bin/bp_query_entrez_taxa,/usr/bin/bp_remote_blast,/usr/bin/bp_revtrans-motif,/usr/bin/bp_search2alnblocks,/usr/bin/bp_search2gff,/usr/bin/bp_search2table,/usr/bin/bp_search2tribe,/usr/bin/bp_seq_length,/usr/bin/bp_seqconvert,/usr/bin/bp_seqcut,/usr/bin/bp_seqfeature_delete,/usr/bin/bp_seqfeature_gff3,/usr/bin/bp_seqfeature_load,/usr/bin/bp_seqpart,/usr/bin/bp_seqret,/usr/bin/bp_seqretsplit,/usr/bin/bp_split_seq,/usr/bin/bp_sreformat,/usr/bin/bp_taxid4species,/usr/bin/bp_taxonomy2tree,/usr/bin/bp_translate_seq,/usr/bin/bp_tree2pag,/usr/bin/bp_unflatten_seq" \ 
    about.tags="devel::lang:perl, devel::library, field::biology,:biology:bioinformatics, implemented-in::perl, role::devel-lib,:shared-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bioperl && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
