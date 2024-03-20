# Base Image
FROM continuumio/miniconda3:4.6.14

# Metadata
LABEL    software="seeksoultools" \ 
    base_image="continuumio/miniconda3:4.6.14" \
    container="seeksoultools" \ 
    about.summary="Software developed by SEEKGENE for processing single-cell transcriptome data" \ 
    about.home="https://www.seekgene.com/fxrj" \ 
    about.documentation="http://seeksoul.seekgene.com/en/v1.2.0/index.html" \
    software.version="1.2.0" \ 
    version="1" \ 
    about.copyright="2023 SeekGene BioSciences" \ 
    about.license="Not in the SPDX list, free of charge" \ 
    about.license_file="/seeksoultools.1.2.0/lib/python3.10/site-packages/seeksoultools-1.2.0.dist-info/LICENSE" \ 
    about.tags=""

# Maintainer
LABEL maintainer="Evgeny Karpulevich <karpulevich@gmail.com>"

SHELL ["/bin/bash", "-c"]

RUN mkdir seeksoultools.1.2.0 && cd seeksoultools.1.2.0 && wget -c -O seeksoultools.1.2.0.tar.gz "https://seekgene-public.oss-cn-beijing.aliyuncs.com/software/seeksoultools/seeksoultools.1.2.0.tar.gz" && tar zxf seeksoultools.1.2.0.tar.gz; . /seeksoultools.1.2.0/bin/activate && /seeksoultools.1.2.0/bin/conda-unpack && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* seeksoultools.1.2.0.tar.gz

USER biodocker

ENV PATH /seeksoultools.1.2.0/bin:$PATH

WORKDIR /data/

