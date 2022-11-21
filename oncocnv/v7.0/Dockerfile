FROM ubuntu:20.04 AS download
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates=20211016~20.04.1 \
      git=1:2.25.1-1ubuntu3.6 && \
    rm -rf /var/lib/apt/lists/*
RUN git clone -b v7.0 --depth 1 https://github.com/BoevaLab/ONCOCNV.git

FROM ubuntu:20.04
LABEL base_image="ubuntu:20.04" \
      version="2" \
      software="ONCOCNV" \
      software.version="v7.0" \
      about.summary="ONCOCNV - a package to detect copy number changes in Deep Sequencing data" \
      about.home="https://github.com/BoevaLab/ONCOCNV" \
      about.documentation="https://github.com/BoevaLab/ONCOCNV/blob/master/README.md" \
      about.license="GNU General Public License v3.0" \
      extra.identifiers.biotools="oncocnv" \
      maintainer="Martin Rippin martin.rippin@helse-bergen.no"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bedtools=2.27.1+dfsg-4ubuntu1 \
      build-essential=12.8ubuntu1.1 \
      gfortran=4:9.3.0-1ubuntu2 \
      liblapack-dev=3.9.0-1build1 \
      libblas-dev=3.9.0-1build1 \
      perl=5.30.0-9ubuntu0.3 \
      r-base=3.6.3-2 \
      samtools=1.10-3 \
      && \
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages('remotes')" && \
    R -e "remotes::install_version('cghseg',upgrade='never', version = '1.0.5')" && \
    R -e "remotes::install_version('cwhmisc',upgrade='never', version = '6.6')" && \
    R -e "remotes::install_version('digest',upgrade='never', version = '0.6.29')" && \
    R -e "remotes::install_version('fastICA',upgrade='never', version = '1.2-2')" && \
    R -e "remotes::install_version('MASS',upgrade='never', version = '7.3-55')" && \
    R -e "remotes::install_version('mclust',upgrade='never', version = '5.4.9')" && \
    R -e "remotes::install_version('PSCBS',upgrade='never', version = '0.66.0')" && \
    R -e "remotes::install_version('scales',upgrade='never', version = '1.1.1')" && \
    R -e "remove.packages('remotes')" && \
    R -e "install.packages('BiocManager')" && \
    R -e "BiocManager::install('DNAcopy')" && \
    R -e "remove.packages('BiocManager')"
COPY --from=download /ONCOCNV/src/*.R /usr/local/bin/
COPY --from=download /ONCOCNV/src/*.pl /usr/local/bin/
RUN chmod -R a+rwx /usr/local/bin
