# Base Image
FROM mambaorg/micromamba:1.5.10-noble

# Matadata
LABEL base.image="mambaorg/micromamba:1.5.10-noble"
LABEL version="1"
LABEL software="micro-sam"
LABEL software.version="1.1.1"
LABEL about.summary="Tools for segmentation and tracking in microscopy build on top of Segment Anything."
LABEL about.home="https://github.com/computational-cell-analytics/micro-sam"
LABEL about.documentation="https://computational-cell-analytics.github.io/micro-sam/micro_sam.html"
LABEL about.license="MIT"
LABEL about.license_file="https://github.com/computational-cell-analytics/micro-sam/blob/master/LICENSE"
LABEL about.tags="Bioinformatics, Image Analysis, Microscopy, Segmentation"

# Maintainer
LABEL maintainer="Anwai Archit <anwai.archit@gmail.com>"
LABEL maintainer="Carolin Schwitalla <carolin-schwitalla@web.de>"


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
RUN pip install git+https://github.com/computational-cell-analytics/micro-sam.git@9b055c3




    
    