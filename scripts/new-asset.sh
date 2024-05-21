#!/usr/bin/env bash

# Usage:
# $ . scripts/new-asset.sh "apps/foundation/basic" "PICO ✨"

path=$1
name=$2

echo "Project basic install (AssetMapper)"
echo "==================================="

symfony new "${path}" --version=6.4 --no-git
cp scripts/Makefile.dist "${path}/Makefile"
sed -i "s/__NAME__/${name}/g" "${path}/Makefile"

cd "${path}"
composer require --dev symfony/maker-bundle
composer require --dev symfony/profiler-pack

composer require symfony/asset-mapper symfony/asset symfony/twig-pack

make