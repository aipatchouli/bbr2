#!/bin/bash

apt -y autoremove
apt install -y build-essential libncurses5-dev
apt -y build-dep linux

git clone -o google-bbr -b v2alpha  https://github.com/google/bbr.git

cd bbr

scripts/config --disable MODULE_SIG
scripts/config --disable DEBUG_INFO

make menuconfig

make -j16 deb-pkg
