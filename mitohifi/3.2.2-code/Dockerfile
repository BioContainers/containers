FROM dnalinux/mitohifi-base:3.2.2

WORKDIR /opt

# /opt/MitoHiFi
RUN git clone https://github.com/marcelauliano/MitoHiFi.git \
    && cd MitoHiFi/src \
    && chmod +x *.py \
    && sed -i '1i#!/usr/bin/env python3' mitohifi.py findFrameShifts.py fixContigHeaders.py \
    && sed -i '1 s/python\>/python3/' *.py \
    && sed -i 's/"python2",\s//' parallel_annotation_mitos.py \
    && sed -i 's/MITOS\/data/\/opt\/databases/' parallel_annotation_mitos.py

WORKDIR /tmp

ENV CONDA_DIR=/opt/conda

ENV PATH /opt/wrappers:/opt/cdhit/:/opt/hifiasm-0.16.1/:/opt/MitoHiFi/src/:/opt/MitoFinder/:/opt/minimap2-2.24_x64-linux/:${PATH}
#create docker in main branch now

# This is a patch for https://github.com/Edinburgh-Genome-Foundry/DnaFeaturesViewer/issues/88
COPY BiopythonTranslatorBase.py /usr/local/lib/python3.6/dist-packages/dna_features_viewer/BiopythonTranslator/BiopythonTranslatorBase.py
COPY getGenesList.py /opt/MitoHiFi/src/getGenesList.py
