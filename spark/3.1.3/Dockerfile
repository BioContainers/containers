FROM apache/spark:v3.1.3

LABEL software="spark" \
    base_image="openjdk:openjdk11" \
    container="spark" \
    about.summary="Apache Spark" \
    about.home="https://spark.apache.org" \
    software.version="3.1.3" \
    upstream.version="3.1.3" \
    version="1" \
    about.license="SPDX:Apache-2.0" \
    about.license_file="/opt/spark/LICENSE" \
    extra.binaries="/opt/spark/bin" \
    about.tags="implemented-in::java, interface::daemon, role::devel-lib"

# Reset user to root
USER 0

# Save version inside container
RUN echo "3.1.3" > /opt/spark/VERSION

# Add scripts for running pipelines
COPY ./scripts /opt/scripts
