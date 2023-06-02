## <---- Create a clone of Ubuntu image

FROM ubuntu:latest


## <----- METADATA 

LABEL base_image="ubuntu:latest"
LABEL version="1"
LABEL about.summary="Tools to analyse cis-regulatory elements in genome sequences: motif discovery, transcription factor binding motif analysis, comparative genomics, regulatory variations"
LABEL software="rsat"
LABEL software.version="20230602"
LABEL about.tags="implemented-in::perl,R,python,C"
LABEL about.home="http://rsat.eu"
LABEL extra.identifiers.biotools="rsat"
LABEL about.software="https://github.com/rsa-tools/rsat-code"
LABEL about.documentation="https://github.com/rsa-tools"
LABEL about.license="AGPL-3.0-only"
LABEL about.license_file="ses also motif licenses at $RSAT/public_html/motif_databasess"
LABEL maintainer="rsat-developers@list01.bio.ens.psl.eu"

## <----- maintainers 

MAINTAINER "rsat-developers@list01.bio.ens.psl.eu" 

##  <---- Prevent to open interactive dialogs during the installation process
ENV DEBIAN_FRONTEND=noninteractive

##  <----  Set the language environment in the docker container: should be included before installing any other package

RUN apt-get update \
	&& apt-get install -y locales \
	&& locale-gen en_US.UTF-8 \
	&& update-locale LANG=en_US.UTF-8 \
   	&& apt-get autoremove

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

##  <----  Install required packages

RUN apt-get install -y --no-install-recommends \
	apt-transport-https \
	wget \
	less \
	vim-tiny \
	vim \
	time \
	lsb-release \
# gnupg2 needed for gpg command and FOR R key installation
	gnupg2 \  
	dirmngr \    
	ca-certificates\
	software-properties-common \
