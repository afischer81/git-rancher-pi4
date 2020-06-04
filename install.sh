#!/bin/bash

IMAGE=git/aarch64

function do_build {
    docker build -t ${IMAGE} .
}

function do_install {
    echo "use the following alias"
    echo
    echo "alias git='docker run --rm -it -v \$PWD:/work ${IMAGE} /usr/bin/git'"
    echo
}

function do_run {
    docker run \
        --rm \
        -v $PWD:/work \
        ${IMAGE} \
        /usr/bin/git $*
}

task=$1
shift
do_$task $*
