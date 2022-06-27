# base image
FROM node:13.12.0-alpine as build

# metadata
LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="GeneOCR"
LABEL software.version="1.0.0"
LABEL about.summary="Reading of gene names in images"
LABEL about.home="https://github.com/bedapub/geneocr-ui"
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

# stage1 - build react app first 
#FROM node:13.12.0-alpine as build
#WORKDIR /app
#ENV PATH /app/node_modules/.bin:$PATH
#COPY ./package.json /app/
#COPY ./package-lock.json /app/
#RUN npm install
#COPY . /app
#RUN npm run build

# stage 2 - build the final image and copy the react build files
#FROM nginxinc/nginx-unprivileged:stable-alpine
#COPY --chown=101 --from=build /app/build /usr/share/nginx/html
#RUN rm /etc/nginx/conf.d/default.conf
#COPY --chown=101 nginx/nginx.conf /etc/nginx/conf.d
#EXPOSE 3000
#CMD ["nginx", "-g", "daemon off;"]