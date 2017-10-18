# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="Aliscore"
LABEL software.version="v.2.0"
LABEL description="Aliscore is designed to filter alignment ambiguous or randomly similar sites in multiple sequence alignments (MSA)."
LABEL website="https://www.zfmk.de/en/research/research-centres-and-groups/aliscore"
LABEL documentation="https://www.zfmk.de/dateien/atoms/files/aliscore_v.2.0_manual_0.pdf"
LABEL license="https://www.gnu.org/licenses/old-licenses/gpl-2.0.html"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Emre YILMAZ <emre@eres.tech>

USER biodocker

WORKDIR /tmp
RUN wget http://software.zfmk.de/ALISCORE_v2.0.zip && unzip /tmp/ALISCORE_v2.0.zip -d ./ \ 
  && mkdir -p /home/biodocker/bin/Aliscore \
  && unzip /tmp/ALISCORE_v2.0/Aliscore_v.2.0.zip -d /home/biodocker/bin/Aliscore/ \
  && chmod -R 755 /home/biodocker/bin/Aliscore \
  && rm -rf /tmp/ALISCORE_v2.0 

ENV PATH /home/biodocker/bin/Aliscore/Aliscore_v.2.0:$PATH
WORKDIR /data/

CMD ["Aliscore.02.2.pl"]
