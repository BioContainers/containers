FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="progressivemauve" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="progressivemauve" \ 
    about.summary="multiple genome alignment algorithms" \ 
    about.home="http://darlinglab.org/mauve/user-guide/mauvealigner.html" \ 
    software.version="1.2.04713dfsg-4-deb" \ 
    upstream.version="1.2.0" \ 
    version="1" \ 
    about.copyright="2003-2014, Aaron Darling -- darling@cs.wisc.edu" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/progressivemauve/copyright" \ 
    extra.binaries="/usr/bin/addUnalignedIntervals,/usr/bin/alignmentProjector,/usr/bin/backbone_global_to_local,/usr/bin/bbAnalyze,/usr/bin/bbFilter,/usr/bin/coordinateTranslate,/usr/bin/createBackboneMFA,/usr/bin/extractBCITrees,/usr/bin/getAlignmentWindows,/usr/bin/getOrthologList,/usr/bin/makeBadgerMatrix,/usr/bin/mauveAligner,/usr/bin/mauveToXMFA,/usr/bin/mfa2xmfa,/usr/bin/progressiveMauve,/usr/bin/projectAndStrip,/usr/bin/randomGeneSample,/usr/bin/repeatoire,/usr/bin/scoreAlignment,/usr/bin/stripGapColumns,/usr/bin/stripSubsetLCBs,/usr/bin/toGrimmFormat,/usr/bin/toMultiFastA,/usr/bin/toRawSequence,/usr/bin/uniqueMerCount,/usr/bin/uniquifyTrees,/usr/bin/xmfa2maf" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y progressivemauve || apt-get install -y progressivemauve) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
