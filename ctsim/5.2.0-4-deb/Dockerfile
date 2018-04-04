FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctsim" \ 
    container="ctsim" \ 
    about.summary="Computed tomography simulator" \ 
    about.home="http://www.ctsim.org" \ 
    software.version="5.2.0-4-deb" \ 
    version="1" \ 
    about.copyright="1983-2010 Kevin M. Rosenberg" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/ctsim/copyright" \ 
    extra.binaries="/usr/bin/ctsim,/usr/bin/ctsimtext,/usr/bin/if1,/usr/bin/if2,/usr/bin/ifexport,/usr/bin/ifinfo,/usr/bin/linogram,/usr/bin/phm2helix,/usr/bin/phm2if,/usr/bin/phm2pj,/usr/bin/pj2if,/usr/bin/pjHinterp,/usr/bin/pjinfo,/usr/bin/pjrec" \ 
    about.tags="field::biology, field::medicine, field::medicine:imaging, interface::3d,:commandline,:graphical,:x11,:program, scope::application, uitoolkit::wxwidgets, use::viewing,:3dmodel, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ctsim && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
