# Temporary container for building cleanly
FROM janeliascicomp/builder:1.2.1 as builder
ARG STITCHING_SPARK_GIT_TAG=master

# Checkout and build the code
WORKDIR /tmp/app
RUN git clone --branch $STITCHING_SPARK_GIT_TAG --depth 1 https://github.com/saalfeldlab/stitching-spark.git . \
    && git submodule update --init --recursive \
    && /usr/local/bin/buildinfo.sh \
    && mvn package

# Find the built jar, based on the version in the pom file
RUN xq -r '.project.artifactId+"-"+.project.version+".jar"' pom.xml > filename \
    && mv /tmp/app/target/`cat filename` app.jar

# Create final image
FROM multifish/biocontainers-spark:3.1.3

LABEL software="stitching-spark" \ 
    base_image="apache/spark" \ 
    container="stitching-spark" \ 
    about.summary="Reconstructing large microscopy images from overlapping image tiles on a high-performance Spark cluster" \ 
    about.home="https://github.com/saalfeldlab/stitching-spark" \ 
    software.version="1.9.0" \ 
    version="1" \ 
    about.license="SPDX:GPL-2.0" \ 
    about.license_file="/app/LICENSE.txt" \ 
    extra.binaries="/spark/bin" \ 
    about.tags="implemented-in::java, interface::commandline, role::program" 

WORKDIR /app
COPY --from=builder /tmp/app/LICENSE.txt /app/LICENSE.txt
COPY --from=builder /tmp/app/app.jar /app/app.jar
COPY --from=builder /buildinfo /
