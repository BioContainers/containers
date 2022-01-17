FROM biocontainers/biocontainers:v1.2.0_cv1


LABEL    software="tidehunter" \ 
    software.version="1.5.3" \ 
    base_image="biocontainers/biocontainers:v1.2.0_cv1" \ 
    container="tidehunter" \ 
    version="1" \ 
    about.summary="Efficient and sensitive tandem repeat detection from noisy long reads using seed-and-chain" \ 
    about.home="https://github.com/Xinglab/TideHunter" \ 
    about.copyright="2019 Yan Gao" \ 
    about.license="MIT" \ 
    about.license_file="https://github.com/Xinglab/TideHunter/blob/main/LICENSE" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::c, interface::commandline, role::program,:utility, use::analysing" 


MAINTAINER biocontainers <biodocker@gmail.com>

################## INSTALLATION ##################
USER root

SHELL ["/bin/bash", "-c"]

RUN conda install -y -c bioconda tidehunter

USER biodocker
