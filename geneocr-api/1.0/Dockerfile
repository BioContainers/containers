# base image
FROM python:3.10-slim

# metadata
LABEL base_image="python:3.10-slim"
LABEL version="1"
LABEL software="GeneOCR API"
LABEL software.version="1.0"
LABEL about.summary="API of geneocr tool, which reads gene names in images"
LABEL about.home="https://github.com/bedapub/geneocr-api"
LABEL maintainer="Jitao David Zhang"
LABEL maintainer.email="jitao_david.zhang@roche.com"
LABEL about.license="GPL-3.0-or-later"
LABEL about.license_file="/geneocr-api/LICENSE.md"

# install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
    build-essential \
    wget \
    git 

RUN apt-get install ffmpeg libsm6 libxext6 libleptonica-dev tesseract-ocr libtesseract-dev python3-pil tesseract-ocr-eng tesseract-ocr-script-latn  -y


RUN git clone --depth=1 https://github.com/bedapub/geneocr-api.git && \
    cd geneocr-api && \
    ls

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r geneocr-api/app/requirements.txt

RUN groupadd -g 1001 pmdagroup && \
    useradd -g pmdagroup -u 1001 pmdauser

USER pmdauser

WORKDIR /geneocr-api/app

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
