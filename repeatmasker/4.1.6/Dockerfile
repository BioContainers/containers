FROM python:3.10.14-slim-bookworm

LABEL    software="Repeatmasker" \ 
    base_image="python:3.10.14-slim-bookworm" \
#    about.summary="Python library for bioinformatics" \ 
#    about.home="http://biopython.org" \ 
    software.version="4.1.6" 
#    about.copyright=" 2002-2024 Biopython contributors" \ 
#    about.license="other" \ 
#    about.license_file="/usr/share/doc/biopython/copyright"

USER root
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && apt-get install -y wget perl libgomp1 && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir h5py

RUN wget https://github.com/Benson-Genomics-Lab/TRF/releases/download/v4.09.1/trf409.linux64 && \
    mv trf409.linux64 /usr/local/ && \
    cd /usr/local/ && \
    chmod a+x trf409.linux64
    
RUN wget https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-linux.tar.gz && \
    mv rmblast-2.14.1+-x64-linux.tar.gz /usr/local/ && \
    cd /usr/local/ && \
    tar xfz rmblast-2.14.1+-x64-linux.tar.gz && \
    rm rmblast-2.14.1+-x64-linux.tar.gz    

RUN wget https://www.repeatmasker.org/RepeatMasker/RepeatMasker-4.1.6.tar.gz && \
     mv RepeatMasker-4.1.6.tar.gz /usr/local/ && \
     cd /usr/local/ && \
     tar xfz RepeatMasker-4.1.6.tar.gz && \
     rm RepeatMasker-4.1.6.tar.gz


# run: cd /usr/local/RepeatMasker && perl config

# /usr/local/trf409.linux64
# /usr/local/rmblast-2.14.1/bin
# /usr/local/RepeatMasker