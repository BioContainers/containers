FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sleepyhead" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sleepyhead" \ 
    about.summary="Sleep tracking software with a focus on monitoring CPAP treatment" \ 
    about.home="https://sleepyhead.jedimark.net/" \ 
    software.version="1.0.0-beta-2dfsg-6-deb" \ 
    upstream.version="1.0.0" \ 
    version="1" \ 
    about.copyright="2011-2014 Mark Watkins <jedimark@users.sourceforge.net>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/sleepyhead/copyright" \ 
    extra.binaries="/usr/bin/SleepyHead" \ 
    about.tags="field::medicine, implemented-in::c++, interface::graphical,:x11, role::program, science::data-acquisition,:qt, use::timekeeping, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sleepyhead || apt-get install -y sleepyhead) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
