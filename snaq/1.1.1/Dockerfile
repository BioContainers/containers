FROM biocontainers/biocontainers:v1.0.0_cv5

LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="1"
LABEL software="SNaQ"
LABEL software.version="1.1.1"
LABEL about.summary="Maximum pseudolikelihood estimation of species network"
LABEL about.home="https://github.com/JuliaPhylo/SNaQ.jl"
LABEL about.documentation="https://juliaphylo.github.io/SNaQ.jl/dev/"
LABEL about.license_file="https://github.com/JuliaPhylo/SNaQ.jl/blob/main/LICENSE"
LABEL about.license="MIT"
LABEL extra.identifiers.biotools="snaq"
LABEL about.tags="Phylogenetics"

MAINTAINER Alexander Ramos-Diaz <ra.ramos.diaz@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://install.julialang.org | sh -s -- -y

ENV PATH="/home/biodocker/.juliaup/bin:$PATH"

RUN julia -e 'using Pkg; Pkg.add(name="SNaQ", version="1.1.1")'