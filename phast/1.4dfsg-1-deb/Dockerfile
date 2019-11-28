FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phast" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phast" \ 
    about.summary="phylogenetic analysis with space/time models" \ 
    about.home="http://compgen.cshl/edu/phast" \ 
    software.version="1.4dfsg-1-deb" \ 
    upstream.version="1.4" \ 
    version="1" \ 
    extra.identifiers.biotools="phast" \ 
    about.copyright="2002-2015 University of California, Cornell University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/phast/copyright" \ 
    extra.binaries="/usr/bin/all_dists,/usr/bin/base_evolve,/usr/bin/chooseLines,/usr/bin/clean_genes,/usr/bin/consEntropy,/usr/bin/convert_coords,/usr/bin/display_rate_matrix,/usr/bin/dless,/usr/bin/dlessP,/usr/bin/draw_tree,/usr/bin/eval_predictions,/usr/bin/exoniphy,/usr/bin/hmm_train,/usr/bin/hmm_tweak,/usr/bin/hmm_view,/usr/bin/indelFit,/usr/bin/indelHistory,/usr/bin/maf_parse,/usr/bin/makeHKY,/usr/bin/modFreqs,/usr/bin/msa_diff,/usr/bin/msa_split,/usr/bin/msa_view,/usr/bin/pbsDecode,/usr/bin/pbsEncode,/usr/bin/pbsScoreMatrix,/usr/bin/pbsTrain,/usr/bin/phast,/usr/bin/phastBias,/usr/bin/phastCons,/usr/bin/phastMotif,/usr/bin/phastOdds,/usr/bin/phyloBoot,/usr/bin/phyloFit,/usr/bin/phyloP,/usr/bin/prequel,/usr/bin/refeature,/usr/bin/stringiphy,/usr/bin/treeGen,/usr/bin/tree_doctor" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phast || apt-get install -y phast) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
