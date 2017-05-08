# Doxygen

A container that uses doxygen (www.doxygen.org) to generate documentation.

The source code is mounted by a volume and should contain a doxygen config file named doxyconfig

Example usage:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen

With a different config file name:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen alternativeconfig

Generate a config file:

docker run -v /path/to/source/code:/usr/src/app dubit/doxygen -g doxyconfig
