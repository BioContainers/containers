################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="5"
LABEL software="TPMCalculator"
LABEL software.version="0.0.1"
LABEL about.summary="This program calculates the TPM (Transcript per Millions) values for the exons and introns from NGS RNA-Seq aligned reads (BAM files)"
LABEL about.home="https://github.com/ncbi/TPMCalculator"
LABEL about.documentation="https://github.com/ncbi/TPMCalculator"
LABEL about.license_file="https://github.com/ncbi/TPMCalculator/blob/master/LICENSE"
LABEL about.tags="RNA-seq"
LABEL extra.binaries="TPMCalculator"

################## MAINTAINER ######################
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>

USER biodocker

ENV BAMTOOLS_URL=https://github.com/pezmaster31/bamtools.git
ENV URL=https://github.com/ncbi/TPMCalculator
ENV FOLDER=TPMCalculator
ENV DST=/tmp
ENV BAMTOOLS_DIR=$HOME/bamtoolslib

RUN cd $HOME && \
	git clone $BAMTOOLS_URL bamtools && \
	cd bamtools && \
	mkdir build && \
	cd build && \
	mkdir $BAMTOOLS_DIR && \
	cmake -DCMAKE_INSTALL_PREFIX=$BAMTOOLS_DIR .. && \
	make install && \
	cd $HOME && \
	rm -rf $HOME/bamtools

ENV CPPFLAGS="-I $BAMTOOLS_DIR/include/bamtools"
ENV LDFLAGS="-L $BAMTOOLS_DIR/lib -Wl,-rpath,$BAMTOOLS_DIR/lib"

RUN cd $DST && \
	git clone $URL && \
	cd $FOLDER && \
	make && \
	mv $DST/$FOLDER/bin/* /home/biodocker/bin/ && \
	rm -rf $DST/$FOLDER

WORKDIR /data/

# CMD ["TPMCalculator"]
