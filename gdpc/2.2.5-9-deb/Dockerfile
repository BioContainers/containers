FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gdpc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gdpc" \ 
    about.summary="visualiser of molecular dynamic simulations" \ 
    about.home="https://web.archive.org/web/20180212152753/http://www.frantz.fi/software/gdpc.php" \ 
    software.version="2.2.5-9-deb" \ 
    upstream.version="2.2.5" \ 
    version="1" \ 
    about.copyright=" 1999-2009 Jonas Frantz <jonas.frantz@welho.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gdpc/copyright" \ 
    extra.binaries="/usr/bin/gdpc" \ 
    about.tags="field::biology, field::biology:structural, field::chemistry,:physics, implemented-in::c, interface::commandline,:graphical,:x11, role::program,:application, uitoolkit::gtk, use::viewing,:jpg,:png, works-with::3dmodel,:image,:image:raster,:video,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gdpc || apt-get install -y gdpc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
