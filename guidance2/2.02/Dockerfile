FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    software="guidance2" \ 
    container="guidance2" \ 
    about.summary="server for alignment confidence score." \ 
    about.home="http://guidance.tau.ac.il/ver2/" \ 
    software.version="2.02" \ 
    version="1" \ 
    extra.identifier.biotools="guidance2" \ 
    about.copyright="2015-2018, Tal Pupko <talp@post.tau.ac.il>" \ 
    about.license="GPL-3.0" \
    about.license_file="/license" \
    about.tags="alignment"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y g++ git make wget libglib2.0-0 libgomp1 cpanminus ruby && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
# BioPerl
 RUN cpanm Bio::Perl
# MAFFT
RUN wget https://mafft.cbrc.jp/alignment/software/mafft_7.402-1_amd64.deb && dpkg -i mafft_7.402-1_amd64.deb
# PRANK
RUN wget http://wasabiapp.org/download/prank/prank.linux64.170427.tgz && tar -xzf prank.linux64.170427.tgz && mv prank/bin/prank /usr/bin/prank && rm prank.linux64.170427.tgz && rm -rf prank
# PAGAN
RUN wget http://wasabiapp.org/download/pagan/pagan.linux64.20150723.tgz && tar -xzf pagan.linux64.20150723.tgz && cp pagan/bin/pagan /usr/bin && rm pagan.linux64.20150723.tgz && rm -rf pagan
# MUSCLE
RUN wget https://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz && tar -xzf muscle3.8.31_i86linux64.tar.gz && mv muscle3.8.31_i86linux64 /usr/bin/muscle && rm muscle3.8.31_i86linux64.tar.gz
# CLUSTALW2
RUN wget http://www.clustal.org/download/current/clustalw-2.1-linux-x86_64-libcppstatic.tar.gz && tar -xzf clustalw-2.1-linux-x86_64-libcppstatic.tar.gz && cp clustalw-2.1-linux-x86_64-libcppstatic/clustalw2 /usr/bin && cp clustalw-2.1-linux-x86_64-libcppstatic/clustalw2 /usr/bin/clustalw && rm clustalw-2.1-linux-x86_64-libcppstatic.tar.gz && rm -rf clustalw-2.1-linux-x86_64-libcppstatic
# Guidance2
RUN git clone https://github.com/grabear/guidance.git ~/guidance
RUN cd ~/guidance && make
ENV PATH="/home/biodocker/guidance/www/Guidance:${PATH}"
USER biodocker
WORKDIR /home/biodocker/guidance/www/Guidance