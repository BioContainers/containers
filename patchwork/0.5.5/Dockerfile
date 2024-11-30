# To reduce the final image size, the build process has been split into a build
# stage and a production stage. After compiling Patchwork, the Julia
# installation is no longer needed and is therefore removed in the second stage.

# Stage 1/2: Build
# ----------------

# Set the base image
FROM ubuntu:22.04 AS builder

# System is non-interactive when building the Docker image
ENV DEBIAN_FRONTEND noninteractive

# Set time zone to Zurich, Europe
ENV TZ=Europe/Zurich
RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "$TZ" > /etc/timezone

# Update the repository sources and install required tools and libraries
RUN apt-get update && apt-get install --yes --no-install-recommends \
    apt-utils \
    wget \
    gcc \
    ca-certificates \
    python3-matplotlib \
    libqt5widgets5 \
    git

# Set work directory
WORKDIR '/opt'

# Download and install Julia
RUN wget --quiet 'https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.3-linux-x86_64.tar.gz' \
    && tar -xvzf 'julia-1.9.3-linux-x86_64.tar.gz' \
    && rm 'julia-1.9.3-linux-x86_64.tar.gz'
ENV PATH "/opt/julia-1.9.3/bin:${PATH}"

# Download and install DIAMOND
RUN wget 'http://github.com/bbuchfink/diamond/releases/download/v2.1.8/diamond-linux64.tar.gz' \
    && tar -xvzf 'diamond-linux64.tar.gz' \
    && mv 'diamond' '/usr/local/bin' \
    && rm 'diamond-linux64.tar.gz'

# Download and install Patchwork
RUN git clone 'https://github.com/fethalen/patchwork' \
    && cd patchwork/build \
    && ./build_app.jl

# Stage 2/2: Production
# ---------------------

# Set the base image
FROM ubuntu:22.04 AS production

# Metadata
LABEL org.opencontainers.image.authors="felix.thalen@cardio-care.ch"
LABEL version="1"
LABEL software="Patchwork"
LABEL software.version="0.5.5"
LABEL about.author="Felix Thalén <felix.thalen@cardio-care.ch>"
LABEL about.summary="Alignment-based Exon Retrieval and Concatenation with Phylogenomic Applications"
LABEL about.home="https://github.com/fethalen/patchwork"
LABEL about.documentation="https://github.com/fethalen/patchwork#readme"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.tags="phylogenomics, phylogenetics, genomics, alignment"

# System is non-interactive when building the Docker image
ENV DEBIAN_FRONTEND noninteractive

# Set time zone to Zurich, Europe
ENV TZ=Europe/Zurich
RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "$TZ" > /etc/timezone

# Create the user
RUN useradd --create-home --shell /bin/bash --user-group --uid 1000 patchwork

# Set the default user
USER patchwork

# Set the working directory
WORKDIR /home/patchwork

COPY --from=builder /opt/patchwork/build/compiled /opt/patchwork
COPY --from=builder /usr/local/bin/diamond /usr/local/bin/diamond
ENV PATH /opt/patchwork/bin:$PATH

ENTRYPOINT ["patchwork"]
