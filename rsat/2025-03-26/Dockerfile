## <---- Create a clone of Ubuntu image
FROM ubuntu:focal

## <----- METADATA 
LABEL base_image="ubuntu:focal"
LABEL version="1"
LABEL about.summary="Tools to analyse cis elements in genomes: motif discovery, TF factor binding analysis, comparative genomics, regulatory variations"
LABEL software="rsat"
LABEL software.version="2025-03-26"
LABEL about.tags="implemented-in::perl,R,python,C"
LABEL about.home="http://rsat.eu"
LABEL extra.identifiers.biotools="rsat"
LABEL about.software="https://github.com/rsa-tools/rsat-code"
LABEL about.documentation="https://github.com/rsa-tools"
LABEL about.license="AGPL-3.0-only"
LABEL about.license_file="see also licenses at $RSAT/public_html/motif_databasess"
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

##  <----  Install required packages, including git
RUN apt-get install -y --no-install-recommends \
	apt-transport-https \
	git \
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


##  <----  Add the CRAN repository to your system sources list
# commented out, use Ubuntu's instead, r-color-brewer complained
##RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" > /etc/apt/sources.list.d/cran.list
##RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
##	&& gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9| apt-key add -


## <---- Now install R and littler, and create a link for littler in /usr/local/bin
## <---- Also set a default CRAN repo, and make sure littler knows about it too
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		littler \
        	r-cran-littler \
		r-base \
		r-base-dev \
		r-recommended \
		r-cran-rcolorbrewer \
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
#RUN apt-get update \
#	&& apt-get install -y --no-install-recommends \
#		git \	
#		git-lfs \
#	&& rm -rf /var/lib/apt/lists/*


## <---- Create INSTALL_ROOT directory and set as working directory: 
ENV INSTALL_ROOT=/packages
RUN echo $INSTALL_ROOT \
	&& mkdir -p ${INSTALL_ROOT}/
WORKDIR /packages


## <----  Actually clone RSAT repository into your working dir and rename to rsat
RUN git clone https://github.com/rsa-tools/rsat-code.git --branch 2025-03-26 --single-branch
RUN mv rsat-code rsat

# Repositories 'demo_files' and 'sample_ouput' are skipped to save space
# git clone https://github.com/rsa-tools/demo_files.git
# git clone https://github.com/rsa-tools/sample_outputs.git

## <---- Download licensed motif_databases, move to /packages/motif_databases and symb link
RUN wget --no-parent -r --reject "index.html*" https://rsat.eead.csic.es/plants/motif_databases/ \
        && mv /packages/rsat.eead.csic.es/plants/motif_databases/ /packages \
        && rm -rf /packages/rsat.eead.csic.es
RUN cd rsat/public_html/ \
        && ln -s ../../motif_databases/


## <---- Remove bulky motif_databases
RUN rm -rf /packages/motif_databases/cisBP2
RUN grep -v cisBP2 /packages/motif_databases/db_matrix_files.tab > /packages/motif_databases/db_matrix_files.filt.tab
RUN mv /packages/motif_databases/db_matrix_files.filt.tab /packages/motif_databases/db_matrix_files.tab


## <---- Declare the environment path and set the new working directory
ENV RSAT /packages/rsat
RUN echo $RSAT
WORKDIR $RSAT

## <---- define your IP, this step is needed to have access to web interface
ENV MY_IP "localhost" 
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
# When installinng python dependencies you might error with rpy2-3.5.12.tar.gz or PySimpleSOAP-1.16.2.tar.gz
# "note: This error originates from a subprocess, and is likely not a problem with pip"
# To fix this, we need to pgrade versions of pip, setuptools and wheel -> see installer/02_python_packages.bash
# end https://bobbyhadz.com/blog/python-note-this-error-originates-from-subprocess

RUN bash installer/03_install_rsat.bash \
        && bash installer/04_perl_packages.bash \
#       && bash installer/06_install_organisms.bash \ skipped to save 243MB
        && bash installer/07_R-and-packages.bash \
        && bash installer/08_apache_config.bash \
        && bash installer/10_clean_unnecessary_files.bash


RUN echo "source ${RSAT}/RSAT_config.bashrc" >> /etc/bash.bashrc \
	&& echo "service apache2 start" >>  /etc/bash.bashrc 



## <---- remove some uneeded folders to save space 
RUN rm -rf ${RSAT}/ext_lib/ensemblgenomes*/ensembl-*/modules/t \
        ${RSAT}/ext_lib/ensemblgenomes*/ensembl-*/.git \
        ${RSAT}/ext_lib/bioperl*/bioperl-live/t \
        ${RSAT}/ext_lib/bioperl*/bioperl-live/.git \
        ${RSAT}/.git


## <---- add new user called rsat_user and give it permission to $RSAT
ENV RSATUSER="rsat_user"
ENV RSATPASS="rsat_2020"
ENV RSATUSERHOME="/home/${RSATUSER}"
ENV TESTPATH="${RSATUSERHOME}/test_data"
ENV MOTIFPATH="/packages/motif_databases"
ENV EXTMOTIFPATH="/packages/motif_databases/ext_motifs"

RUN useradd ${RSATUSER} \
	&& echo "${RSATUSER}:${RSATPASS}" | chpasswd \
	&& adduser ${RSATUSER} sudo \
	&& chown -R "${RSATUSER}:${RSATUSER}" ${RSAT} \
	&& chmod 755 ${RSAT} \
	&& mkdir -p ${TESTPATH} \
	&& mkdir -p ${EXTMOTIFPATH} \
	&& chmod -R a+w ${RSATUSERHOME}

## <---- Set env variables
ENV R_LIBS_SITE="${RSAT}/R-scripts/Rpackages/"
ENV PATH="${PATH}:${RSAT}/ext_lib/ensemblgenomes-44-97/ensembl-git-tools/bin:${RSAT}/python-scripts:${RSAT}/perl-scripts/parsers:${RSAT}/perl-scripts:${RSAT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

## <---- Create new folder with test _data 
ENV TESTMAKEURL="https://raw.githubusercontent.com/eead-csic-compbio/coexpression_motif_discovery/master/makefile/peak-motifs.mk"
ENV TESTRSATURL="https://raw.githubusercontent.com/eead-csic-compbio/coexpression_motif_discovery/master/peach/Modules/M11"
ENV TESTRSATFILEREMOTE="${TESTRSATURL}/genesM11.txt"
ENV TESTRSATFILELOCAL="${TESTPATH}/M11.txt"
ENV TESTMAKEFILELOCAL="${TESTPATH}/peak-motifs.mk"

RUN wget ${TESTRSATFILEREMOTE} -O ${TESTRSATFILELOCAL}
RUN wget ${TESTMAKEURL} -O ${TESTMAKEFILELOCAL}

# not needed unless installer/06_install_organisms.bash is run above
## <---- Rename the container's folder for installing genomes, local volume to be used instead,
#        this also allows to use preinstalled genomes elsewhere in the file system.
#
#        Note that ${RSAT}/public_html/data_container takes 243MB including
#        Escherichia_coli_GCF_000005845.2_ASM584v2  
#        Escherichia_coli_K_12_substr__MG1655_uid57779  
#        Saccharomyces_cerevisiae
# 
#        This is a a result of installer/06_install_organisms.bash
#RUN mv ${RSAT}/public_html/data ${RSAT}/public_html/data_container

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
