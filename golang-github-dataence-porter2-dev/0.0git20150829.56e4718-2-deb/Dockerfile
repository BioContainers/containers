FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="golang-github-dataence-porter2-dev" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="golang-github-dataence-porter2-dev" \ 
    about.summary="native Go high-performance Porter2 stemmer for English" \ 
    about.home="https://github.com/dataence/porter2" \ 
    software.version="0.0git20150829.56e4718-2-deb" \ 
    version="1" \ 
    about.copyright="2014, 2015 Dataence, LLC <zhenjl@gmail.com>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/golang-github-dataence-porter2-dev/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y golang-github-dataence-porter2-dev || apt-get install -y golang-github-dataence-porter2-dev) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
