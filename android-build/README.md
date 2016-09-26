# Android applications build

## Docker Hub repository: [Link](https://hub.docker.com/r/dubit/android-build-image/)

## How to use the image

The image has an entrypoint inherited from Ubuntu's image which is **"/bin/bash"**. You can execute your build from within the container in the following way:
> docker run --rm=true -v _<path/to/your/source>_:/usr/src/app dubit/android-build-image /bin/bash -c "_comma separated list of commands that will build your app_"

The working directory is set to be the source of your application.

## Tools, compilers and utilities included
 - OS - Ubuntu:16.04
 - Version control - Git
 - System tools - curl, unzip, build-essential
 - Build tools - maven, gradle, react-native CLI
 - Compilers and programming languages - GCC, G++, python, openJDK-8, Node.js 6.x
 - SDKs - Android SDK core components and Android NDK
