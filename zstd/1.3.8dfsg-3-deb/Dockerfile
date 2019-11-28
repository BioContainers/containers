FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="zstd" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="zstd" \ 
    about.summary="fast lossless compression algorithm -- CLI tool" \ 
    about.home="https://github.com/facebook/zstd" \ 
    software.version="1.3.8dfsg-3-deb" \ 
    upstream.version="1.3.8" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/zstd/copyright" \ 
    about.license_file="/usr/share/doc/zstd/copyright" \ 
    extra.binaries="/usr/bin/pzstd,/usr/bin/unzstd,/usr/bin/zstd,/usr/bin/zstdcat,/usr/bin/zstdgrep,/usr/bin/zstdless,/usr/bin/zstdmt" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y zstd || apt-get install -y zstd) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
