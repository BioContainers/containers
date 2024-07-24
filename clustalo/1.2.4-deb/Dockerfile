FROM debian:trixie-slim
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>

LABEL version="1.2.4"
LABEL about.summary="Making accurate alignments of many protein sequences"
LABEL software="Clustal Omega"
LABEL software.version="1.2.4"
LABEL about.tags="Genomics"
LABEL about.home="http://www.clustal.org/omega/"
LABEL about.license="GPL-3.0"
LABEL about.author="Wang, Liguo"


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clustalo=1.2.4-8 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
