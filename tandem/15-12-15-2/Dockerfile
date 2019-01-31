
################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="X!Tandem"
LABEL software.version="15-12-15-2"
LABEL about.summary="software that can match tandem mass spectra with peptide sequences"
LABEL about.home="http://www.thegpm.org/tandem/"
LABEL about.documentation="http://www.thegpm.org/tandem/"
LABEL about.license_file="http://www.thegpm.org/tandem/"
LABEL about.license="SPDX:Artistic-2.0"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="xtandem"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=tandem-linux-15-12-15-2.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/X!Tandem/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP

RUN bash -c 'echo -e "#!/bin/bash\n/home/biodocker/bin/tandem-linux-15-12-15-2/bin/tandem.exe \$@"' > /home/biodocker/bin/tandem && \
  chmod 755 /home/biodocker/bin/tandem

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/
