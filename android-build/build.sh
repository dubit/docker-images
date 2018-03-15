#!/bin/bash

CURRENT_DIR=$(pwd)
DIRECTORY_SEPARATOR="/"

base_images=(base)
sdk_only_images=(sdk-23 sdk-25 sdk-27)
ndk_images=(sdk-23-ndk sdk-25-ndk sdk-27-ndk)

# Build the base image first.
for i in "${base_images[@]}"
do
  cd "$CURRENT_DIR""$DIRECTORY_SEPARATOR""$i"
  docker build -t dubit/android-build-image:"$i" .
done

# Build the sdk only images next.
for i in "${sdk_only_images[@]}"
do
  cd "$CURRENT_DIR""$DIRECTORY_SEPARATOR""$i"
  docker build -t dubit/android-build-image:"$i" .
done

# Build the NDK based images last since those are
# based on the sdk ones.
for n in "${ndk_images[@]}"
do
  cd "$CURRENT_DIR""$DIRECTORY_SEPARATOR""$n"
  docker build -t dubit/android-build-image:"$n" .
done