# optimize the space in your docker
   && rm -rf /var/lib/apt/lists/*


##  <----  Add the CRAN repository to your system sources’ list

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" > /etc/apt/sources.list.d/cran.list
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
	&& gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9| apt-key add -


## <---- Now install R and littler, and create a link for littler in /usr/local/bin
## <---- Also set a default CRAN repo, and make sure littler knows about it too

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		littler \
        	r-cran-littler \
		r-base \
		r-base-dev \
		r-recommended \
        && echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site \
        && echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r \
	&& ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
	&& ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
	&& ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
	&& install.r docopt \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/*


## <---- Now we will install RSAT from the GitHub repository; requires git see,
#        https://rsa-tools.github.io/installing-RSAT/unix-install-rsat/installing_RSAT_procedure.html#5_Configuring_RSAT

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		git \	
		git-lfs \
	&& rm -rf /var/lib/apt/lists/*


## <---- Create INSTALL_ROOT directory and set as working directory: 

ENV INSTALL_ROOT=/packages
RUN echo $INSTALL_ROOT \
	&& mkdir -p ${INSTALL_ROOT}/
WORKDIR /packages


## <----  Clone RSAT repository into your working dir

RUN git clone https://github.com/rsa-tools/rsat-code.git

########################################################       Notes       ########################################################
# [Jun2023] When clonning 'motif_databases' you get 
# 'This repository is over its data quota. Account responsible for LFS bandwidth should purchase more data packs to restore access'
# Workaround: download motif_databases from RSAT Web instance (Plants), which are updated
# 
# Repositories 'demo_files' and 'sample_ouput' are skipped to save space
#
# git clone https://github.com/rsa-tools/demo_files.git
# git clone https://github.com/rsa-tools/motif_databases.git
# git clone https://github.com/rsa-tools/sample_outputs.git


## <---- Download motif_databases, move this directory to /packages, then rename rsat_code
RUN wget --no-parent -r --reject "index.html*" https://rsat.eead.csic.es/plants/motif_databases/ \
	&& mv /packages/rsat.eead.csic.es/plants/motif_databases/ /packages \
	&& rm -rf  /packages/rsat.eead.csic.es/ \
	&& rm -rf /packages/motif_databases/_to_remove \
	&& mv rsat-code rsat




## <---- Create soft link 

RUN cd rsat/public_html/ \
&& ln -s ../../motif_databases/


## <---- Declare the environment path and set the new working directory

ENV RSAT /packages/rsat
RUN echo $RSAT
WORKDIR $RSAT


## <---- define your IP, this step is needed to have access to web interface

ENV MY_IP "localhost" 

## <---- Check that the IP site of your machine has been specified
RUN echo "MY_IP ${MY_IP}"

## <----Choose your RSAT site name
ENV RSAT_SITE=my_rsat

## <---- Configure RSAT to be used internally and in web server, this step is needed to generate the RSAT_config.bashrc

RUN perl perl-scripts/configure_rsat.pl -auto  rsat=${RSAT} rsat_site=${RSAT_SITE} rsat_www=http://${MY_IP}/rsat/ \
  	rsat_ws=http://${MY_IP}/rsat/ package_manager="apt-get" ucsc_tools=1 ensembl_tools=1



## <---- Read config and run bash installation scripts: requires sudo and apt-utils

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	sudo \
	apt-utils

########################################################       Notes       ########################################################
# To run the bash installation scripts, we need sudo access 
# To run source RSAT_config.bashrc we need a bash shell; however, the default shell for RUN instructions is ["/bin/sh", "-c"]. 
# Using SHELL instruction SHELL ["/bin/bash", "-c"], we can change default shell for subsequent RUN instructions in Dockerfile 
# then RUN "source file"    # now translates to: RUN /bin/bash -c "source file"


## <---- switch to bash
SHELL ["/bin/bash", "-c"]



## <---- make sure you are in your working dir
RUN cd ${RSAT}
WORKDIR ${RSAT}


## <---- Read config and run bash installation scripts

RUN  source /packages/rsat/RSAT_config.bashrc \
	&& bash installer/01_ubuntu_packages.bash \
	&& bash installer/02_python_packages.bash

########################################################       Notes       ########################################################
# When installinng python dependencies i got error with rpy2-3.5.12.tar.gz :
# "note: This error originates from a subprocess, and is likely not a problem with pip"
# To fix this, we need to Upgrade versions of pip, setuptools and wheel.
# see https://bobbyhadz.com/blog/python-note-this-error-originates-from-subprocess
# RUN pip install wheel setuptools pip --upgrade
# RUN pip3 install wheel setuptools pip --upgrade
# These commands were added to installer/02_python_packages.bash 


RUN bash installer/03_install_rsat.bash \
	&& bash installer/04_perl_packages.bash \
	&& bash installer/06_install_organisms.bash \
	&& bash installer/07_R-and-packages.bash \
	&& bash installer/08_apache_config.bash \
	&& bash installer/10_clean_unnecessary_files.bash

RUN echo "source ${RSAT}/RSAT_config.bashrc" >> /etc/bash.bashrc \
	&& echo "service apache2 start" >>  /etc/bash.bashrc 



## <---- add new user called rsat_user and give it permission to $RSAT

ENV RSATUSER="rsat_user"
ENV RSATPASS="rsat_2020"
ENV RSATUSERHOME="/home/${RSATUSER}"
ENV TESTPATH="${RSATUSERHOME}/test_data"

RUN useradd ${RSATUSER} \
	&& echo "${RSATUSER}:${RSATPASS}" | chpasswd \
	&& adduser ${RSATUSER} sudo \
	&& chown -R "${RSATUSER}:${RSATUSER}" ${RSAT} \
	&& chmod 755 ${RSAT} \
	&& mkdir -p ${TESTPATH} \
	&& chmod -R a+w ${RSATUSERHOME}



## <---- Create new folder with test _data 

ENV TESTMAKEURL="https://raw.githubusercontent.com/eead-csic-compbio/coexpression_motif_discovery/master/makefile/peak-motifs.mk"
ENV TESTRSATURL="https://raw.githubusercontent.com/eead-csic-compbio/coexpression_motif_discovery/master/peach/Modules/M11"
ENV TESTRSATFILEREMOTE="${TESTRSATURL}/genesM11.txt"
ENV TESTRSATFILELOCAL="${TESTPATH}/M11.txt"
ENV TESTMAKEFILELOCAL="${TESTPATH}/peak-motifs.mk"

RUN wget ${TESTRSATFILEREMOTE} -O ${TESTRSATFILELOCAL}
RUN wget ${TESTMAKEURL} -O ${TESTMAKEFILELOCAL}


## <---- rename the container's folder for installing genomes, local volume to be used instead

RUN mv ${RSAT}/public_html/data ${RSAT}/public_html/data_container

## <---- set default user and path

USER ${RSATUSER}

WORKDIR "/home/${RSATUSER}"



#################################  Useful command lines  ################################# 
#
#
## 1) Build RSAT Docker container
#
# export RSATDOCKERVERSION=`date '+%Y%m%d'` 
# docker build --tag rsat:$RSATDOCKERVERSION --tag rsat:latest --force-rm --compress .
# 
#
## 2) Create local folders for input data and results, outside the container, as these might be large
#
# mkdir -p ~/rsat_data/genomes ~/rsat_results
# chmod -R a+w ~/rsat_data/genomes ~/rsat_results
# 
#  
## 3) Launch Docker RSAT container:
#
# docker run --rm -v ~/rsat_data:/packages/rsat/public_html/data/ -v ~/rsat_results:/home/rsat_user/rsat_results -it rsat:latest
#
#
## 4) Download organism from public RSAT server, such as the Plants server.
##    Other available servers: http://fungi.rsat.eu, http://metazoa.rsat.eu, http://protists.rsat.eu
# 
# download-organism -v 2 -org Prunus_persica.Prunus_persica_NCBIv2.38 -server https://rsat.eead.csic.es/plants
#
#
## 5) Test container
#
# cd rsat_results 
# make -f ../test_data/peak-motifs.mk RNDSAMPLES=2 all
#
#
## 6) Install any organism, please follow 
##    https://rsa-tools.github.io/managing-RSAT/genome_installation/install_organisms_FASTA_GTF.html
#
# 
## 7) To connect to RSAT Web server running from Docker
#
# If you run Docker as a normal user Apache will not start properly and you will see these messages:
#
#   * Starting Apache httpd web server apache2
#   (13)Permission denied: AH00091: apache2: could not open error log file /var/log/apache2/error.log.
#   AH00015: Unable to open logs
#   Action 'start' failed.
#   The Apache error log may have more information
#
# If you really want lo launch the Docker Web server launch tge container and do (see RSATPASS above):
# 
# sudo service apache2 restart
# hostname -I
#
# open the following URL in your browser, using the obtained the IP address: http://172.17.0.2/rsat
