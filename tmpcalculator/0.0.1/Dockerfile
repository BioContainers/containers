################## BASE IMAGE ######################
FROM biocontainers/bamtools:latest

################## METADATA ######################
LABEL base_image="bamtools:latest"
LABEL version="3"
LABEL software="TPMCalculator"
LABEL software.version="0.0.1"
LABEL about.summary="This program calculates the TPM (Transcript per Millions) values for the exons and introns from NGS RNA-Seq aligned reads (BAM files)"
LABEL about.home="https://github.com/ncbi/TPMCalculator"
LABEL about.documentation="https://github.com/ncbi/TPMCalculator"
LABEL about.license_file="https://github.com/ncbi/TPMCalculator/blob/master/LICENSE"
LABEL about.tags="RNA-seq"

################## MAINTAINER ######################
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>

USER biodocker

ENV URL=https://github.com/r78v10a07/TPMCalculator
ENV FOLDER=TPMCalculator
ENV DST=/tmp
ENV BAMTOOLS_DIR=/home/biodocker
ENV CPPFLAGS="-I $BAMTOOLS_DIR/include/bamtools"
ENV LDFLAGS="-L $BAMTOOLS_DIR/lib/bamtools -Wl,-rpath,$BAMTOOLS_DIR/lib/bamtools"

RUN cd $DST && \
	git clone $URL && \
	cd $FOLDER && \
	make && \
	mv $DST/$FOLDER/bin/* /home/biodocker/bin/ && \
	rm -rf $DST/$FOLDER

WORKDIR /data/

CMD ["TPMCalculator"]
