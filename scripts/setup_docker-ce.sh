#!/usr/bin/env bash

set -euo pipefail

# from https://docs.docker.com/install/linux/docker-ce/ubuntu/
main() {
  # remove the old version of docker
  sudo apt-get remove -qq -y \
    docker \
    docker-engine \
    docker.io

  # docker-ce dependencies
  sudo apt-get install -qq -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

  # add Docker’s official GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  # add repository
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  # update repository
  sudo apt-get update -qq -y

  # install
  sudo apt-get install -qq -y docker-ce

  # check
  docker version
}

main
