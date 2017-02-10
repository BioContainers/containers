FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="star"
LABEL software.version="2.5.2b"
LABEL description="RNA-Seq aligner"
LABEL website="https://github.com/alexdobin/STAR"
LABEL documentation="https://github.com/alexdobin/STAR"
LABEL license="https://github.com/alexdobin/STAR"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Nati Ha <nati.hd16@gmail.com>

RUN conda install -c bioconda star=2.5.2b

WORKDIR /data/

CMD ["STAR"]
