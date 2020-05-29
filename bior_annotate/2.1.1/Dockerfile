############################## Dockerfile ###################################

FROM biocontainers/biocontainers:v1.0.0_cv4

############################# METADATA ######################################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="BioR annotate"
LABEL container="bior"
LABEL software.version="2.1.1"
LABEL about.summary="BIOR (Biological Reference Repository) is a rapid, flexible system for genomic annotation"
LABEL about.home="http://www.well.ox.ac.uk/cava|https://github.com/Steven-N-Hart/bior_annotate|http://bioinformaticstools.mayo.edu/research/bior/|https://github.com/BioinformaticsToolsAtMayo|https://github.com/Steven-N-Hart/bior_annotate"
LABEL about.tags="Genomics"
LABEL about.provides="BioR 2.1.1|htslib 1.2.1|samtools 1.2|bedtools 2.25.0|pysam 0.8.3|cava full 1.1.1|snpEff"
LABEL extra.identifiers.biotools="bior"

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
# CMD ["bash"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
