#!/usr/bin/env bash

# Usage:
# $ . scripts/new-encore.sh "apps/foundation/basic" "FOUNDATION ❄️"

path=$1
name=$2

echo "Project basic install (Webpack Encore)"
echo "======================================"

symfony new "${path}" --version=6.4 --no-git
cp scripts/Makefile.dist "${path}/Makefile"
sed -i "s/__NAME__/${name}/g" "${path}/Makefile"

cd "${path}"
composer require --dev symfony/maker-bundle
composer require --dev symfony/profiler-pack

composer require symfony/webpack-encore-bundle
npm install

make

cd ../../..