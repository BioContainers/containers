## Stage for build cvtree
FROM alpine AS dev
LABEL Version=0.2 \
  MAINTAINER="Sebastian Bassi <sebastian@toyoko.io>"\
  description="Docker image for CVTree" 

# Original author: Dr. Guanghong Zuo

## for develop environment
RUN apk --update add --no-cache g++ make cmake zlib-dev boost-dev
RUN apk --update add --no-cache hdf5-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk --update add --no-cache nlohmann-json --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community


## Build cvtree
WORKDIR /root
COPY ./cvtree /root/cvtree/cvtree
COPY ./kit /root/cvtree/kit
COPY ./CMakeLists.txt /root/cvtree/
RUN mkdir cvtree/build/ && cd cvtree/build/ && cmake .. && make 

## Stage for run cvtree 
FROM alpine AS run
COPY --from=dev /root/cvtree/build/bin/* /usr/local/bin/
RUN apk --update add --no-cache libgomp libstdc++
RUN apk --update add --no-cache hdf5 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk --update add --no-cache hdf5-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk --update add --no-cache nlohmann-json --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

## for workplace
WORKDIR /root/data
