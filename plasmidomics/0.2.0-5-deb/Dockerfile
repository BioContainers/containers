FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plasmidomics" \ 
    container="plasmidomics" \ 
    about.summary="draw plasmids and vector maps with PostScript graphics export" \ 
    about.home="https://www.ira.cinvestav.mx/Investigaci%C3%B3n/Biotecnolog%C3%ADayBioqu%C3%ADmica/ProfesoresInvestigadores/DrRobertWinkler/Software/PlasmidDrawingProgramPlasmidomics02/tabid/778/language/en-US/Default.aspx" \ 
    software.version="0.2.0-5-deb" \ 
    version="1" \ 
    about.copyright=" 2007 Robert Winkler <robert.winkler@ira.cinvestav.mx>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/plasmidomics/copyright" \ 
    extra.binaries="/usr/bin/plasmid" \ 
    about.tags="field::biology, field::biology:molecular, implemented-in::python,:graphical,:x11, role::program, scope::utility,:tk, use::TODO, works-with-format::postscript,:TODO,:image:vector, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y plasmidomics && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
