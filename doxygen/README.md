# Doxygen
### `dubit/doxygen`
This is an image containing [Doxygen](www.doxygen.org/) for generating documentation pages from annotated code.

## Tools, compilers and utilities inside:
* Doxygen 1.8.11

## How to use the image:

The source code should be mounted into the container. Your project directory should contain a file named `doxyconfig`.

You can run the container with this command:

> `docker run -v </path/to/source/code>:/usr/src/app dubit/doxygen`

If you want to run the container with a differently named configuration file, you can pass it as the command to docker run, like so:

> `docker run -v </path/to/source/code>:/usr/src/app dubit/doxygen <custom_config_file_name>`

If you want to generate a configuration file within the container you can run the container with a `-g` command:

> `docker run -v </path/to/source/code>:/usr/src/app dubit/doxygen -g <configuration_name>`
