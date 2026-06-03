FROM biocontainers/biocontainers:v1.0.0_cv5

LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="1"
LABEL software="PhyNEST"
LABEL software.version="0.1.12"
LABEL about.summary="Phylogenetic Network Estimation using SiTe patterns"
LABEL about.home="https://github.com/sungsik-kong/PhyNEST.jl"
LABEL about.documentation="https://sungsik-kong.github.io/PhyNEST.jl/stable/"
LABEL about.license_file="https://github.com/sungsik-kong/PhyNEST.jl/blob/main/LICENSE"
LABEL about.license="MIT"
LABEL extra.identifiers.biotools=""
LABEL about.tags="Phylogenetics"

MAINTAINER Alexander Ramos-Diaz <ra.ramos.diaz@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://install.julialang.org | sh -s -- -y

ENV PATH="/home/biodocker/.juliaup/bin:$PATH"

RUN julia -e 'using Pkg; Pkg.add(name="PhyNEST", version="0.1.12")'