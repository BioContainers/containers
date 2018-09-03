FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="staden-io-lib-utils" \ 
    container="staden-io-lib-utils" \ 
    about.summary="programs for maniuplating DNA sequencing files" \ 
    about.home="http://staden.sourceforge.net/" \ 
    software.version="1.14.8-2-deb" \ 
    version="1" \ 
    about.copyright=" 1994 Medical Research Council" \ 
    about.license="GRL or MRC" \ 
    about.license_file="/usr/share/doc/staden-io-lib-utils/copyright" \ 
    extra.binaries="/usr/bin/append_sff,/usr/bin/convert_trace,/usr/bin/cram_dump,/usr/bin/cram_index,/usr/bin/cram_size,/usr/bin/extract_fastq,/usr/bin/extract_qual,/usr/bin/extract_seq,/usr/bin/get_comment,/usr/bin/hash_exp,/usr/bin/hash_extract,/usr/bin/hash_list,/usr/bin/hash_sff,/usr/bin/hash_tar,/usr/bin/index_tar,/usr/bin/makeSCF,/usr/bin/scf_dump,/usr/bin/scf_info,/usr/bin/scf_update,/usr/bin/scram_flagstat,/usr/bin/scram_merge,/usr/bin/scram_pileup,/usr/bin/scram_test,/usr/bin/scramble,/usr/bin/srf2fasta,/usr/bin/srf2fastq,/usr/bin/srf_dump_all,/usr/bin/srf_extract_hash,/usr/bin/srf_extract_linear,/usr/bin/srf_filter,/usr/bin/srf_index_hash,/usr/bin/srf_info,/usr/bin/srf_list,/usr/bin/trace_dump,/usr/bin/ztr_dump" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:utility, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y staden-io-lib-utils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
