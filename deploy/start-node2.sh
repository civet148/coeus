#!/bin/sh
IMAGE_URL='coeus-node:latest'
CONTAINER_NAME=coeus2
DATA_DIR=/data/coeus/node2

# p2p port 26656
# node port 26657
# proxy port 26658
# prometheus port 26660
# app api port 1317
# app grpc port 9090
# app grpc web port 9091
docker run --net=host -p 26656:26656 26657:26657 -p 26658:26658 -p 26660:26660 -p 1317:1317 -p 9090:9090 -p 9091:9091 \
       -v $DATA_DIR:/root/.coeus \
       --restart always \
       --name $CONTAINER_NAME -d $IMAGE_URL coeusd start