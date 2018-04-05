FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqan-apps" \ 
    container="seqan-apps" \ 
    about.summary="C++ library for the analysis of biological sequences" \ 
    about.home="http://www.seqan.de/" \ 
    software.version="2.3.1dfsg-4-deb" \ 
    version="1" \ 
    about.copyright="2006-2016, Knut Reinert, FU Berlin" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/seqan-apps/copyright" \ 
    extra.binaries="/usr/bin/alf,/usr/bin/gustaf,/usr/bin/insegt,/usr/bin/mason_frag_sequencing,/usr/bin/mason_genome,/usr/bin/mason_materializer,/usr/bin/mason_methylation,/usr/bin/micro_razers,/usr/bin/pair_align,/usr/bin/rabema_build_gold_standard,/usr/bin/rabema_evaluate,/usr/bin/rabema_prepare_sam,/usr/bin/razers,/usr/bin/razers3,/usr/bin/sak,/usr/bin/seqan_tcoffee,/usr/bin/snp_store,/usr/bin/splazers,/usr/bin/stellar,/usr/bin/tree_recon,/usr/bin/yara_indexer,/usr/bin/yara_mapper" \ 
    about.tags="devel::library, role::devel-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y seqan-apps && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
