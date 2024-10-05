FROM debian:bullseye-slim

LABEL software="3d-dna" \ 
    base_image="debian:bullseye-slim" \  
    about.summary="" \ 
    about.home="https://github.com/aidenlab/3d-dna" \ 
    software.version="180922" \ 
    upstream.version="180922" \ 
    version="1" \ 
    about.copyright="Dudchenko, O., Batra, S.S., Omer, A.D., Nyquist, S.K., Hoeger, M., Durand, N.C., Shamim, M.S., Machol, I., Lander, E.S., Aiden, A.P., et al." \ 
    about.license="MIT" \ 
    dockerfile.author="Sebastian Bassi <sebastian@toyoko.io>" \
     about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt-get install -y wget lastz openjdk-11-jdk python3-scipy python3-biopython && apt clean && apt purge && rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://github.com/aidenlab/3d-dna/archive/refs/tags/201008.tar.gz && tar xvfz 201008.tar.gz && rm 201008.tar.gz


#RUN python3 -m venv biopython && . biopython/bin/activate && pip install biopython==1.84
