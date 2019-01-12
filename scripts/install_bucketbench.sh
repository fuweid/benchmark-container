#!/usr/bin/env bash

set -euo pipefail

main() {
  local gopkg

  gopkg="${GOPATH}/src/github.com/estesp/bucketbench"

  # prepare package path
  mkdir -p ${gopkg}

  # download
  git clone -b support-pouch https://github.com/fuweid/bucketbench.git ${gopkg}

  # build and install
  cd ${gopkg}
  make
  sudo make install
}

main
