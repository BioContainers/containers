FROM mambaorg/micromamba:1.5.10-noble

# Copy conda.yml and install dependencies
COPY --chown=$MAMBA_USER:$MAMBA_USER conda.yml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba env export --name base --explicit > environment.lock \
    && echo ">> CONDA_LOCK_START" \
    && cat environment.lock \
    && echo "<< CONDA_LOCK_END" \
    && micromamba clean -a -y

# Set the environment path
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"

USER root

# clone the repository and install the package
RUN git clone https://github.com/computational-cell-analytics/micro-sam.git \
    && cd micro-sam \
    && pip install -e .