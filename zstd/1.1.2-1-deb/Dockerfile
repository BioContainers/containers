FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="zstd" \ 
    container="zstd" \ 
    about.summary="fast lossless compression algorithm -- CLI tool" \ 
    about.home="https://github.com/facebook/zstd" \ 
    software.version="1.1.2-1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/zstd/copyright" \ 
    extra.binaries="/usr/bin/pzstd,/usr/bin/unzstd,/usr/bin/zstd,/usr/bin/zstdcat,/usr/bin/zstdgrep,/usr/bin/zstdless,/usr/bin/zstdmt" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y zstd && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
