# Android build image
### `dubit/android-build-image`

This image contains an environment that allows building Android applications within a containerized environment. It is roughly based on the [Bitrise.io Android image](https://github.com/bitrise-docker/android).
All build images extend the `:base` build image. It contains all common utilities across the different SDK targets.

## Tools, compilers and utilities inside:
* Base OS: Ubuntu:16.04
* Version control: Git
* System tools:
  * curl
  * unzip
  * build-essential
* Build tools:
  * maven 3
  * gradle
  * react-native CLI
* Compilers and programming languages:
  * GCC (included by build-essential)
  * python 2.7
  * openJDK-8
  * Node.js 9.x
  * Ruby 2.3
* SDKs:
  * Android SDK 23/25/27
  * Android NDK r10e
  * Android build-tools - _all versions of build tools corresponding to the SDK version are included_

## How to use the image

The image has an entrypoint inherited from Ubuntu's image which is **"/bin/bash"**. You can execute your build from within the container in the following way:
> `docker run --rm=true -v <path/to/your/source>:/usr/src/app dubit/android-build-image:<sdk-version> /bin/bash -c "<comma separated list of commands that will build your app>"`

The working directory is set to be the source of your application.

## Link to DockerHub:

You can find this image on Dubit's Docker Hub: <https://hub.docker.com/r/dubit/android-build-image/>
