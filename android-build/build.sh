#!/bin/bash

CURRENT_DIR=$(pwd)
DIRECTORY_SEPARATOR="/"

base_images=(sdk-23 sdk-25)
ndk_images=(sdk-23-ndk sdk-25-ndk)

# Build the base images first.
for i in "${base_images[@]}"
do
  cd "$CURRENT_DIR""$DIRECTORY_SEPARATOR""$i"
  docker build -t dubit/android-build-image:"$i" .
done

# Build the NDK based images second since those are
# based on the base ones.
for n in "${ndk_images[@]}"
do
  cd "$CURRENT_DIR""$DIRECTORY_SEPARATOR""$n"
  docker build -t dubit/android-build-image:"$n" .
done
