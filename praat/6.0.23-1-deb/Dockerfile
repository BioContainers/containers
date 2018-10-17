FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="praat" \ 
    container="praat" \ 
    about.summary="program for speech analysis and synthesis" \ 
    about.home="http://www.praat.org" \ 
    software.version="6.0.23-1-deb" \ 
    version="1" \ 
    about.copyright="1990-2016 Paul Boersma" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/praat/copyright" \ 
    extra.binaries="/usr/bin/praat,/usr/bin/praat-open-files,/usr/bin/sendpraat" \ 
    about.tags="field::linguistics, field::medicine, implemented-in::c++,:graphical,:x11, role::program,:application, uitoolkit::gtk, uitoolkit::motif,:wav, works-with::audio, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y praat && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
