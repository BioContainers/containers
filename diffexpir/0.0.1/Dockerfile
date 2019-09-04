################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="5"
LABEL software="diffexpir"
LABEL software.version="0.0.1"
LABEL about.summary="Differentially expressed intron retention"
LABEL about.home="https://github.com/r78v10a07/DiffExpIR"
LABEL about.documentation="https://github.com/r78v10a07/DiffExpIR"
LABEL about.license_file="https://github.com/r78v10a07/DiffExpIR"
LABEL about.license="SPDX:MIT"
LABEL about.tags="RNA-seq"
LABEL extra.binaries="diffexpIR"

################## MAINTAINER ######################
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>

################## INSTALLATION ######################

USER biodocker

ENV BAMTOOLS_DIR="$HOME/bamtoolslib"

RUN cd $HOME && \
	git clone https://github.com/pezmaster31/bamtools.git bamtools && \
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

ENV URL="https://github.com/r78v10a07/DiffExpIR.git"

RUN cd $HOME && \
	git clone $URL diffexpir && \
	cd diffexpir && \
	make && \
	ln -s $HOME/diffexpir/bin/diffexpIR $HOME/bin/

WORKDIR /data/

# CMD ["diffexpIR"]
