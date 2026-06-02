FROM biocontainers/biocontainers:v1.0.0_cv5

LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="1"
LABEL software="PhyloNetworks"
LABEL software.version="1.3.1"
LABEL about.summary="PhyloNetworks is a Julia package with utilities to to handle phylogenetic trees and networks"
LABEL about.home="https://github.com/JuliaPhylo/PhyloNetworks.jl"
LABEL about.documentation="https://juliaphylo.github.io/PhyloNetworks.jl/dev/"
LABEL about.license_file="https://github.com/JuliaPhylo/PhyloNetworks.jl/blob/master/LICENSE.md"
LABEL about.license="MIT"
LABEL extra.identifiers.biotools=""
LABEL about.tags="Phylogenetics"

MAINTAINER Alexander Ramos-Diaz <ra.ramos.diaz@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://install.julialang.org | sh -s -- -y

ENV PATH="/home/biodocker/.juliaup/bin:$PATH"

RUN julia -e 'using Pkg; Pkg.add(name="PhyloNetworks", version="1.3.1")'