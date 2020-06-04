FROM alpine AS base

ARG RANCHER_UID=1100
ARG RANCHER_GID=1100

RUN apk update && \
    apk add curl git && \
    adduser -h /home/rancher -s /bin/sh -g ${RANCHER_GID} -u ${RANCHER_UID} -D rancher

USER rancher
WORKDIR /work
