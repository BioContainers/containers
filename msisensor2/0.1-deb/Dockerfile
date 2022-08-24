FROM biocontainers/biocontainers:v1.2.0_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL software="msisensor2" \ 
    container="msisensor2" \ 
    about.summary="MSIsensor2 is a novel algorithm based machine learning, featuring a large upgrade in the microsatellite instability (MSI) detection for tumor only sequencing data, including Cell-Free DNA (cfDNA), Formalin-Fixed Paraffin-Embedded(FFPE) and other sample types" \
    about.home="https://github.com/niu-lab/msisensor2" \ 
    software.version="0.1" \
    version="1" \ 
    base_image="biocontainers:v1.2.0_cv2" \
    about.copyright="2019-2022 Beifang Niu & Xinyin Han" \
    about.license="SPDX:GPL-3.0-only" \ 
    about.license_file="https://github.com/niu-lab/msisensor2/blob/master/LICENSE.md" \ 
    extra.binaries="/opt/msisensor2/msisensor2" \ 
    extra.identifiers.conda="msisensor2" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::r,:commandline, role::program, scope::utility, use::analysing,:searching, works-with-format::plaintext,:biological-sequence"

USER biodocker

WORKDIR /home/biodocker/bin/

RUN wget https://github.com/niu-lab/msisensor2/raw/e0798c713d62aa56c9672ae8b7e859fa82c17365/msisensor2 \
    && chmod +x msisensor2

ENV PATH /home/biodocker/bin/:$PATH
