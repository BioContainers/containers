FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bx-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bx-tools" \ 
    about.summary="command line interface to python3-bx" \ 
    about.home="https://github.com/bxlab/bx-python" \ 
    software.version="0.8.2-1-deb-py3" \ 
    upstream.version="0.8.2" \ 
    version="1" \ 
    about.copyright="2005-2015 The Pennsylvania State University" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/bx-tools/copyright" \ 
    extra.binaries="/usr/bin/aggregate_scores_in_intervals.py,/usr/bin/align_print_template.py,/usr/bin/axt_extract_ranges.py,/usr/bin/axt_to_fasta.py,/usr/bin/axt_to_lav.py,/usr/bin/axt_to_maf.py,/usr/bin/bed_bigwig_profile.py,/usr/bin/bed_build_windows.py,/usr/bin/bed_complement.py,/usr/bin/bed_count_by_interval.py,/usr/bin/bed_count_overlapping.py,/usr/bin/bed_coverage.py,/usr/bin/bed_coverage_by_interval.py,/usr/bin/bed_diff_basewise_summary.py,/usr/bin/bed_extend_to.py,/usr/bin/bed_intersect.py,/usr/bin/bed_intersect_basewise.py,/usr/bin/bed_merge_overlapping.py,/usr/bin/bed_rand_intersect.py,/usr/bin/bed_subtract_basewise.py,/usr/bin/bnMapper.py,/usr/bin/div_snp_table_chr.py,/usr/bin/find_in_sorted_file.py,/usr/bin/gene_fourfold_sites.py,/usr/bin/get_scores_in_intervals.py,/usr/bin/int_seqs_to_char_strings.py,/usr/bin/interval_count_intersections.py,/usr/bin/interval_join.py,/usr/bin/lav_to_axt.py,/usr/bin/lav_to_maf.py,/usr/bin/line_select.py,/usr/bin/lzop_build_offset_table.py,/usr/bin/mMK_bitset.py,/usr/bin/maf_build_index.py,/usr/bin/maf_chop.py,/usr/bin/maf_chunk.py,/usr/bin/maf_col_counts.py,/usr/bin/maf_col_counts_all.py,/usr/bin/maf_count.py,/usr/bin/maf_covered_ranges.py,/usr/bin/maf_covered_regions.py,/usr/bin/maf_div_sites.py,/usr/bin/maf_drop_overlapping.py,/usr/bin/maf_extract_chrom_ranges.py,/usr/bin/maf_extract_ranges.py,/usr/bin/maf_extract_ranges_indexed.py,/usr/bin/maf_filter.py,/usr/bin/maf_filter_max_wc.py,/usr/bin/maf_gap_frequency.py,/usr/bin/maf_gc_content.py,/usr/bin/maf_interval_alignibility.py,/usr/bin/maf_limit_to_species.py,/usr/bin/maf_mapping_word_frequency.py,/usr/bin/maf_mask_cpg.py,/usr/bin/maf_mean_length_ungapped_piece.py,/usr/bin/maf_percent_columns_matching.py,/usr/bin/maf_percent_identity.py,/usr/bin/maf_print_chroms.py,/usr/bin/maf_print_scores.py,/usr/bin/maf_randomize.py,/usr/bin/maf_region_coverage_by_src.py,/usr/bin/maf_select.py,/usr/bin/maf_shuffle_columns.py,/usr/bin/maf_species_in_all_files.py,/usr/bin/maf_split_by_src.py,/usr/bin/maf_thread_for_species.py,/usr/bin/maf_tile.py,/usr/bin/maf_tile_2.py,/usr/bin/maf_tile_2bit.py,/usr/bin/maf_to_axt.py,/usr/bin/maf_to_concat_fasta.py,/usr/bin/maf_to_fasta.py,/usr/bin/maf_to_int_seqs.py,/usr/bin/maf_translate_chars.py,/usr/bin/maf_truncate.py,/usr/bin/maf_word_frequency.py,/usr/bin/mask_quality.py,/usr/bin/nib_chrom_intervals_to_fasta.py,/usr/bin/nib_intervals_to_fasta.py,/usr/bin/nib_length.py,/usr/bin/one_field_per_line.py,/usr/bin/out_to_chain.py,/usr/bin/prefix_lines.py,/usr/bin/pretty_table.py,/usr/bin/qv_to_bqv.py,/usr/bin/random_lines.py,/usr/bin/table_add_column.py,/usr/bin/table_filter.py,/usr/bin/tfloc_summary.py,/usr/bin/ucsc_gene_table_to_intervals.py,/usr/bin/wiggle_to_array_tree.py,/usr/bin/wiggle_to_binned_array.py,/usr/bin/wiggle_to_chr_binned_array.py,/usr/bin/wiggle_to_simple.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-bx-tools || apt-get install -y python3-bx-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
