############################## Dockerfile ###################################

FROM java:7

###################################### METADATA ##############################

LABEL base_image="biocontainers:latest" \
  version="2" \
  software="gatk" \
  software.version="3.4" \
  about.summary="The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute to analyze high-throughput sequencing data." \
  about.home="https://www.broadinstitute.org/gatk/|https://github.com/broadgsa/gatk-protected/" \
  about.license_file="https://github.com/broadgsa/gatk-protected/blob/master/licensing/protected_license.txt" \
  about.license="SPDX:BSD-3-Clause" \
  about.tags="Genomics" \
  extra.identifiers.biotools="gatk" \
  extra.binaries="GenomeAnalysisTK" \
  about.provides="gatk 3.4|samtools 1.2|bwakit 0.7.12|picard tools 1.139"

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################
#
# Change to root
#
USER root

#
# INSTALL MAVEN
#
RUN apt-get update -qq && \
    apt-get install -y -q --fix-missing \
      libncurses5-dev  \
      libncursesw5-dev \
      build-essential \
      bzip2 \
      zlib1g-dev \
      maven && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /data /config



#
# INSTALL SAMTOOLS
#
ENV ZIP=samtools-1.2.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/samtools
ENV FOLDER=samtools-1.2
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER



#
# Add biodocker user with password biodocker
#
RUN useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker`



#
# Change user
#
USER biodocker



#
# Create $HOME/bin folder
#
RUN mkdir -p /home/biodocker/bin



#
# Add $HOME/bin to path
#
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker



#
# INSTALL BWA
#
ENV ZIP=bwakit-0.7.12_x64-linux.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/bwa
ENV FOLDER=bwa.kit
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP --strip-components=1 -C $DST && \
    rm $DST/$ZIP


#
# INSTALL PICARD
#
ENV ZIP=picard-tools-1.139.zip
ENV URL=https://github.com/broadinstitute/picard/releases/download/1.139/
ENV FOLDER=picard-tools-1.139
ENV DST=/home/biodocker/bin/

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mv * .. && \
    cd / && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST'/picard.jar \$@" > '$DST'/picard' && \
    chmod +x $DST/picard && \
    rm -rf $DST/$FOLDER



#
# INSTALL GATK
#
# download and build GATK from current master
ENV SHA=f19618653a0d23baaf147efe7f14aeb4eeb0cbb8

ENV DST=/home/biodocker/bin
ENV FOLDER=gatk

RUN git clone https://github.com/broadgsa/gatk-protected.git $DST/$FOLDER && \
    cd $DST/$FOLDER && \
    git reset --hard $SHA && \
    mvn verify && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST/$FOLDER'/target/GenomeAnalysisTK.jar  \$@" > '$DST'/GenomeAnalysisTK' && \
    chmod +x $DST/GenomeAnalysisTK

ENV PATH=/usr/lib/jvm/java-7-openjdk-amd64/bin:$PATH

#ENV JAVABIN=/usr/lib/jvm/java-7-openjdk-amd64/bin/java
#ENTRYPOINT ["java", "-jar", "$DST/target/GenomeAnalysisTK.jar"]



#
# Share default volumes
#
VOLUME ["/data", "/config"]



# CMD ["GenomeAnalysisTK"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

