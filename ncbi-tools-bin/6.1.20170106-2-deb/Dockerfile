FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-tools-bin" \ 
    container="ncbi-tools-bin" \ 
    about.summary="NCBI libraries for biology applications (text-based utilities)" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/" \ 
    software.version="6.1.20170106-2-deb" \ 
    version="1" \ 
    about.copyright="1996-2017 NCBI" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ncbi-tools-bin/copyright" \ 
    extra.binaries="/usr/bin/asn2all,/usr/bin/asn2asn,/usr/bin/asn2ff,/usr/bin/asn2fsa,/usr/bin/asn2gb,/usr/bin/asn2idx,/usr/bin/asn2xml,/usr/bin/asndhuff,/usr/bin/asndisc,/usr/bin/asnmacro,/usr/bin/asntool,/usr/bin/asnval,/usr/bin/checksub,/usr/bin/cleanasn,/usr/bin/debruijn,/usr/bin/errhdr,/usr/bin/fa2htgs,/usr/bin/findspl,/usr/bin/gbseqget,/usr/bin/gene2xml,/usr/bin/getmesh,/usr/bin/getpub,/usr/bin/gil2bin,/usr/bin/idfetch,/usr/bin/indexpub,/usr/bin/insdseqget,/usr/bin/makeset,/usr/bin/nps2gps,/usr/bin/sortbyquote,/usr/bin/spidey,/usr/bin/subfuse,/usr/bin/taxblast,/usr/bin/tbl2asn,/usr/bin/trna2sap,/usr/bin/trna2tbl,/usr/bin/vecscreen" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, network::client,:http, role::program, science::calculation, scope::utility,:analysing,:calculating,:converting,:searching,:plaintext,:xml,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncbi-tools-bin && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
