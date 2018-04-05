################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="3"
LABEL software="MentaLiST"
LABEL software.version="0.1.3"
LABEL about.summary="The MLST pipeline developed by the PathOGiST research group."
LABEL about.home="https://github.com/WGS-TB/MentaLiST"
LABEL about.documentation="https://github.com/WGS-TB/MentaLiST"
LABEL about.license_file="https://github.com/WGS-TB/MentaLiST/blob/master/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="mentalist"

################## MAINTAINER ######################
MAINTAINER Pedro Feijão <pedrofeijao1975@gmail.com>
MAINTAINER Dan Fornika <dfornika@gmail.com>

RUN conda config --system --add channels conda-forge
RUN conda install mentalist=0.1.3

WORKDIR /data/

CMD ["mentalist"]
