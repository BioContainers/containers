FROM mambaorg/micromamba:1.5.3

ARG CADD_VERSION=1.6

MAINTAINER "Marius Bjoernstad" <pmb@fa2k.net>
LABEL software="cadd-scripts-with-envs" \
    software.version="${CADD_VERSION}" \
    version="1" \
    about.summary="CADD is a tool for scoring the deleteriousness of single nucleotide variants as well as insertion/deletions variants in the human genome" \
    about.home="https://cadd.gs.washington.edu/" \
    about.documentation="https://github.com/BioContainers/containers/blob/master/cadd-scripts-with-envs/1.6/README.md" \
    about.license="Custom License" \
    about.license_file="https://github.com/kircherlab/CADD-scripts/blob/v1.6.post1/LICENSE" \
    extra.binaries="/opt/conda/bin/cadd.sh" \
    about.tags="Genomics, Human geneitcs" \
    base_image="mambaorg/micromamba:1.5.3"

# Need to be root to install apt packages
USER root

# Install ps command required by some tools
RUN apt-get update && apt-get install -y procps && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*

# Install CADD scripts and mamba. mamba is required by snakemake (as it provides the conda command).
# bgzip (tabix package) is required by the pipeline.
RUN micromamba install -y -c conda-forge -c bioconda -n base cadd-scripts=$CADD_VERSION mamba tabix && \
        micromamba clean --all --yes

# Ensure that the conda binaries are on the path
ENV PATH=/opt/conda/bin:/opt/conda/condabin:$PATH

# Run snakemake to include the necessary conda environments inside the container
RUN cd $( dirname $(ls /opt/conda/share/cadd-scripts-${CADD_VERSION}*/CADD.sh ) ) && \
	snakemake -j 1 test/input.tsv.gz --use-conda --conda-create-envs-only --conda-prefix envs \
        	--configfile config/config_GRCh38_v${CADD_VERSION}.yml --snakefile Snakefile

