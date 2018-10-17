FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="epigrass" \ 
    container="epigrass" \ 
    about.summary="scientific tool for simulations and scenario analysis in network epidemiology" \ 
    about.home="http://pypi.python.org/pypi/epigrass/" \ 
    software.version="2.4.7-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2010, Flvio Codeo Coelho <fccoelho@fiocruz.br>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/epigrass/copyright" \ 
    extra.binaries="/usr/bin/epgeditor,/usr/bin/epigrass,/usr/bin/epirunner,/usr/bin/neteditor" \ 
    about.tags="field::medicine, implemented-in::python, interface::graphical,:x11, role::program, scope::application, uitoolkit::qt,:TODO,:analysing,:viewing, works-with-format::TODO,:db, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y epigrass && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
