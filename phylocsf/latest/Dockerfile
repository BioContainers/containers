# Basic Dockerfile for PhyloCSF.
# Example usage:
#   docker build -t mlin:PhyloCSF https://gist.githubusercontent.com/mlin/31c0a7623f99d3bf3222/raw/Dockerfile
#   docker run -v /path/to/host/data:/data mlin:PhyloCSF 29mammals /data/input.fa
# PhyloCSF homepage: https://github.com/mlin/PhyloCSF/wiki
FROM ubuntu:trusty

#####AUTO GENERATED LABELS#####
LABEL autogen="yes" \ 
    version="1" \ 
	software="phylocsf" \ 
	software.version="latest" \ 
	about.home="https://github.com/mlin/PhyloCSF/wiki" \ 
    about.summary="PhyloCSF is a method to determine whether a multi-species nucleotide sequence alignment is likely to represent a protein-coding region." \ 
	about.license="SPDX:AGPL-3.0-only" \ 
    about.license_file="https://github.com/mlin/PhyloCSF/blob/master/LICENSE" \ 
    base_image="ubuntu:trusty"
#####END OF INSERTION#####
MAINTAINER Mike Lin <mlin@mlin.net>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-suggests --no-install-recommends ca-certificates software-properties-common time git build-essential gfortran 
RUN add-apt-repository ppa:avsm/ppa
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-suggests --no-install-recommends -y ocaml camlp4 camlp4-extra opam libgsl0-dev m4 pkg-config
RUN opam init
RUN opam install -y batteries gsl ocaml-twt forkwork ounit should
RUN git clone --depth=1 git://github.com/mlin/PhyloCSF.git
WORKDIR /PhyloCSF
RUN eval $(opam config env) && make FORKWORK=1 && make -C src FORKWORK=1 testexe
ENV TIME \n    \t%E real,\t%U user,\t%S sys
RUN ["/bin/bash","-c","cd src && time ./test.native"]
ENTRYPOINT ["/PhyloCSF/PhyloCSF"]
