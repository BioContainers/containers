FROM rust:1.78-buster AS builder

# RUN cargo new --bin /app/rastair
WORKDIR /app 
RUN git clone --branch v0.8.2 https://bitbucket.org/bsblabludwig/rastair.git
WORKDIR /app/rastair
RUN cargo build --release

FROM r-base:4.3.2 AS release
# Copy the compiled binary from the build stage
COPY --from=builder /app/rastair/target/release/rastair /usr/local/bin/rastair

# Install system dependencies
RUN apt update
RUN apt-get -y upgrade

# Install `ps` command for process monitoring
RUN apt-get -y install procps

# Install BiocManager for Bioconductor package management
RUN Rscript -e "install.packages('BiocManager', repos='https://cloud.r-project.org')"

# Install required R and Bioconductor packages
RUN Rscript -e "BiocManager::install('Rsamtools', version = '3.18', ask = FALSE)" \
    -e "if (!requireNamespace('remotes', quietly = TRUE)) install.packages('remotes', repos = 'https://cloud.r-project.org')" \
    -e "remotes::install_version('ggplot2', version = '3.5.1', repos = 'https://cloud.r-project.org')" \
    -e "remotes::install_version('gtable', version = '0.3.6', repos = 'https://cloud.r-project.org')"

WORKDIR /app

# Copy R scripts
COPY --from=builder /app/rastair/scripts /app/scripts
