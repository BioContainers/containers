FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="changeo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="changeo" \ 
    about.summary="Repertoire clonal assignment toolkit (Python 3)" \ 
    about.home="http://changeo.readthedocs.io" \ 
    software.version="0.4.5-1-deb" \ 
    upstream.version="0.4.5" \ 
    version="1" \ 
    about.copyright="2015-2018 Namita Gupta" \ 
    about.license="CC-BY-SA-4.0" \ 
    about.license_file="/usr/share/doc/changeo/copyright" \ 
    extra.binaries="/usr/bin/AlignRecords.py,/usr/bin/AssignGenes.py,/usr/bin/BuildTrees.py,/usr/bin/ConvertDb.py,/usr/bin/CreateGermlines.py,/usr/bin/DefineClones.py,/usr/bin/MakeDb.py,/usr/bin/ParseDb.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y changeo || apt-get install -y changeo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
