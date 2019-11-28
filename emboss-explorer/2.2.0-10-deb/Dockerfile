FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="emboss-explorer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="emboss-explorer" \ 
    about.summary="web-based GUI to EMBOSS" \ 
    about.home="http://embossgui.sourceforge.net/" \ 
    software.version="2.2.0-10-deb" \ 
    upstream.version="2.2.0" \ 
    version="1" \ 
    about.copyright=" 2004-2006 Luke McCarthy" \ 
    about.license="GPL-1+ or Artistic-1" \ 
    about.license_file="/usr/share/doc/emboss-explorer/copyright" \ 
    extra.binaries="/usr/bin/acdcheck,/usr/bin/mkstatic" \ 
    about.tags="biology::emboss, field::biology, field::biology:bioinformatics,:perl, interface::web, role::plugin, role::program,:TODO, web::application, web::cgi" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y emboss-explorer || apt-get install -y emboss-explorer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
