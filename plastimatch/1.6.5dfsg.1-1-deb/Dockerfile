FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plastimatch" \ 
    container="plastimatch" \ 
    about.summary="medical image reconstruction and registration" \ 
    about.home="http://plastimatch.org" \ 
    software.version="1.6.5dfsg.1-1-deb" \ 
    version="1" \ 
    about.copyright="(c) 2004-2015 Massachusetts General Hospital" \ 
    about.license="Plastimatch-license" \ 
    about.license_file="/usr/share/doc/plastimatch/copyright" \ 
    extra.binaries="/usr/bin/drr,/usr/bin/fdk,/usr/bin/landmark_warp,/usr/bin/plastimatch" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, use::viewing, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y plastimatch && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
