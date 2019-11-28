################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="Aliscore"
LABEL software.version="2.0"
LABEL about.summary="Aliscore is designed to filter alignment ambiguous or randomly similar sites in multiple sequence alignments (MSA)."
LABEL about.home="https://www.zfmk.de/en/research/research-centres-and-groups/aliscore"
LABEL about.documentation="https://www.zfmk.de/dateien/atoms/files/aliscore_v.2.0_manual_0.pdf"
LABEL about.license_file="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Genomics"
LABEL extra.binaries="Aliscore.02.2.pl"

################## MAINTAINER ######################

MAINTAINER Emre YILMAZ <emre@eres.tech>

################## INSTALLATION ######################

USER biodocker

WORKDIR /tmp
RUN wget http://software.zfmk.de/ALISCORE_v2.0.zip && unzip /tmp/ALISCORE_v2.0.zip -d ./ \ 
  && mkdir -p /home/biodocker/bin/Aliscore \
  && unzip /tmp/ALISCORE_v2.0/Aliscore_v.2.0.zip -d /home/biodocker/bin/Aliscore/ \
  && chmod -R 755 /home/biodocker/bin/Aliscore \
  && rm -rf /tmp/ALISCORE_v2.0 

ENV PATH /home/biodocker/bin/Aliscore/Aliscore_v.2.0:$PATH
WORKDIR /data/

# CMD ["Aliscore.02.2.pl"]
