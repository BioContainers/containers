################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="rpg"
LABEL software.version="1.1.0"
LABEL about.summary="RPG is a software dedicated to predict proteases-induced cleavage sites on amino acid sequences."
LABEL about.home="https://gitlab.pasteur.fr/nmaillet/rpg"
LABEL about.documentation="https://rapid-peptide-generator.readthedocs.io"
LABEL about.license_file="https://gitlab.pasteur.fr/nmaillet/rpg/blob/master/LICENSE"
LABEL about.license="GPL-3.0-or-later"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Nicolas Maillet <nicolas.maillet@pasteur.fr>

################## INSTALLATION ######################

USER root
RUN apt-get update && apt-get install -y \
	python3 \
	python3-pip && \
	apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ZIP=rpg-1.1.0.zip && \
    wget https://gitlab.pasteur.fr/nmaillet/rpg/-/archive/1.1.0/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/rpg/ && \
    rm /tmp/$ZIP && \
    cd /home/biodocker/rpg/rpg-1.1.0/ && \
	pip3 install -r requirements.txt && \
	python3 setup.py install && \
	rm -rf /home/biodocker/rpg/rpg-1.1.0

USER biodocker
WORKDIR /data/

CMD ["rpg", "--help"]