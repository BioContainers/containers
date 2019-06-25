################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="1"
LABEL software="bwakit"
LABEL software.version="0.7.15"
LABEL about.summary="A self-consistent installation-free package of scripts and precompiled binaries, providing an end-to-end solution to read mapping"
LABEL about.home="http://bio-bwa.sourceforge.net/"
LABEL about.documentation="http://bio-bwa.sourceforge.net/"
LABEL about.license_file="http://bio-bwa.sourceforge.net/"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################

RUN conda install bwakit=0.7.15 && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/bwa /opt/conda/bin/bwa && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/fermi2 /opt/conda/bin/fermi2 && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/htsbox /opt/conda/bin/htsbox && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/k8 /opt/conda/bin/k8 && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/ropebwt2 /opt/conda/bin/ropebwt2 && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/samblaster /opt/conda/bin/samblaster && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/samtools /opt/conda/bin/samtools && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/seqtk /opt/conda/bin/seqtk && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/trimadap /opt/conda/bin/trimadap && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/run-gen-ref /opt/conda/bin/run-gen-ref && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/typeHLA-selctg.js /opt/conda/bin/typeHLA-selctg.js && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/typeHLA.js /opt/conda/bin/typeHLA.js && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/typeHLA.sh /opt/conda/bin/typeHLA.sh && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/bwa-postalt.js /opt/conda/bin/bwa-postalt.js && \
    ln -s /opt/conda/share/bwakit-0.7.15-1/fermi2.pl /opt/conda/bin/fermi2.pl

WORKDIR /data/
