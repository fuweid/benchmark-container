#!/usr/bin/env bash

set -euo pipefail

main() {
  # stop docker
  $(sudo systemctl stop docker || echo)

  # remove it
  $(sudo apt-get remove -qq -y docker || echo)
}

main
