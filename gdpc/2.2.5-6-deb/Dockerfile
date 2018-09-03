FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gdpc" \ 
    container="gdpc" \ 
    about.summary="visualiser of molecular dynamic simulations" \ 
    about.home="http://www.frantz.fi/software/gdpc.php" \ 
    software.version="2.2.5-6-deb" \ 
    version="1" \ 
    about.copyright=" 1999-2009 Jonas Frantz <jonas.frantz@welho.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gdpc/copyright" \ 
    extra.binaries="/usr/bin/gdpc" \ 
    about.tags="field::biology, field::biology:structural, field::chemistry,:physics, implemented-in::c, interface::graphical,:x11, role::program, scope::application, uitoolkit::gtk,:viewing, works-with-format::jpg, works-with-format::png,:3dmodel,:image,:video,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gdpc && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
