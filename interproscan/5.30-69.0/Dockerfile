################## MultiStage build ######################

################## Data ######################

FROM busybox AS builddata

MAINTAINER Ola Tarkowska (EMBL-EBI) <olat@ebi.ac.uk>

ARG IPR=5
ENV IPR $IPR
ARG IPRSCAN=5.30-69.0
ENV IPRSCAN $IPRSCAN

RUN mkdir -p /opt/interproscan


RUN wget -O /opt/interproscan-data-$IPRSCAN.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-data-$IPRSCAN.tar.gz
RUN wget -O /opt/interproscan-data-$IPRSCAN.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-data-$IPRSCAN.tar.gz.md5


WORKDIR /opt

RUN md5sum -c interproscan-data-$IPRSCAN.tar.gz.md5

RUN  tar -pxvzf interproscan-data-$IPRSCAN.tar.gz \
    -C /opt/interproscan --strip-components=1 \
    && rm -f interproscan-data-$IPRSCAN.tar.gz interproscan-data-$IPRSCAN.tar.gz.md5


################## Core ######################

FROM busybox AS buildcore

MAINTAINER Ola Tarkowska (EMBL-EBI) <olat@ebi.ac.uk>

ARG IPR=5
ENV IPR $IPR
ARG IPRSCAN=5.30-69.0
ENV IPRSCAN $IPRSCAN

RUN mkdir -p /opt

RUN wget -O /opt/interproscan-core-$IPRSCAN.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-core-$IPRSCAN.tar.gz
RUN wget -O /opt/interproscan-core-$IPRSCAN.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-core-$IPRSCAN.tar.gz.md5


WORKDIR /opt

RUN md5sum -c interproscan-core-$IPRSCAN.tar.gz.md5

RUN mkdir -p /opt/interproscan

RUN  tar -pxvzf interproscan-core-$IPRSCAN.tar.gz \
    -C /opt/interproscan --strip-components=1 \
    && rm -f interproscan-core-$IPRSCAN.tar.gz interproscan-core-$IPRSCAN.tar.gz.md5


################## Bin ######################

FROM busybox AS buildbin

MAINTAINER Ola Tarkowska (EMBL-EBI) <olat@ebi.ac.uk>

ARG IPR=5
ENV IPR $IPR
ARG IPRSCAN=5.30-69.0
ENV IPRSCAN $IPRSCAN

RUN mkdir -p /opt

RUN wget -O /opt/interproscan-bin-$IPRSCAN.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-bin-$IPRSCAN.tar.gz
RUN wget -O /opt/interproscan-bin-$IPRSCAN.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/alt/interproscan-bin-$IPRSCAN.tar.gz.md5

WORKDIR /opt

RUN md5sum -c interproscan-bin-$IPRSCAN.tar.gz.md5

RUN mkdir -p /opt/interproscan

RUN tar -pxvzf interproscan-bin-$IPRSCAN.tar.gz \
    -C /opt/interproscan --strip-components=1 \
    && rm -f interproscan-bin-$IPRSCAN.tar.gz interproscan-bin-$IPRSCAN.tar.gz.md5


################## BASE IMAGE ######################

FROM ubuntu:16.04

MAINTAINER Ola Tarkowska (EMBL-EBI) <olat@ebi.ac.uk>
LABEL  base_image="ubuntu:16.04" \
       software="interproscan" \
       software.version="5.30-69.0" \
       version="1" \
       about.summary="Scan sequences against the InterPro protein signature databases." \
       about.home="https://www.ebi.ac.uk/interpro/interproscan.html" \
       about.license="Apache-2.0" \
       about.license_file="https://github.com/ebi-pf-team/interproscan/blob/dev/LICENSE" \
       about.documentation="https://github.com/ebi-pf-team/interproscan/wiki" \
       about.tags="biology::nucleic, biology::protein, field::biology, field::biology:bioinformatics, interface::commandline, role::program,:biological-sequence" \
       extra.identifier.biotools="interproscan_4"


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        openjdk-8-jre   \
        build-essential \
        pkg-config      \
        python3          \
        bzip2           \
        ca-certificates   && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/*

COPY --from=buildcore /opt/interproscan /opt/interproscan
COPY --from=buildbin /opt/interproscan/bin /opt/interproscan/bin
COPY --from=builddata /opt/interproscan/data/cdd /opt/interproscan/data/cdd
COPY --from=builddata /opt/interproscan/data/gene3d /opt/interproscan/data/gene3d
COPY --from=builddata /opt/interproscan/data/hamap /opt/interproscan/data/hamap
COPY --from=builddata /opt/interproscan/data/pfam /opt/interproscan/data/pfam
COPY --from=builddata /opt/interproscan/data/phobius /opt/interproscan/data/phobius
COPY --from=builddata /opt/interproscan/data/pirsf /opt/interproscan/data/pirsf
COPY --from=builddata /opt/interproscan/data/prints /opt/interproscan/data/prints
COPY --from=builddata /opt/interproscan/data/prodom /opt/interproscan/data/prodom
COPY --from=builddata /opt/interproscan/data/prosite /opt/interproscan/data/prosite
COPY --from=builddata /opt/interproscan/data/sfld /opt/interproscan/data/sfld
COPY --from=builddata /opt/interproscan/data/smart /opt/interproscan/data/smart
COPY --from=builddata /opt/interproscan/data/superfamily /opt/interproscan/data/superfamily
COPY --from=builddata /opt/interproscan/data/tigrfam /opt/interproscan/data/tigrfam
COPY --from=builddata /opt/interproscan/data/tmhmm /opt/interproscan/data/tmhmm

WORKDIR /opt/interproscan

CMD ["/bin/bash", "interproscan.sh"]


##################### INSTALLATION END #####################
