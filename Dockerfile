################## BASE IMAGE ######################

FROM centos:7

################## METADATA ######################

LABEL base_image="centos:7"
LABEL version="1"
LABEL about.summary="Model-based Analysis of ChIP-Exo"
LABEL software="MACE"
LABEL software.version="1.2"
LABEL about.tags="Genomics"
LABEL about.home="http://chipexo.sourceforge.net/"
LABEL about.software="https://sourceforge.net/projects/chipexo/files/MACE-1.2.tar.gz"
LABEL about.documentation="http://chipexo.sourceforge.net/"
LABEL about.license="http://chipexo.sourceforge.net/"
LABEL about.author="Wang, Liguo"

################## MAINTAINER ######################
MAINTAINER JosephLaiC <joe5621624@gmail.com>

USER root

RUN yum install -y epel-release
RUN yum install -y\
    sudo\
    python-devel\
    python-pip\
    zlib-devel\
    libgs-devel\
    gcc\
    gsl-devel\
    wget

RUN mkdir /install /data /config
WORKDIR /install

## Change deb package to rpm package
RUN TINI_VERSION="0.19.0" &&\
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.rpm" > tini.rpm &&\
    rpm -i tini.rpm

## manaul install the dependent package and fix the bug of "http download"
RUN wget https://files.pythonhosted.org/packages/8d/cb/c56392fb3d13b511cf3de190c3f4d9453ef91964930d6476c85a19dbc5c7/Cython-0.17.tar.gz &&\
    wget https://files.pythonhosted.org/packages/67/ab/41e4b42e0519d868347d2cf1051a05ce0170632039c053dee8ffe8b43b0b/numpy-1.8.2.tar.gz &&\
    wget https://src.fedoraproject.org/repo/pkgs/python-nose/nose-0.10.4.tar.gz/4b4aec226d03f1d8465336a88d7183c4/nose-0.10.4.tar.gz &&\
    wget --no-check-certificate https://sourceforge.net/projects/chipexo/files/MACE-1.2.tar.gz &&\
    for file in ./*gz; do tar zxvf $file; done &&\
    sed -i 's/http/https/g' /install/MACE-1.2/distribute_setup.py &&\
    cd /install/numpy-1.8.2/ && python setup.py install &&\
    cd /install/nose-0.10.4/ && python setup.py install &&\
    cd /install/Cython-0.17/ && python setup.py install &&\
    cd /install/MACE-1.2/ && python setup.py install && cd / && rm -rf /install/

# Add user biodocker with password biodocker (change for centos environment)
RUN sed -i 's/# %wheel/%wheel/g' /etc/sudoers && groupadd fuse && \
    useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups wheel,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

#-------- copy from docker file of bioconatainer --------#
RUN chmod 777 -R /data /config

USER biodocker

ENV HOME=/home/biodocker

VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

WORKDIR /data
