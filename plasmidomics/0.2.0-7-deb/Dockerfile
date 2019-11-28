FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plasmidomics" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plasmidomics" \ 
    about.summary="draw plasmids and vector maps with PostScript graphics export" \ 
    about.home="https://www.ira.cinvestav.mx/Investigaci%C3%B3n/Biotecnolog%C3%ADayBioqu%C3%ADmica/ProfesoresInvestigadores/DrRobertWinkler/Software/PlasmidDrawingProgramPlasmidomics02/tabid/778/language/en-US/Default.aspx" \ 
    software.version="0.2.0-7-deb" \ 
    upstream.version="0.2.0" \ 
    version="1" \ 
    about.copyright=" 2007 Robert Winkler <robert.winkler@ira.cinvestav.mx>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/plasmidomics/copyright" \ 
    extra.binaries="/usr/bin/plasmid" \ 
    about.tags="field::biology, field::biology:molecular, implemented-in::python,:commandline,:graphical,:x11,:program, scope::utility, uitoolkit::tk, use::TODO,:postscript, works-with::TODO, works-with::image,:image:vector,:text, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plasmidomics || apt-get install -y plasmidomics) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
