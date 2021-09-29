FROM continuumio/miniconda3

LABEL base_image="continuumio/miniconda3"
LABEL version="1"
LABEL software="cellpose"
LABEL software.version="0.6.5"
LABEL about.summary="A generalist algorithm for cell and nucleus segmentation."
LABEL about.home="https://github.com/MouseLand/cellpose"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://raw.githubusercontent.com/MouseLand/cellpose/master/LICENSE"
LABEL about.documentation="https://cellpose.readthedocs.io/en/latest/"
LABEL extra.identifiers.biotools=cellpose
LABEL maintainer ="sunyi000@gmail.com"

ARG DEBIAN_FRONTEND="noninteractive"

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8 \
    LANGUAGE en_US:en  \
    PATH=/opt/conda/envs/env/bin:$PATH

RUN apt-get update -qq && \
    apt-get install -y -q --no-install-recommends \
            apt-utils \
            bzip2 \
            ca-certificates \
            curl \
            locales \
            unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

RUN chmod 777 /opt && \
    chmod a+s /opt 

COPY environment.yml /opt/environment.yml

RUN conda env create --name cellpose --file /opt/environment.yml && \
    conda run -n cellpose python -m pip install cellpose

SHELL ["conda", "run", "-n", "cellpose", "python", "-m","cellpose"]

WORKDIR /cellpose

#ENTRYPOINT ["conda", "run", "-n", "cellpose", "python", "-m", "cellpose"]

