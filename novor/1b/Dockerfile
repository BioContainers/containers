# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="Novor"
LABEL software.version="1b"
LABEL description="real-time peptide de novo sequencing"
LABEL website="http://www.rapidnovor.com/"
LABEL documentation="http://www.rapidnovor.com/"
LABEL license="http://www.rapidnovor.com/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=novor_academic_latest.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/NovoR/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/novor_v1b/lib/novor.jar $@" > /home/biodocker/bin/novor' && \
  chmod +x /home/biodocker/bin/novor

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/
