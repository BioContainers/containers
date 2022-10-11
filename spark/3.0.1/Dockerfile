FROM centos:centos8

LABEL    software="spark" \ 
    base_image="centos:centos8" \ 
    container="spark" \ 
    about.summary="Apache Spark" \ 
    about.home="https://spark.apache.org" \ 
    software.version="3.0.1-hadoop3.2" \ 
    upstream.version="3.0.1" \ 
    version="1" \ 
    about.license="SPDX:Apache-2.0" \ 
    about.license_file="/spark/LICENSE" \ 
    extra.binaries="/spark/bin" \ 
    about.tags="implemented-in::java, interface::daemon, role::devel-lib" 

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2

RUN dnf install -y \
        tar wget \
        hostname \
        net-tools \
        java-1.8.0-openjdk.x86_64 \
        python3 \
        && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
        && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        && cd /
