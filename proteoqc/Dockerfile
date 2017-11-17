# ProteoQC

FROM ubuntu:16.04

LABEL version=0.1
LABEL software.version=1.0
LABEL software=proteoqc
LABEL website="http://bioconductor.org/packages/release/bioc/html/proteoQC.html"
LABEL tags="Proteomics"

MAINTAINER Bo Wen <wenbo@genomics.cn>

# Setup package repos
RUN echo "deb http://cloud.r-project.org/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN apt-get -y update && apt-get -y --no-install-recommends install r-base r-base-dev libssl-dev \
                                    libcurl4-openssl-dev git \
                                    libxml2-dev libnetcdf-dev\
                                    build-essential expat libexpat1\
                                    libssh2-1-dev r-cran-ncdf4 netcdf-bin\
                                    libexpat1-dev default-jre

RUN echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site && \
    R -e "install.packages('devtools'); source('https://bioconductor.org/biocLite.R');biocLite()"

RUN R -e "library(devtools); install_github('wenbostar/proteoQC')"
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ADD ./runProteoQC.sh /

RUN chmod +x /runProteoQC.sh

WORKDIR /data/

ENTRYPOINT ["/runProteoQC.sh"]
