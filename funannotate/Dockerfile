# start with miniconda3 as build environment
FROM condaforge/mambaforge AS build

# Update, install mamba and conda-pack:
RUN mamba install -n base --yes conda-pack

# Install funannotate deps from bioconda
# here specifying specific versions to be able to set ENV below
RUN mamba create -c conda-forge -c bioconda -c defaults \
    -n funannotate --yes "python>=3.6,<3.9" "biopython<1.80" xlrd==1.2.0 \
    "trinity==2.8.5" "evidencemodeler==1.1.1" "pasa==2.4.1" "codingquarry==2.0" \
    "proteinortho==6.0.16" goatools matplotlib-base natsort numpy pigz \
    pandas psutil requests "scikit-learn<1.0.0" scipy seaborn "blast=2.2.31" \
    tantan bedtools hmmer exonerate "diamond>=2.0.5" tbl2asn blat "trnascan-se>=2.0" \
    ucsc-pslcdnafilter trimmomatic raxml iqtree trimal "mafft>=7" hisat2 \
    "kallisto==0.46.1" minimap2 stringtie "salmon>=0.9" "samtools>=1.9" \
    glimmerhmm bamtools perl perl-yaml perl-file-which perl-local-lib perl-dbd-mysql perl-clone perl-hash-merge \
    perl-soap-lite perl-json perl-logger-simple perl-scalar-util-numeric perl-math-utils perl-mce \
    perl-text-soundex perl-parallel-forkmanager perl-db-file perl-perl4-corelibs ete3 distro \
    && conda clean -a -y

# Since we want the most recent, install from repo, remove snap as broken
SHELL ["conda", "run", "-n", "funannotate", "/bin/bash", "-c"]
RUN python -m pip install git+https://github.com/nextgenusfs/funannotate.git

# package with conda-pack
RUN conda-pack --ignore-missing-files -n funannotate -o /tmp/env.tar && \
    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
    rm /tmp/env.tar

# We've put venv in same path it'll be in final image
RUN /venv/bin/conda-unpack

# Now build environment
FROM debian:buster AS runtime

# Copy /venv from the previous stage:
COPY --from=build /venv /venv

# Install debian snap via apt-get
RUN apt-get update && apt-get install -y snap augustus augustus-data locales locales-all libgl1 procps && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/snap-hmm /usr/bin/snap && \
    rm "/venv/bin/fasta" && \
    ln -s "/venv/bin/fasta36" "/venv/bin/fasta"

# add it to the PATH and add env variables
ENV PATH="/venv/bin:$PATH" \
    AUGUSTUS_CONFIG_PATH="/usr/share/augustus/config" \
    EVM_HOME="/venv/opt/evidencemodeler-1.1.1" \
    PASAHOME="/venv/opt/pasa-2.4.1" \
    TRINITYHOME="/venv/opt/trinity-2.8.5" \
    QUARRY_PATH="/venv/opt/codingquarry-2.0/QuarryFiles" \
    ZOE="/usr/share/snap" \
    USER="me" \
    FUNANNOTATE_DB="/opt/databases"

# When image is run, run the code with the environment
SHELL ["/bin/bash", "-c"]
CMD funannotate
