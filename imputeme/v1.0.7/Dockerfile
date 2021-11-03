################## BASE IMAGE ######################

FROM rocker/shiny:4.0.1


################## METADATA ######################

LABEL base_image="lassefolkersen/impute-me"
LABEL version="1"
LABEL software="imputeme"
LABEL software.version="v1.0.7"
LABEL about.summary="A polygenic risk score calculator"
LABEL about.home="https://github.com/lassefolkersen/impute-me"
LABEL about.license_file="https://github.com/lassefolkersen/impute-me/blob/master/LICENSE"
LABEL about.license="LGPL-3.0-or-later"
LABEL extra.identifiers.biotools="impute.me"
LABEL about.tags="Genomics, polygenic risk scores, personal genomics"

################## MAINTAINER ######################

MAINTAINER Lasse Folkersen, lassefolkersen@impute.me


################## INSTALLATION ######################

ARG DEBIAN_FRONTEND=noninteractive

# Install easy R-packages
RUN R -e "install.packages(c( \
'DT', \
'igraph',  \
'jsonlite', \
'openxlsx', \
'R.utils', \
'visNetwork', \
'docstring' \
),dependencies=TRUE, repos = 'http://cran.rstudio.com/')"

#Install basic non-problematic apt-get apps
RUN apt-get update && apt-get -y install \
wget \
git \
sed \
tar \
unzip \
vim \
curl \
vcftools \
gawk

#Install kandinsky package, plus the remotes-package that is needed to get it
RUN R -e "install.packages(c( \
'remotes' \
),dependencies=TRUE, repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_github('gsimchoni/kandinsky')"

#Install plotly - takes forever and often fails in non-deterministic ways. 
#All it affects is the 3D-plotting of ancestry. Doesn't affect calculations at all.
# RUN R -e "install.packages(c( \
# 'plotly' \
# ),dependencies=TRUE, repos = 'http://cran.rstudio.com/')"


#Install gmailr - makes some trouble if installed together with the other R-packages
RUN R -e "install.packages(c( \
 'gmailr' \
 ),dependencies=TRUE)"

#configure the shiny_server.conf
RUN sed -i 's=run_as shiny=run_as ubuntu=' /etc/shiny-server/shiny-server.conf && \
sed -i 's=site_dir /srv/shiny-server=site_dir /imputeme/code/impute-me/=' /etc/shiny-server/shiny-server.conf && \
sed -i 's=log_dir /var/log/shiny-server=log_dir /home/ubuntu/=' /etc/shiny-server/shiny-server.conf && \
sed -i 's=directory_index on=directory_index off=' /etc/shiny-server/shiny-server.conf

#Install cron stuff using the supercronic app (needs root to install, then can run as user)
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.11/supercronic-linux-amd64 \
SUPERCRONIC=supercronic-linux-amd64 \
SUPERCRONIC_SHA1SUM=a2e2d47078a8dafc5949491e5ea7267cc721d67c
RUN curl -fsSLO "$SUPERCRONIC_URL" \
&& echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
&& chmod +x "$SUPERCRONIC" \
&& mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
&& ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic


#The impute.me server runs as ubuntu default user, so the docker should too
RUN useradd ubuntu && \
mkdir /home/ubuntu  && \
mkdir /imputeme  && \
mkdir /imputeme/prs_dir && \
mkdir /imputeme/programs && \
chown ubuntu /home/ubuntu && \
chown ubuntu -R /imputeme && \
chown ubuntu /var/lib/shiny-server
USER ubuntu
WORKDIR /home/ubuntu


#get impute2
WORKDIR /imputeme/programs
RUN wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz && \
gunzip impute_v2.3.2_x86_64_static.tgz && \
tar -xvf impute_v2.3.2_x86_64_static.tar && \
rm impute_v2.3.2_x86_64_static.tar


#get impute2 dynamic (necessary to run in dockers on windows-machines)
WORKDIR /imputeme/programs
RUN wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_dynamic.tgz && \
gunzip impute_v2.3.2_x86_64_dynamic.tgz && \
tar -xvf impute_v2.3.2_x86_64_dynamic.tar && \
rm impute_v2.3.2_x86_64_dynamic.tar


