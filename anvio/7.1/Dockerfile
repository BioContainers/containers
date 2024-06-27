FROM debian:bookworm-slim

MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="Anvio"

ADD anvio71.yaml /tmp
ADD requirements.txt /tmp

RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/merenlab/anvio/releases/download/v7.1/anvio-7.1.tar.gz

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN if [ $(uname -m) = x86_64 ] ; then arch=x86_64; \
    elif [ $(uname -m) = aarch64 ] ; then arch=aarch64; \
    else echo "Architecture $(uname -m) is not supported" >&2; exit 1; \
    fi && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-${arch}.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-${arch}.sh -b \
    && rm -f Miniconda3-latest-Linux-${arch}.sh

RUN conda env create -f /tmp/anvio71.yaml \
    && cp /root/miniconda3/envs/anvio-71py37/lib/python3.7/_sysconfigdata_x86_64_conda_cos6_linux_gnu.py /root/miniconda3/envs/anvio-71py37/lib/python3.7/_sysconfigdata_x86_64_conda_linux_gnu.py

RUN conda init bash && . ~/.bashrc
 
SHELL ["conda", "run", "-n", "anvio-71py37", "/bin/bash", "-c"]
    
RUN pip install anvio-7.1.tar.gz \
    && pip install dendropy==5.0.1 \
    && rm anvio-7.1.tar.gz \
    && wget https://github.com/jtamames/SqueezeMeta/archive/refs/tags/v1.6.3.tar.gz \
    && tar -vxzf v1.6.3.tar.gz \
    && rm v1.6.3.tar.gz
    
RUN ls
RUN pwd

#WORKDIR /root/v1.6.3/

CMD ["/bin/sh"]

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "anvio-71py37"]

