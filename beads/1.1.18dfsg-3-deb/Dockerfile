FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="beads" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="beads" \ 
    about.summary="2-DE electrophoresis gel image spot detection" \ 
    about.home="http://moulon.inra.fr/beads/beads.html" \ 
    software.version="1.1.18dfsg-3-deb" \ 
    upstream.version="1.1.18" \ 
    version="1" \ 
    extra.identifiers.biotools="beads" \ 
    about.copyright="2008-2010 Michel Zivy <zivy@moulon.inra.fr>, Olivier Langella <olivier.langella@moulon.inra.fr>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/beads/copyright" \ 
    extra.binaries="/usr/bin/beads,/usr/bin/qtbeads" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y beads || apt-get install -y beads) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
