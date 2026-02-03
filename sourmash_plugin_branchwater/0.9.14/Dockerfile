# Base Image
FROM mambaorg/micromamba:ubuntu24.04

# Metadata
LABEL base.image="mambaorg/micromamba:ubuntu24.04"
LABEL version="1"
LABEL software="sourmash_plugin_branchwater"
LABEL software.version="0.9.14"
LABEL about.summary="Fast search and gather extensions for sourmash"
LABEL about.home="https://github.com/sourmash-bio/sourmash_plugin_branchwater"
LABEL about.documentation="https://github.com/sourmash-bio/sourmash_plugin_branchwater"
LABEL about.license="AGPL-3.0-only"
LABEL about.license_file="https://github.com/sourmash-bio/sourmash_plugin_branchwater?tab=AGPL-3.0-1-ov-file#readme"
LABEL about.tags="kmers, metagenomics"

# Maintainer
LABEL maintainer="Danil Zilov <zilov.d@gmail.com"

# Copy conda.yml and install dependencies
COPY --chown=$MAMBA_USER:$MAMBA_USER conda.yml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml && micromamba clean -a -y

# Set the environment path
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"

USER root
# Verify installation
RUN sourmash --version && sourmash scripts multisearch --help
