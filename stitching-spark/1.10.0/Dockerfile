ARG SPARK_VERSION=3.1.3
ARG STITCHING_SPARK_GIT_TAG=1.10.0

# Temporary container for building cleanly
FROM janeliascicomp/builder:1.2.1 as builder
ARG STITCHING_SPARK_GIT_TAG

# Checkout and build the code
WORKDIR /tmp/app
# TODO: currently this points to a fork which adds a minor feature. It can be switched back to https://github.com/saalfeldlab/stitching-spark after the PR is merged.
RUN git clone --branch ${STITCHING_SPARK_GIT_TAG} --depth 1 https://github.com/krokicki/stitching-spark.git . \
    && git submodule update --init --recursive \
    && /usr/local/bin/buildinfo.sh \
    && mvn package

# Find the built jar, based on the version in the pom file
RUN xq -r '.project.artifactId+"-"+.project.version+".jar"' pom.xml > filename \
    && mv /tmp/app/target/`cat filename` app.jar

RUN echo "$STITCHING_SPARK_GIT_TAG" > /tmp/app/VERSION

# Create final image
FROM multifish/biocontainers-spark:${SPARK_VERSION}
ARG STITCHING_SPARK_GIT_TAG

MAINTAINER biocontainers <biodocker@gmail.com>
LABEL software="stitching-spark" \
    base_image="apache/spark" \
    container="stitching-spark" \
    about.summary="Reconstructing large microscopy images from overlapping image tiles on a high-performance Spark cluster" \
    about.home="https://github.com/saalfeldlab/stitching-spark" \
    software.version=${STITCHING_SPARK_GIT_TAG} \
    upstream.version=${STITCHING_SPARK_GIT_TAG} \
    version="1" \
    about.license="SPDX:GPL-2.0" \
    about.license_file="/app/LICENSE.txt" \
    extra.binaries="/opt/spark/bin" \
    about.tags="implemented-in::java, interface::commandline, role::program"

WORKDIR /app
COPY --from=builder /tmp/app/LICENSE.txt /app/LICENSE
COPY --from=builder /tmp/app/VERSION /app
COPY --from=builder /tmp/app/app.jar /app
COPY --from=builder /buildinfo /app
