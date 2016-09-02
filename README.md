# Dubit Docker Images

A Collection of dockerfiles that are used to generate the public images stored on https://hub.docker.com/u/dubit


## Doxygen

A container that uses doxygen (www.doxygen.org) to generate documentation.

The source code is mounted by a volume and should contain a doxygen config file named doxyconfig

Example usage:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen

With a different config file name:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen alternativeconfig

Generate a config file:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen -g doxyconfig


## Flex-Gradle

An image for building flex/As3 applications with gradle, intended to be used with gradlefx plugin.
It contains the latest gradle version from niaquinto/gradle and apache flex 4.9.0with global player swc 11.1.