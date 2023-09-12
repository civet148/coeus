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


# p2p port
EXPOSE 26656
# node port
EXPOSE 26657
# proxy port
EXPOSE 26658
# prometheus port
EXPOSE 26660
# app api port
EXPOSE 1317
# app grpc port
EXPOSE 9090
# app grpc web port
EXPOSE 9091