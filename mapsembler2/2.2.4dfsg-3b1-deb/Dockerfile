FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mapsembler2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mapsembler2" \ 
    about.summary="bioinformatics targeted assembly software" \ 
    about.home="http://colibread.inria.fr/mapsembler2/" \ 
    software.version="2.2.4dfsg-3b1-deb" \ 
    upstream.version="2.2.4" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mapsembler2/copyright" \ 
    about.license_file="/usr/share/doc/mapsembler2/copyright" \ 
    extra.binaries="/usr/bin/mapsembler2_extend,/usr/bin/mapsembler2_extremities,/usr/bin/mapsembler2_kissreads,/usr/bin/mapsembler2_kissreads_graph,/usr/bin/mapsembler_extend,/usr/bin/run_mapsembler2_pipeline" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mapsembler2 || apt-get install -y mapsembler2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
