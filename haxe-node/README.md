# Haxe Node
### `dubit/haxe-node`

This is an image for building haxe applications with haxe and node

## Tools, compilers and utilities inside:

* Node 10.15.0 from the official Node image
* Haxe 3.1.3
* Neko 2.0.0

* Npm install is run as the first command, to add tools and compilers add them to your `package.json`

## How to use the image:

Your source code **must** include a `package.json` and needs to be mounted into the `/opt/app` folder within the container.
Example:
> `docker run -v <path/to/your/project>:/opt/app dubit/haxe-node`

The container will execute the following two commands in order:

* `npm install` - will install any libraries specified in `package.json`
* `npm run build` - will run the build command specified in `package.json`

See the [npm-scripts documentation](https://docs.npmjs.com/misc/scripts) for more information on custom scripts / commands in your package.json

If you do not wish to specify the build command inside of the `package.json` then you can run the container with your own commands. 

Example `docker run dubit/haxe-node npm install && grunt build`

## Link to DockerHub:

You can find this image on Dubit's Docker Hub: <https://hub.docker.com/r/dubit/haxe-node/>