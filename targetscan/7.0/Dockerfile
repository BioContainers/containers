FROM ubuntu:18.04

LABEL base_image="ubuntu:18.04"
LABEL software="targetscan"
LABEL software.version="7.0"
LABEL about.summary="TargetScan predicts biological targets of miRNAs by searching for the presence of sites that match the seed region of each miRNA"
LABEL about.home="https://www.targetscan.org/vert_70/"
LABEL about.documentation="https://www.targetscan.org/vert_70/"
LABEL about.license_file="NA"

MAINTAINER @BarryDigby

# install basics for downloading and unzipping
# install perl and CPAN
RUN apt-get update; apt-get clean all;
RUN apt-get install --yes build-essential \
                          gcc-multilib \
                          apt-utils \
			              curl \
                          perl \
			              zip \
                          expat \
                          libexpat-dev \
			              cpanminus \
                          libxml-libxml-perl \
                          libxml-dom-xpath-perl \
                          libxml-libxml-simple-perl \
                          libxml-dom-perl
RUN cpanm CPAN::Meta Statistics::Lite Bio::TreeIO

# install TargetScan Executables
RUN curl --output ./targetscan_70.zip https://www.targetscan.org/vert_80/vert_80_data_download/targetscan_70.zip \
    && unzip targetscan_70.zip \
    && mv targetscan_70.pl /usr/bin/
RUN curl --output ./targetscan_70_BL_PCT.zip https://www.targetscan.org/vert_80/vert_80_data_download/targetscan_70_BL_PCT.zip \
    && unzip targetscan_70_BL_PCT.zip \
    && mv TargetScan7_BL_PCT/targetscan_70_BL_bins.pl /usr/bin/
RUN curl --output ./TargetScan7_context_scores.zip https://www.targetscan.org/vert_80/vert_80_data_download/TargetScan7_context_scores.zip \
    && unzip TargetScan7_context_scores.zip \
    && mv TargetScan7_BL_PCT/targetscan_70_BL_PCT.pl /usr/bin/
RUN chmod 777 TargetScan7_context_scores/targetscan_70_context_scores.pl \
    && mv TargetScan7_context_scores/targetscan_70_context_scores.pl /usr/bin/ \
    && mv TargetScan7_context_scores/targetscan_count_8mers.pl /usr/bin/


# TargetScan depends on ViennaRNA
WORKDIR /usr/bin
RUN curl --output ./ViennaRNA-2.4.15.tar.gz https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.15.tar.gz \
    && tar -zxvf ViennaRNA-2.4.15.tar.gz
WORKDIR /usr/bin/ViennaRNA-2.4.15/
RUN ./configure --prefix=/usr/bin/ViennaRNA
RUN make install
RUN mv /usr/bin/ViennaRNA/bin/* /usr/bin
