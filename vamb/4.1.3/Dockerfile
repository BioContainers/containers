FROM --platform=linux/amd64 mambaorg/micromamba:1.5.1

ARG MAMBA_DOCKERFILE_ACTIVATE=1
ENV PATH=/opt/conda/bin:$PATH

COPY --chown=$MAMBA_USER:$MAMBA_USER env_vamp.yaml /tmp/env_vamp.yaml

RUN micromamba install -y -n base -f /tmp/env_vamp.yaml && \
    micromamba clean --all --yes

RUN pip install vamb==4.1.3
