#!/usr/bin/env bash

set -euo pipefail

main() {
  # stop pouchcontainer
  $(sudo systemctl stop pouch || echo)

  # remove it
  $(sudo apt-get remove -qq -y pouch || echo)
}

main
