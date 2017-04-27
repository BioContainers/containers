FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="MACS2"
LABEL software.version="2.1.1.20160309"
LABEL description="ChIP-Seq peak Calling"
LABEL website="https://github.com/taoliu/MACS"
LABEL documentation="https://github.com/taoliu/MACS"
LABEL license="https://github.com/taoliu/MACS"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Nati Ha <nati.hd16@gmail.com>

RUN conda install -c bioconda macs2=2.1.1.20160309

WORKDIR /data/

CMD ["macs2"]
