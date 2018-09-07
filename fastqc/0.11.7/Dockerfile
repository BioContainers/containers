################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="FASTQC"
LABEL software.version="0.11.7"
LABEL about.summary="A quality control tool for high throughput sequence data."
LABEL about.home="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
LABEL about.documentation="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/"
LABEL about.license_file="https://www.gnu.org/copyleft/gpl.html"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="fastqc"
LABEL about.tags="General"

################## MAINTAINER ######################
MAINTAINER Roberto Vera Alvarez <r78v10a07@gmail.com>

RUN conda install fastqc

WORKDIR /data/

CMD ["fastqc"]
