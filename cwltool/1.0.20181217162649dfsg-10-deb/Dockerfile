FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cwltool" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cwltool" \ 
    about.summary="Common Workflow Language reference implementation" \ 
    about.home="http://www.commonwl.org" \ 
    software.version="1.0.20181217162649dfsg-10-deb" \ 
    upstream.version="1.0.20181217162649" \ 
    version="1" \ 
    about.copyright="2014-2018 CWL, a project of Software Freedom Conservancy" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/cwltool/copyright" \ 
    extra.binaries="/usr/bin/cwltool" \ 
    about.tags="admin::automation, admin::virtualization, field::astronomy,:biology,:biology:bioinformatics,:biology:molecular,:biology:structural,:medicine,:physics, implemented-in::python, interface::commandline,:program, science::calculation, scope::utility, system::cloud,:laptop,:server,:virtual, use::analysing,:filtering, works-with-format::TODO, works-with::semantic-data,:software:package" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cwltool || apt-get install -y cwltool) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
