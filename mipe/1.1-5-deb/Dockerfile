FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mipe" \ 
    container="mipe" \ 
    about.summary="Tools to store PCR-derived data" \ 
    about.home="http://mipe.sourceforge.net" \ 
    software.version="1.1-5-deb" \ 
    version="1" \ 
    about.copyright=" 2003-2005 Jan Aerts <jan.aerts@bbsrc.ac.uk>" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/mipe/copyright" \ 
    extra.binaries="/usr/bin/csv2mipe,/usr/bin/genotype2mipe,/usr/bin/mipe06to07,/usr/bin/mipe08to09,/usr/bin/mipe0_9to1_0,/usr/bin/mipe2dbSTS,/usr/bin/mipe2fas,/usr/bin/mipe2genotypes,/usr/bin/mipe2html,/usr/bin/mipe2pcroverview,/usr/bin/mipe2pcrprimers,/usr/bin/mipe2putativesbeprimers,/usr/bin/mipe2sbeprimers,/usr/bin/mipe2snps,/usr/bin/mipeCheckSanity,/usr/bin/removePcrFromMipe,/usr/bin/removeSbeFromMipe,/usr/bin/removeSnpFromMipe,/usr/bin/sbe2mipe,/usr/bin/snp2mipe,/usr/bin/snpPosOnDesign,/usr/bin/snpPosOnSource" \ 
    about.tags="field::biology, field::biology:bioinformatics, field::biology:molecular,:perl, interface::commandline, role::TODO,:documentation,:program, scope::utility, use::organizing,:xml, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mipe && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
