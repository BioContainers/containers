# Set the base image to Ubuntu 16.04
FROM ubuntu:16.04
LABEL    software="guppy-cpu" \ 
    base_imnage="ubuntu:16.04" \
    container="guppy" \ 
    about.summary="Basecalling and demultiplexing for Oxford Nanopore reads, CPU version" \ 
    about.home="https://community.nanoporetech.com/downloads" \
    software.version="3.2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="guppy" \ 
    about.license="custom, see /usr/share/doc/ont-guppy-cpu/copyright" \ 
    about.license_file="/usr/share/doc/ont-guppy-cpu/copyright" \ 
    extra.binaries="/usr/bin/guppy_aligner,/usr/bin/guppy_barcoder,/usr/bin/guppy_basecall_server,/usr/bin/guppy_basecaller,/usr/bin/guppy_basecaller_1d2" \ 
    about.tags=""

MAINTAINER Adam Giess <adamgiess81@gmail.com>

ARG PACKAGE_VERSION=3.2.2
ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
apt-get install --yes $BUILD_PACKAGES && \
cd /tmp && \
wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_cpu_${PACKAGE_VERSION}-1~xenial_amd64.deb && \
apt-get install --yes libzmq5 libhdf5-cpp-11 libcurl4-openssl-dev libssl-dev libhdf5-10 libboost-regex1.58.0 libboost-log1.58.0 libboost-atomic1.58.0 libboost-chrono1.58.0 libboost-date-time1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 libboost-iostreams1.58.0 && \
dpkg -i *.deb && \
rm *.deb && \
apt-get remove --purge --yes && \
apt-get autoremove --purge --yes && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
