#!/bin/sh
echo "_____________________________________________________________________________________________________________"
echo ' Jun Seung Cho                                                                                               '
echo "_____________________________________________________________________________________________________________"
echo "Splunk> MLTK Container for TensorFlow 2.0, PyTorch and Jupyterlab."

#tag="golden-image-cpu:3.6.0"
#base="nvidia/cuda:10.2-cudnn7-runtime-ubuntu16.04"
#dockerfile="Dockerfile"
tag="golden-image-cpu"
repo="phdrieger/"

base="ubuntu:20.04"
dockerfile="Dockerfile.3.6.cpu"
#docker pull phdrieger/mltk-container-golden-image-cpu:3.6.0

echo "Using tag [$tag] for building container based on [$base]"
echo "Stop, remove and build container..."

docker stop "$repo"mltk-container-$tag
docker rm "$repo"mltk-container-$tag
docker rmi "$repo"mltk-container-$tag


echo @@@ docker build --rm -t "$repo"mltk-container-$tag:latest --build-arg BASE_IMAGE=$base --build-arg TAG=$tag -f $dockerfile . @@@
docker build --rm -t "$repo"mltk-container-$tag:latest --build-arg BASE_IMAGE=$base --build-arg TAG=$tag -f $dockerfile .

#docker build --rm -t "$repo"mltk-container-$tag:latest --build-arg BASE_IMAGE=$base --build-arg TAG=$tag -f $dockerfile .

#if [ -z "$3" ]; then
#  version=""
#else
#  version="$3"
#  docker tag "$repo"mltk-container-$tag:latest "$repo"mltk-container-$tag:$version
#fi
