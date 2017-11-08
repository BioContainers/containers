#################################################################
# Dockerfile
#
# Version:          1
# Software:         BioR annotate
# Software Version: 2.1.1
# Description:      BIOR (Biological Reference Repository) is a rapid, flexible system for genomic annotation. 
# Website:          http://www.well.ox.ac.uk/cava|https://github.com/Steven-N-Hart/bior_annotate|http://bioinformaticstools.mayo.edu/research/bior/|https://github.com/BioinformaticsToolsAtMayo|https://github.com/Steven-N-Hart/bior_annotate
# Tags:             Genomics
# Provides:         BioR 2.1.1|htslib 1.2.1|samtools 1.2|bedtools 2.25.0|pysam 0.8.3|cava full 1.1.1|snpEff 4.1k
# Base Image:       biodckrdev/bior_annotate
# Build Cmd:        docker build --rm -t biodckrdev/bior_annotate 2.1.1/.
# Pull Cmd:         docker pull biodckrdev/bior_annotate
# Run Cmd:          docker run --rm -it biodckrdev/bior_annotate bash
# Extra:            mkdir data
# Extra:            cd data
# Extra:            mkdir references
# Extra:            curl -o references/hg19.fa.gz ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz
# Extra:            gunzip references/hg19.fa.gz > references/hg19.fa
# Extra:            docker run -it --rm -v $PWD:/Data biodckrdev/bior_annotate bash
# Extra:            cd /data
# Extra:            samtools faidx references/hg19.fa
# Extra:            sh trunk/bior_annotate.sh -v HG00098.vcf.gz -c catalogFile.docker -d drillFile.docker -T tool_info.minimal.txt -o TEST  -M trunk/config/memory_info.txt -l
# Extra:            Note for windows, you will need to use
# Extra:            docker run -it --rm -v //c/UserS/m087494/Desktop/bior_annotate:/Data stevenhart/bior_annotate:latest
# Extra:            For this demo, make sure `pwd` contains the following elements
# Extra:            Data/
# Extra:              references/
# Extra:                hg19.fa.gz
# Extra:                hg19.fa.gz.fai
# Extra:            catalogs/
# Extra:              2015_05_18/
# Extra:                noTCGA_ExAc.datasource.properties
# Extra:                noTCGA_ExAc.columns.tsv
# Extra:                noTCGA_ExAc.tsv.bgz.tbi
# Extra:                noTCGA_ExAc.tsv.bgz
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

#####################################################
# Install system wide libraries
#####################################################
USER root

RUN apt-get update && \
    apt-get install -y \
      libncurses5-dev \
      libncursesw5-dev && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#####################################################
# Install htslib
#####################################################
ENV ZIP=htslib-1.2.1.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/htslib
ENV FOLDER=htslib-1.2.1
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER


#####################################################
# Install SAMtools
#####################################################
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


#####################################################
# Get BEDtools
#####################################################
ENV ZIP=bedtools-2.25.0.tar.gz
ENV URL=https://github.com/arq5x/bedtools2/releases/download/v2.25.0
ENV FOLDER=bedtools2
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER


#####################################################
# Install perl modules
#####################################################
RUN cpan -i Data::Dumper Getopt::Long List::MoreUtils Switch 


#####################################################
# Install PySAM
#####################################################
RUN pip install pysam==0.8.3


#####################################################
# Install Cava
#####################################################
# Change user to back to biodocker
USER biodocker

ENV ZIP=cava-full-v1.1.1.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/cava
ENV FOLDER=cava-v1.1.1
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    sed -i -e 's#human_g1k_v37.fasta#'$DST/$FOLDER'/human_g1k_v37.fasta#;s#hg19.fa#'$DST/$FOLDER'/hg19.fa#;s#exome_65_GRCh37.gz#'$DST/$FOLDER'/exome_65_GRCh37.gz#;s#dbSNP138.gz#.#' $DST/$FOLDER/config.txt && \
    cd / && \
    rm -rf $DST/$FOLDER

ENV PATH=$PATH:/home/biodocker/bin/cava-v1.1.1/


#####################################################
# Install SNPEFF
#####################################################
ENV ZIP=snpEff_v4_1k_core.zip
ENV URL=https://github.com/BioDocker/software-archive/releases/download/snpEff
ENV FOLDER=snpEff
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST/$FOLDER'/snpEff.jar  \$@" > '$DST'/snpeff' && \
    chmod +x $DST/snpeff && \
    bash -c 'echo -e "#!/bin/bash\njava -jar '$DST/$FOLDER'/SnpSift.jar \$@" > '$DST'/snpsift' && \
    chmod +x $DST/snpsift

ENV PATH=$PATH:/home/biodocker/bin/snpEff/scripts:/home/biodocker/bin/snpEff/scripts/gsa


#####################################################
# Install BIOR
#####################################################
ENV ZIP=bior_2.1.1.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/BioR
ENV FOLDER=bior_2.1.1
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvzf $DST/$ZIP -C $DST && \
    rm -f $DST/$ZIP && \
    echo "export BIOR_LITE_HOME=$DST/$FOLDER" > $DST/$FOLDER/PKG_PROFILE && \
    ln -s $DST/$FOLDER/bin/* $DST/$FOLDER

ENV BASEDIR=/home/biodocker/bin/bior_2.1.1
ENV FOLDER=/home/biodocker/bin/bior_2.1.1
ENV BIOR_LITE_HOME=$BASEDIR
ENV PATH=$PATH:$BIOR_LITE_HOME/bin

COPY annotate/ /home/biodocker/bin/annnotate/

ENV PATH=$PATH:/home/biodocker/bin/annnotate/scripts/

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["bash"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
