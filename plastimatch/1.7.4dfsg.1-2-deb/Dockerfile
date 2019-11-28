FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plastimatch" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plastimatch" \ 
    about.summary="medical image reconstruction and registration" \ 
    about.home="http://plastimatch.org" \ 
    software.version="1.7.4dfsg.1-2-deb" \ 
    upstream.version="1.7.4" \ 
    version="1" \ 
    about.copyright="(c) 2004-2015 Massachusetts General Hospital" \ 
    about.license="Plastimatch-license" \ 
    about.license_file="/usr/share/doc/plastimatch/copyright" \ 
    extra.binaries="/usr/bin/drr,/usr/bin/fdk,/usr/bin/landmark_warp,/usr/bin/plastimatch" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, use::viewing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plastimatch || apt-get install -y plastimatch) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
