FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gnumed-client" \ 
    container="gnumed-client" \ 
    about.summary="medical practice management - Client" \ 
    about.home="http://www.gnumed.de" \ 
    software.version="1.6.11dfsg-3-deb" \ 
    version="1" \ 
    about.copyright=" 2000-2005 Horst Herb, a.o." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gnumed-client/copyright" \ 
    extra.binaries="/usr/bin/gm-convert_file,/usr/bin/gm-create_datamatrix,/usr/bin/gm-describe_file,/usr/bin/gm-import_incoming,/usr/bin/gm-print_doc,/usr/bin/gm_ctl_client,/usr/bin/gnumed" \ 
    about.tags="field::medicine, implemented-in::python, interface::graphical,:x11, network::client, role::program, scope::application,:wxwidgets, use::TODO, use::organizing,:TODO, works-with::TODO, works-with::db,:people, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gnumed-client && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
