FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ampliconnoise" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ampliconnoise" \ 
    about.summary="removal of noise from 454 sequenced PCR amplicons" \ 
    about.home="https://github.com/lanzen/ampliconnoise" \ 
    software.version="1.29-8-deb" \ 
    upstream.version="1.29" \ 
    version="1" \ 
    about.copyright=" 2009-2011 Christopher Quince <quince@civil.gla.ac.uk>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/ampliconnoise/copyright" \ 
    extra.binaries="/usr/bin/FCluster,/usr/bin/FastaUnique,/usr/bin/NDist,/usr/bin/Perseus,/usr/bin/PerseusD,/usr/bin/PyroDist,/usr/bin/PyroNoise,/usr/bin/PyroNoiseA,/usr/bin/PyroNoiseM,/usr/bin/SeqDist,/usr/bin/SeqNoise,/usr/bin/SplitClusterClust,/usr/bin/SplitClusterEven" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ampliconnoise || apt-get install -y ampliconnoise) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
