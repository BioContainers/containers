# BASE IMAGE, Stage 1 #########################################################################################################

FROM ubuntu:20.04 AS build

RUN apt-get update --fix-missing && apt-get install -y sudo apt-utils --fix-missing
RUN sudo apt-get update --fix-missing && sudo apt-get install -y wget gcc --fix-missing

RUN groupadd --gid 1000 patchwork \
    && useradd --uid 1000 --gid patchwork --shell /bin/bash --create-home patchwork \
    && chmod -R a+rwx /home/patchwork
WORKDIR /home/patchwork
USER patchwork
ENV VERSION 0.5.2

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.3-linux-x86_64.tar.gz \
    && tar xzvf julia-1.8.3-linux-x86_64.tar.gz 
RUN wget http://github.com/bbuchfink/diamond/releases/download/v2.0.13/diamond-linux64.tar.gz \
    && tar xvzf diamond-linux64.tar.gz
ENV PATH /home/patchwork/julia-1.8.3/bin:$PATH
RUN wget https://github.com/fethalen/Patchwork/archive/v$VERSION.tar.gz \
    && tar xvzf v$VERSION.tar.gz && cd Patchwork-$VERSION \ 
    && julia --project=. -e "import Pkg; Pkg.instantiate()" \
    && julia --project=. src/compile.jl . src/precompiled.jl ../patchwork-$VERSION


# To reduce the final image size, use a multi-stage build:
# The final image doesn't contain a Julia installation, just Ubuntu as base image, the Patchwork binary and DIAMOND. 

# BASE IMAGE, Stage 2 #########################################################################################################

FROM ubuntu:20.04

# METADATA ####################################################################################################################

LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="Patchwork"
LABEL software.version="0.5.2"
LABEL about.author="Felix Thalén <felix.thalen@uni-goettingen.de>"
LABEL about.summary="Alignment-based Exon Retrieval and Concatenation with Phylogenomic Applications"
LABEL about.home="https://github.com/fethalen/Patchwork"
LABEL about.documentation="https://github.com/fethalen/Patchwork#readme"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.license_file="https://github.com/fethalen/Patchwork/blob/main/LICENSE"
LABEL about.tags="phylogenomics"

# MAINTAINER ##################################################################################################################

# MAINTAINER Felix Thalén <felix.thalen@uni-goettingen.de>

# BUILD #######################################################################################################################

RUN groupadd --gid 1000 patchwork \
    && useradd --uid 1000 --gid patchwork --shell /bin/bash --create-home patchwork \
    && chmod -R a+rwx /home/patchwork
WORKDIR /home/patchwork
USER patchwork
ENV VERSION 0.5.2

COPY --from=build /home/patchwork/patchwork-$VERSION patchwork-$VERSION
COPY --from=build /home/patchwork/diamond diamond
RUN ln -s patchwork-$VERSION/bin/patchwork patchwork
ENV PATH /home/patchwork:$PATH

CMD patchwork --help