# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="PyMol-Jupyter"
LABEL software.version="1"
LABEL description="a portable way of interacting with PyMol via Jupyter notebook"
LABEL website="http://github.com/ocramz/jupyter-docker-pymol"
LABEL documentation="http://github.com/ocramz/jupyter-docker-pymol"
LABEL license="http://github.com/ocramz/jupyter-docker-pymol"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Marco Zocca <zoccaNO.marcoSP@gmailAM.com>

# Environment variables
ENV PYMOL_VERSION_G 1.8
ENV PYMOL_VERSION 1.8.2.0
ENV PYMOL_SHA 6181024fe3f0107f57fcd02914b96747881272ade4fd0f3419784c972debce66

ENV TINI_VER v0.9.0
ENV TINI_SHA faafbfb5b079303691a939a747d7f60591f2143164093727e870b289a44d9872

ENV MINICONDA_VER_G 3
ENV MINICONDA_VER 3.19.0
ENV MINICONDA_VER_BUMP 3.19.1
ENV MINICONDA_SHA 9ea57c0fdf481acf89d816184f969b04bc44dea27b258c4e86b1e3a25ff26aa0

ENV NOTEBOOK_VER 4.2
ENV JUPYTERHUB_VER 0.5

ENV USER biodocker

ENV IPYNBS_DIR /home/${USER}/notebooks/iPyMol
ENV DL_DIR /home/${USER}/tmp

ENV CONDA_DIR /opt/conda
ENV PATH ${CONDA_DIR}/bin:${PATH}
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

USER root

# Setup `biodocker` home directory
RUN mkdir -p ${CONDA_DIR}                && \
    chown ${USER} ${CONDA_DIR}           && \
    mkdir -p ${DL_DIR}                   && \
    chown ${USER} ${DL_DIR}              && \
    mkdir -p ${IPYNBS_DIR}               && \
    chown ${USER} ${IPYNBS_DIR}          && \
    mkdir /home/${USER}/work             && \
    chown ${USER} /home/${USER}/work     && \
    mkdir /home/${USER}/.jupyter         && \
    chown ${USER} /home/${USER}/.jupyter && \
    mkdir /home/${USER}/.local           && \
    chown ${USER} /home/${USER}/.local   && \
    echo "cacert=/etc/ssl/certs/ca-certificates.crt" > /home/${USER}/.curlrc && \
    chown ${USER} /home/${USER}/.curlrc


# Add example notebook
ADD ipymol/ ${IPYNBS_DIR}


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    pkg-config \
    language-pack-en-base \
    locales &&\
    \
    echo -e "en_US.UTF-8 UTF-8\nLC_ALL=\"en_US.UTF-8\"" > /etc/locale.gen && \
    locale-gen && \
    update-locale && \
    dpkg-reconfigure locales && \
    \
    apt-get install -y --no-install-recommends sudo \
    build-essential\
    bzip2 \
    ca-certificates \
    emacs \
    git \
    jed \
    libsm6 \
    libxrender1 \
    make \
    pandoc \
    python-pip \
    python-dev \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-zmq \
    python3-pip \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    freeglut3 \
    freeglut3-dev \
    glew-utils \
    liblcms2-dev \
    libfreetype6 \
    libfreetype6-dev \
    libglew-dev \
    libjpeg8-dev \
    libpng3 libpng12-dev \
    libpng-dev \
    libtiff4-dev \
    libwebp-dev \
    libxml2-dev \
    pmw \
    python-tk \
    python3-scipy \
    python3-nose \
    tcl8.5-dev \
    tk8.5-dev \
    zlib1g-dev && \
    \
    apt-get clean && \
    apt-get purge && \
    \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use bash rather than sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


WORKDIR ${DL_DIR}

# Install Tini (Jupyter dep.)
RUN wget --quiet https://github.com/krallin/tini/releases/download/${TINI_VER}/tini && \
    echo "${TINI_SHA} *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini



USER ${USER}


# Install conda as `biodocker`
RUN mkdir -p ${CONDA_DIR} && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VER}-Linux-x86_64.sh && \
    echo "${MINICONDA_SHA} *Miniconda${MINICONDA_VER_G}-${MINICONDA_VER}-Linux-x86_64.sh" | sha256sum -c - && \
    /bin/bash Miniconda${MINICONDA_VER_G}-${MINICONDA_VER}-Linux-x86_64.sh -f -b -p ${CONDA_DIR} && \
    rm Miniconda3-${MINICONDA_VER}-Linux-x86_64.sh && \
    ${CONDA_DIR}/bin/conda install --quiet --yes conda==${MINICONDA_VER_BUMP} && \
    ${CONDA_DIR}/bin/conda config --system --add channels conda-forge && \
    conda clean -tipsy


# Install Jupyter notebook as `biodocker`
RUN conda install --quiet --yes \
    "notebook=${NOTEBOOK_VER}*" \
    terminado \
    && conda clean -tipsy



# Install JupyterHub to get the jupyterhub-singleuser startup script
RUN pip install --upgrade pip && pip install "jupyterhub==${JUPYTERHUB_VER}"



# PyMol
RUN wget --no-verbose https://sourceforge.net/projects/pymol/files/pymol/${PYMOL_VERSION_G}/pymol-v${PYMOL_VERSION}.tar.bz2 && \
    echo "${PYMOL_SHA} pymol-v${PYMOL_VERSION}.tar.bz2" | sha256sum -c - && \
    tar jxf pymol-v${PYMOL_VERSION}.tar.bz2 && \
    rm pymol-v* && \
    cd pymol && \
    python3 setup.py build install


# iPyMol + dependencies
RUN pip3 install git+https://github.com/ocramz/ipymol.git@python3

USER root

# NB : Add local files as late as possible to avoid cache busting
# Start notebook server
COPY jupyter-minimal-notebook/start-notebook.sh /usr/local/bin/
# Start single-user notebook server for use with JupyterHub
COPY jupyter-minimal-notebook/start-singleuser.sh /usr/local/bin/
COPY jupyter-minimal-notebook/jupyter_notebook_config.py /home/${USER}/.jupyter/

RUN chown -R ${USER}:users /home/${USER}/.jupyter

RUN rm -rf ${DL_DIR}


# Switch back to user to avoid accidental container runs as root
USER ${USER}



# Expose port
EXPOSE 8888

# working directory
WORKDIR /home/${USER}/data

# mount shared volume
VOLUME /home/${USER}/data


ENTRYPOINT ["tini", "--"]

# command to run when Docker image is run
CMD ["jupyter", "notebook", "--no-browser"]
