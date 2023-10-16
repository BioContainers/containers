ARG SPARK_VERSION=3.1.3

FROM apache/spark:v${SPARK_VERSION}
ARG SPARK_VERSION

MAINTAINER biocontainers <biodocker@gmail.com>
LABEL software="spark" \
    base_image="openjdk:openjdk11" \
    container="spark" \
    about.summary="Apache Spark is a unified analytics engine for large-scale data processing. This container combines the Spark runtime with additional scripts for simplified creation of Spark clusters." \
    about.home="https://spark.apache.org" \
    about.documentation="https://spark.apache.org/docs/3.1.3" \
    software.version=${SPARK_VERSION} \
    upstream.version=${SPARK_VERSION} \
    version="1" \
    about.license="SPDX:Apache-2.0" \
    about.license_file="/opt/spark/LICENSE" \
    extra.identifiers.biotools="spark" \
    extra.binaries="/opt/spark/bin" \
    about.tags="implemented-in::java, interface::daemon, role::devel-lib"

# Reset user to root so that the image works in Singularity
USER 0

# Save version inside container
RUN echo "${SPARK_VERSION}" > /opt/spark/VERSION

# Add scripts for running pipelines
COPY ./scripts /opt/scripts
