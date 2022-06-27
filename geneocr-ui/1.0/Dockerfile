# base image
FROM node:13.12.0-alpine as build

# metadata
LABEL base_image="node:13.12.0-alpine"
LABEL version="1"
LABEL software="GeneOCR UI"
LABEL software.version="1.0.0"
LABEL about.summary="UI of geneocr tool, which reads gene names in images"
LABEL about.home="https://github.com/bedapub/geneocr-ui"
LABEL maintainer="Jitao David Zhang"
LABEL maintainer.email="jitao_david.zhang@roche.com"

# install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apk add --update  && \
    apk add --progress -f install \ 
    build-essential \
    wget \
    git
    #libpcre++-dev \
    #gfortran \
    #ca-certificates \
    #cmake \
    #git \
    #wget 
#    python3 \
#    python3-pip \
#    zlib1g-dev \
#    libpng-dev \
#    libfile-slurp-perl && \
#    apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/bedapub/geneocr-ui.git && \
    cd geneocr-ui && \
    ls

ENV PATH /geneocr-ui/node_modules/.bin:$PATH
RUN cd /geneocr-ui && \
    npm install && \
    npm run build

FROM nginxinc/nginx-unprivileged:stable-alpine
COPY --chown=101 --from=build /geneocr-ui/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY --chown=101 --from=build /geneocr-ui/nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]