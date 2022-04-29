# Base Image
FROM ubuntu:18.04

# Metadata
LABEL base_image="ubuntu:18.04"
LABEL version="2.2.1"
LABEL software="MitoHiFi"
LABEL software.version="2.2"
LABEL about.summary="a python workflow that assembles a species mitogenome from Pacbio HiFi reads."
LABEL about.home="https://github.com/marcelauliano/MitoHiFi"
LABEL about.documentation="https://github.com/marcelauliano/MitoHiFi"
LABEL about.license="MIT"
LABEL about.license_file="https://github.com/marcelauliano/MitoHiFi/blob/master/LICENSE"
LABEL about.tag="mitogenome, MT, organelle"

# Maintainer
MAINTAINER Ksenia Krasheninnikova kk16@sanger.ac.uk


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update \
    && apt-get -qq -y install default-jre \
    && apt-get -qq -y install ncbi-blast+ \ 
    && umask 022 \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 --no-cache-dir install --upgrade pip \
    && pip3 install biopython \
    && pip3 install pandas \
    && pip3 install entrezpy \
    && apt-get -qq -y install automake autoconf \
    && apt -qq -y install default-jre \ 
    && apt-get -qq -y install build-essential \
    && apt-get -qq -y install cd-hit \
    && apt-get -qq -y install mafft \	   
    && apt-get -qq -y install samtools \	   
    && apt-get -qq -y install curl \
    && curl -L https://github.com/lh3/minimap2/releases/download/v2.17/minimap2-2.17_x64-linux.tar.bz2 | tar -jxvf - \
    && mv ./minimap2-2.17_x64-linux/minimap2 /bin/ \
    && cd /bin/ \
    && apt-get -qq -y install git \
    && git clone https://github.com/RemiAllio/MitoFinder.git \
    && cd MitoFinder \
    && ./install.sh  \
    && cd /bin/ \
    && apt-get -qq -y install wget \
    && apt-get -qq -y install libz-dev \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/chhylp123/hifiasm/archive/refs/tags/0.16.1.tar.gz \
    && tar -xzvf 0.16.1.tar.gz \
    && cd hifiasm-0.16.1 && make 

RUN cd /bin/ \
    && git clone https://github.com/marcelauliano/MitoHiFi.git --branch v2.2

ENV PATH /bin/MitoFinder/:${PATH}
ENV PATH /bin/hifiasm-0.16.1/:${PATH}
ENV PATH /bin/MitoHiFi/:${PATH}

RUN echo "#!/usr/bin/env python" | cat - /bin/MitoHiFi/mitohifi.py | \
		tee /bin/MitoHiFi/mitohifi.py
RUN echo "#!/usr/bin/env python" | cat - /bin/MitoHiFi/findFrameShifts.py | \
		tee /bin/MitoHiFi/findFrameShifts.py
RUN echo "#!/usr/bin/env python" | cat - /bin/MitoHiFi/fixContigHeaders.py | \
		tee /bin/MitoHiFi/fixContigHeaders.py

RUN chmod -R 755 /bin
CMD ["/bin/bash"]
