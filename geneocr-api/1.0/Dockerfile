# base image
FROM python:3.10-slim

# metadata
LABEL base_image="python:3.10-slim"
LABEL version="1"
LABEL software="GeneOCR API"
LABEL software.version="1.0.0"
LABEL about.summary="API of geneocr tool, which reads gene names in images"
LABEL about.home="https://github.com/bedapub/geneocr-api"
LABEL maintainer="Jitao David Zhang"
LABEL maintainer.email="jitao_david.zhang@roche.com"

# install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
    build-essential \
    libpcre++-dev \
    gfortran \
    ca-certificates \
    cmake \
    git \
    wget 
#    python3 \
#    python3-pip \
#    zlib1g-dev \
#    libpng-dev \
#    libfile-slurp-perl && \
#    apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/bedapub/geneocr-ui.git && \
    cd geneocr-ui && \
    ls

WORKDIR /code

COPY ./app/requirements.txt /code/requirements.txt

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 libleptonica-dev tesseract-ocr libtesseract-dev python3-pil tesseract-ocr-eng tesseract-ocr-script-latn  -y

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

RUN groupadd -g 1001 pmdagroup && \
    useradd -g pmdagroup -u 1001 pmdauser

USER pmdauser

WORKDIR /code/app

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

