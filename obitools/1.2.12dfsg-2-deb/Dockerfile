FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="obitools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="obitools" \ 
    about.summary="programs to analyze NGS data in a DNA metabarcoding context" \ 
    about.home="https://pypi.python.org/pypi/OBITools" \ 
    software.version="1.2.12dfsg-2-deb" \ 
    upstream.version="1.2.12" \ 
    version="1" \ 
    extra.identifiers.biotools="obitools" \ 
    about.copyright="2014 Eric Coissac <eric@coissac.eu>" \ 
    about.license="CeCILL-2.1" \ 
    about.license_file="/usr/share/doc/obitools/copyright" \ 
    extra.binaries="/usr/bin/ali2consensus,/usr/bin/ecodbtaxstat,/usr/bin/ecotag,/usr/bin/ecotaxspecificity,/usr/bin/ecotaxstat,/usr/bin/extractreads,/usr/bin/extractreads2,/usr/bin/illuminapairedend,/usr/bin/ngsfilter,/usr/bin/obiaddtaxids,/usr/bin/obiannotate,/usr/bin/obiclean,/usr/bin/obicomplement,/usr/bin/obiconvert,/usr/bin/obicount,/usr/bin/obicut,/usr/bin/obidistribute,/usr/bin/obiextract,/usr/bin/obigrep,/usr/bin/obihead,/usr/bin/obijoinpairedend,/usr/bin/obipr2,/usr/bin/obisample,/usr/bin/obiselect,/usr/bin/obisilva,/usr/bin/obisort,/usr/bin/obisplit,/usr/bin/obistat,/usr/bin/obisubset,/usr/bin/obitab,/usr/bin/obitail,/usr/bin/obitaxonomy,/usr/bin/obiuniq,/usr/bin/oligotag" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y obitools || apt-get install -y obitools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
