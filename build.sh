#!/usr/bin/env bash

build_home=$(pwd)
for f in $(find . -name 'Dockerfile' | sed 's/\.\///'); do
    build_path=$(dirname $f)
    name=$(awk -F '/' '{ print $1 }' <<< $f)
    version=$(awk -F '/' '{ print $2 }' <<< $f)
    cd $build_path
    echo "Building $name $version"
    docker build -t jacderida/$name:$version .
    cd $build_home
done
