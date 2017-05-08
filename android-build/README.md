# Android build image
### `dubit/android-build-image`

This image contains an environment that allows building Android applications within a containerized environment. It is roughly based on the [Bitrise.io Android image](https://github.com/bitrise-docker/android).

## Tools, compilers and utilities inside:
* Base OS: Ubuntu:16.04
* Version control: Git
* System tools: curl, unzip, build-essential
* Build tools: maven, gradle, react-native CLI
* Compilers and programming languages: GCC, G++, python, openJDK-8, Node.js 6.x
* SDKs: Android SDK core components and Android NDK

## How to use the image

The image has an entrypoint inherited from Ubuntu's image which is **"/bin/bash"**. You can execute your build from within the container in the following way:
> `docker run --rm=true -v <path/to/your/source>:/usr/src/app dubit/android-build-image /bin/bash -c "<comma separated list of commands that will build your app>"`

The working directory is set to be the source of your application.

## Link to DockerHub:

You can find this image on Dubit's Docker Hub: <https://hub.docker.com/r/dubit/android-build-image/>
