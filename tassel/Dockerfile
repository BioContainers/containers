# Base Image
FROM ubuntu

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1.0"
LABEL software="tassel"
LABEL software.version="v5.2.37"
LABEL description="Tassel tool"
LABEL website="http://www.maizegenetics.net/tassel"
LABEL documentation="https://bitbucket.org/tasseladmin/tassel-5-source/wiki/UserManual"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Dat Le <datlequoc96@gmail.com>

RUN conda install -c biobuilds tassel 

