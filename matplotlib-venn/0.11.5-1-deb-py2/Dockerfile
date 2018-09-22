FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="matplotlib-venn" \ 
    container="matplotlib-venn" \ 
    about.summary="Python plotting area-proportional two- and three-way Venn diagrams" \ 
    about.home="https://pypi.python.org/pypi/matplotlib-venn" \ 
    software.version="0.11.5-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2012-2015 Konstantin Tretyakov <kt@ut.ee>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/matplotlib-venn/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-matplotlib-venn && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
