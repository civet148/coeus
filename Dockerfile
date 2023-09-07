FROM golang:latest AS builder
MAINTAINER libin <civet148@126.com>

ENV SRC_DIR /code
COPY . $SRC_DIR

#RUN go env -w GOPROXY=https://goproxy.io
#RUN apt-get update && apt-get install -y ca-certificates make build-essential

FROM ubuntu:20.04

ENV SRC_DIR /code

COPY --from=builder $SRC_DIR/coeusd /usr/local/bin/coeusd
COPY --from=builder /etc/ssl/certs /etc/ssl/certs

ENV HOME_PATH /data
VOLUME $HOME_PATH
# node rpc port
EXPOSE 26657
# proxy app port
EXPOSE 26658
# prometheus port
EXPOSE 26660