FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sim4db" \ 
    container="sim4db" \ 
    about.summary="batch spliced alignment of cDNA sequences to a target genome" \ 
    about.home="http://kmer.sourceforge.net" \ 
    software.version="020150903r2013-3-deb" \ 
    version="1" \ 
    about.copyright=" 2002 PE Corporation (NY) through the Celera Genomics Group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/sim4db/copyright" \ 
    extra.binaries="/usr/bin/cleanPolishes,/usr/bin/comparePolishes,/usr/bin/convertPolishes,/usr/bin/convertToAtac,/usr/bin/convertToExtent,/usr/bin/depthOfPolishes,/usr/bin/detectChimera,/usr/bin/filterPolishes,/usr/bin/fixPolishesIID,/usr/bin/headPolishes,/usr/bin/mappedCoverage,/usr/bin/mergePolishes,/usr/bin/parseSNP,/usr/bin/pickBestPolish,/usr/bin/pickUniquePolish,/usr/bin/plotCoverageVsIdentity,/usr/bin/realignPolishes,/usr/bin/removeDuplicate,/usr/bin/reportAlignmentDifferences,/usr/bin/sim4db,/usr/bin/sortPolishes,/usr/bin/summarizePolishes,/usr/bin/uniqPolishes,/usr/bin/vennPolishes" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sim4db && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
