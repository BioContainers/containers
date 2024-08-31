FROM python:3.9.1
# metadata
LABEL base.image="python:3.9.1"
LABEL version="2"
LABEL software="Redundans"
LABEL software.version="2.0"
LABEL description="Redundans pipeline assists an assembly of heterozygous genomes.Program takes as input assembled contigs, sequencing libraries and/or reference sequence and returns scaffolded homozygous genome assembly. Final assembly should be less fragmented and with total size smaller than the input contigs. In addition, Redundans will automatically close the gaps resulting from genome assembly or scaffolding."
LABEL website="https://github.com/Gabaldonlab/redundans"
LABEL license="GNU General Public License"
LABEL maintainer="Diego Fuentes (BSC)"
##Set up bash and install basic dependencies
SHELL ["/bin/bash", "-c"]
RUN apt-get update -qq && apt-get install -y perl python3-pip git make nano automake wget g++ zlib1g-dev curl && python3 -m pip install --upgrade pip && pip3 install --upgrade matplotlib Pillow
##Download R from source, compile and set up dependencies. Tends to be a long process
RUN apt-get upgrade -y gfortran libreadline6-dev libx11-dev libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libbz2-dev libzstd-dev liblzma-dev libcurl4-openssl-dev texinfo texlive texlive-fonts-extra screen libpcre2-dev
RUN cd /usr/local/src && wget https://cran.r-project.org/src/base/R-4/R-4.1.0.tar.gz && tar zxvf R-4.1.0.tar.gz && rm R-4.1.0.tar.gz && cd R-4.1.0/ && ./configure --enable-R-shlib && make && make install 
RUN Rscript -e 'install.packages("ggplot2", repos = "http://cran.us.r-project.org")' && Rscript -e 'install.packages("scales", repos = "http://cran.us.r-project.org")' && Rscript -e 'install.packages("argparse", repos = "http://cran.us.r-project.org")'
#Install redundans
RUN mkdir -p /root/src && cd /root/src && git clone --recursive https://github.com/Gabaldonlab/redundans.git && cd redundans && bin/.compile.sh
#After using the dependencies for compiling, remove them to alleviate size load
RUN apt purge -y git make g++ zlib1g-dev python3-pip automake wget curl libreadline6-dev libx11-dev libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libbz2-dev libzstd-dev liblzma-dev libcurl4-openssl-dev texinfo texlive texlive-fonts-extra screen libpcre2-dev && rm -rf /var/lib/apt/lists/*
#Run a quick test that everything is working as intended
RUN R --version
RUN cd /root/src/redundans && ./redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1  && find . -name .git | xargs rm -r test/run1
RUN echo "The test run has been deleted successfully"
