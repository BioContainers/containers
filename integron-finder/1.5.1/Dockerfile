FROM ubuntu:16.04

#####EXTRA LABELS#####
LABEL autogen="no" \ 
    software="Integron Finder" \ 
    version="2" \
    software.version="1.5.1" \ 
    about.summary="Integron Finder aims at detecting integrons in DNA sequences." \ 
    base_image="ubuntu:16.04" \
    about.home="https://github.com/gem-pasteur/Integron_Finder" \
    about.license="SPDX:GPL-3.0-only" \
    extra.identifier.biotools="integron_finder" \ 
    extra.binaries="integron_finder" \
    ANNOT.Vendor="Institut Pasteur" \
    ANNOT.EDAM_Operation="['operation_0361', 'operation_0362', 'operation_0239', 'operation_2423', 'operation_0253', 'operation_3087', 'operation_0415']" \
    ANNOT.EDAM_Topic="['topic_0160', 'topic_0160', 'topic_0080', 'topic_3073', 'topic_3053', 'topic_3053', 'topic_0114', 'topic_0798']" \
    ANNOT.Requires="['Prodigall 2.6.2', 'infernal 1.1.1', 'hmmer 3.1b2', 'numpy 1.11.0', 'matplotlib 1.5.1', 'biopython 1.66']" \
    ANNOT.Provides="['integron_finder']"
      
MAINTAINER Bertrand Neron <bneron@pasteur.fr>

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends prodigal infernal hmmer && \
    apt-get install -y python-pip python-numpy python-matplotlib python-biopython && \
    apt-get clean

# It will install pandas too
# I don't use pandas package because the version is too old 0.17
RUN pip install integron_finder

RUN useradd -m -U if -G users

USER if

WORKDIR /home/if

# ENTRYPOINT ["integron_finder"]

# CMD ["-h"]

