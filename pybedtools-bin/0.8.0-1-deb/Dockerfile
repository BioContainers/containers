FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pybedtools-bin" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pybedtools-bin" \ 
    about.summary="Scripts produced for pybedtools" \ 
    about.home="https://daler.github.io/pybedtools/" \ 
    software.version="0.8.0-1-deb" \ 
    upstream.version="0.8.0" \ 
    version="1" \ 
    about.copyright="2010-2015 Ryan Dale" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pybedtools-bin/copyright" \ 
    extra.binaries="/usr/bin/annotate.py,/usr/bin/intersection_matrix.py,/usr/bin/intron_exon_reads.py,/usr/bin/pbt_plotting_example.py,/usr/bin/peak_pie.py,/usr/bin/pybedtools,/usr/bin/venn_gchart.py,/usr/bin/venn_mpl.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pybedtools-bin || apt-get install -y pybedtools-bin) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