#get the reference from 1kgenomes
WORKDIR /imputeme/programs
RUN wget https://mathgen.stats.ox.ac.uk/impute/ALL_1000G_phase1integrated_v3_impute.tgz && \
gunzip ALL_1000G_phase1integrated_v3_impute.tgz && \
tar xf ALL_1000G_phase1integrated_v3_impute.tar && \
rm ALL_1000G_phase1integrated_v3_impute.tar  && \
wget https://mathgen.stats.ox.ac.uk/impute/ALL_1000G_phase1integrated_v3_annotated_legends.tgz && \
gunzip ALL_1000G_phase1integrated_v3_annotated_legends.tgz && \
tar xf ALL_1000G_phase1integrated_v3_annotated_legends.tar && \
rm ALL_1000G_phase1integrated_v3_annotated_legends.tar  && \
mv ALL_1000G_phase1integrated_v3_annotated_legends/* ALL_1000G_phase1integrated_v3_impute/  && \
rmdir ALL_1000G_phase1integrated_v3_annotated_legends

#link to the X-chr
WORKDIR /imputeme/programs/ALL_1000G_phase1integrated_v3_impute
RUN ln -s genetic_map_chrX_nonPAR_combined_b37.txt genetic_map_chrX_combined_b37.txt && \
ln -s ALL_1000G_phase1integrated_v3_chrX_nonPAR_impute.hap.gz ALL_1000G_phase1integrated_v3_chrX_impute.hap.gz && \
ln -s ALL_1000G_phase1integrated_v3_chrX_nonPAR_impute.legend.gz ALL_1000G_phase1integrated_v3_chrX_impute.legend.gz

#get shapeit2 v2.r904 (trying to make it work with shapeit4 as well, but seems difficult)
WORKDIR /imputeme/programs
RUN wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.v2.r904.glibcv2.17.linux.tar.gz && \
tar -zxvf shapeit.v2.r904.glibcv2.17.linux.tar.gz && \
rm shapeit.v2.r904.glibcv2.17.linux.tar.gz

#Get gtools
WORKDIR /imputeme/programs
RUN wget http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool_v0.7.5_x86_64.tgz && \
tar zxvf gtool_v0.7.5_x86_64.tgz && \
rm gtool_v0.7.5_x86_64.tgz

#Get plink (1.9)
WORKDIR /imputeme/programs
RUN wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20200103.zip && \
unzip plink_linux_x86_64_20200103.zip

#Get plink (2.0) #needed for prs freq-correction (and ideally for everything at some point in the future, but it's still too unstable to do that)
WORKDIR /imputeme/programs
RUN mkdir plink2 && \
cd plink2 && \
wget http://s3.amazonaws.com/plink2-assets/alpha2/plink2_linux_avx2.zip && \
unzip plink2_linux_avx2.zip && \
rm plink2_linux_avx2.zip

#Set ll to give long lists
RUN echo "alias ll='ls -lh'" > /home/ubuntu/.bashrc

#Customize the R opening slightly, by loading functions.R as default.
#not important for pipeline running, but nice to have when operating
#and debugging inside the container.
RUN echo ".First <- function(){" > /home/ubuntu/.Rprofile && \
echo "cat('\n   Welcome to impute.me!\n\n')" >> /home/ubuntu/.Rprofile && \
echo "source('/imputeme/code/impute-me/functions.R')" >> /home/ubuntu/.Rprofile && \
echo "set_conf('defaults')" >> /home/ubuntu/.Rprofile && \
echo "}" >> /home/ubuntu/.Rprofile

#Write a crontab to open using supercronic, once the docker is running
RUN echo "*/5 * * * * Rscript /imputeme/code/impute-me/imputeme/imputation_cron_job.R > /home/ubuntu/\`date +\%Y\%m\%d\%H\%M\%S\`-impute-cron.log 2>&1" > /imputeme/programs/supercronic.txt && \
echo "*/7 * * * * Rscript /imputeme/code/impute-me/imputeme/vcf_handling_cron_job.R > /home/ubuntu/\`date +\%Y\%m\%d\%H\%M\%S\`-vcf-cron.log 2>&1" >> /imputeme/programs/supercronic.txt && \
echo "00 20 * * * Rscript /imputeme/code/impute-me/imputeme/deletion_cron_job.R > /home/ubuntu/\`date +\%Y\%m\%d\%H\%M\%S\`-delete-cron.log 2>&1" >> /imputeme/programs/supercronic.txt


#clone the main github repo
RUN git clone https://github.com/lassefolkersen/impute-me.git /imputeme/code/impute-me/
  
#Expose the 3838 port
EXPOSE 3838

#set work dir to home folder
WORKDIR /home/ubuntu

#final command
CMD shiny-server