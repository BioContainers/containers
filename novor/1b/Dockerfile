################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="5"
LABEL software="Novor"
LABEL software.version="1b"
LABEL about.summary="real-time peptide de novo sequencing"
LABEL about.home="http://www.rapidnovor.com/"
LABEL about.documentation="http://www.rapidnovor.com/"
LABEL about.license_file="https://www.rapidnovor.com/rndl/novor_aca_eula.txt"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="novor"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=novor_academic_latest.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/NovoR/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/novor_v1b/lib/novor.jar \$@" > /home/biodocker/bin/novor' && \
  chmod +x /home/biodocker/bin/novor

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/
