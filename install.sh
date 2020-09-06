#!/bin/bash

IMAGE=git/aarch64

function do_build {
    docker build -t ${IMAGE} .
}

function do_install {
    cat > git <<EOF
docker run --rm -it -v \${PWD}:/work -v \${HOME}/.gitconfig:/home/rancher/.gitconfig -v \${HOME}/.ssh:/home/rancher/.ssh ${IMAGE} /usr/bin/git \$*
EOF
    chmod +x git
    sudo mv git /usr/bin/git
}

function do_run {
    docker run \
        --rm \
        -it \
        -v $HOME/.gitconfig:/home/rancher/.gitconfig \
        -v $HOME/.ssh:/home/rancher/.ssh \
        -v ${PWD}:/work \
        -w /work \
        ${IMAGE} \
        /usr/bin/git $*
}

task=$1
shift
do_$task $*
