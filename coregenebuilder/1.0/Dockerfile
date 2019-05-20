FROM ubuntu:16.04

MAINTAINER Bertrand Neron <bneron@pasteur.fr>

LABEL version="2" \
    software="coregenebuilder" \ 
    software.version="1.0" \ 
    about.summary="CoreGeneBuilder can be used to extract a core genome (or a persistent genome) from a given set of bacterial genomes." \ 
    about.home="https://github.com/C3BI-pasteur-fr/CoreGeneBuilder" \ 
    base_image="ubuntu:16.04" \ 
    about.license="SPDX:GPL-3.0-only" \
    about.license_file="https://github.com/C3BI-pasteur-fr/CoreGeneBuilder/blob/master/COPYING" \ 
    ANNOT.Vendor="Institut Pasteur" \
    ANNOT.EDAM_Operation="['operation_2995', 'operation_0289', 'operation_0362', 'operation_0291']" \
    ANNOT.EDAM_Topic="['topic_0623']" \
    ANNOT.Requires="[blast+, muscle, biopython , R, prodigal, andi, ecamber, opscan, fasta2agp]" \
    ANNOT.Provides="['coregenebuilder']" \
    extra.binaries="coregenebuilder"
      
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
              ansible \
              unzip \
              time \
              bc \
              gawk \
              libgcj16 && \
    apt-get install -y python-pip && \
    apt-get clean

WORKDIR /tmp

ADD https://github.com/C3BI-pasteur-fr/IFB-playbook/archive/coregenebuilder.zip .

RUN unzip coregenebuilder.zip

WORKDIR /tmp/IFB-playbook-coregenebuilder/coregenebuilder

COPY inventory /tmp/IFB-playbook-coregenebuilder/coregenebuilder/Inventory/hosts

RUN ansible-playbook coregenebuilder.yml -i Inventory/ -c local

RUN useradd -m -d /root/mydisk -U cgb && \
    chmod 755 /root

WORKDIR /root/mydisk

USER cgb

# ENTRYPOINT ["coregenebuilder"]

# CMD ["-h"]

