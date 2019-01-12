#!/usr/bin/env bash

set -euo pipefail

main() {
  # add PouchContainer office's gpg key
  curl -fsSL http://mirrors.aliyun.com/opsx/pouch/linux/debian/opsx@service.alibaba.com.gpg.key | sudo apt-key add -

  # add PouchContainer repo
  sudo add-apt-repository "deb http://mirrors.aliyun.com/opsx/pouch/linux/debian/ pouch stable"

  # update repo
  sudo apt-get update -qq -y

  # install pouch
  sudo apt-get install -qq -y pouch

  # start pouch
  sudo systemctl start pouch

  # check
  sudo pouch version
}

main
