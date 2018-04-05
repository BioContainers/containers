FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sleepyhead" \ 
    container="sleepyhead" \ 
    about.summary="Sleep tracking software with a focus on monitoring CPAP treatment" \ 
    about.home="http://sleepyhead.sourceforge.net" \ 
    software.version="1.0.0-beta-2dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sleepyhead/copyright" \ 
    extra.binaries="/usr/bin/SleepyHead" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::timekeeping, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sleepyhead && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
