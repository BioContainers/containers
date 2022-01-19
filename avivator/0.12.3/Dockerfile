FROM ubuntu:20.04 as builder

LABEL base_image="ubuntu:20.04, nginx:latest"
LABEL version="1"
LABEL software="avivator"
LABEL software.version="0.12.3"
LABEL about.summary="Avivator is a lightweight batteries-included WebGL viewer for remote imaging data, built around Viv. "
LABEL about.home="https://github.com/hms-dbmi/viv/tree/master/avivator"
LABEL about.license="MIT License"
LABEL about.license_file="https://raw.githubusercontent.com/hms-dbmi/viv/master/LICENSE"
LABEL about.documentation="http://viv.gehlenborglab.org/"
LABEL maintainer ="sunyi000@gmail.com"

ARG DEBIAN_FRONTEND="noninteractive"

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8 \
    LANGUAGE en_US:en \
    TZ=Europe/Berlin 

WORKDIR /usr/local/app

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt update -qq && \
    apt-get -y install curl \
	 gnupg \
         libx11-6 \
         libxtst6 \
         git

RUN git clone https://github.com/hms-dbmi/viv.git

RUN curl -sL https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_14.x -o setup_14.sh

RUN bash setup_14.sh

RUN apt update -y && \
    apt install nodejs -y

WORKDIR /usr/local/app/viv

RUN npm install --unsafe-perm

RUN npm run build:avivator

FROM nginx:latest

COPY --from=builder /usr/local/app/viv/avivator/dist /usr/share/nginx/html
 
EXPOSE 80

#docker run -d -p 8080:80 avivator:latest
