#!/bin/bash
set -e

cd $(dirname $0)

export ARTIFACTS=$(pwd)/assets
./../../../scripts/download

rm -rf ./build
mkdir -p ./build

echo Extracting os-base.tar.xz
tar xJf os-base.tar.xz -C ./build/