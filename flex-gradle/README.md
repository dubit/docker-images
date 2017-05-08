# Flex Gradle

This is an image for building flex/AS3 applications with Gradle. It is intended to be used with the [GradleFx](http://gradlefx.org/) plugin.

## Tools, compilers and utilities inside:
* Latest gradle version from `niaquinto/gradle`
* Apache Flex 4.9.0
* Global player SWC 11.1

## How to use the image:

Within your project's folder you need a **`build.gradle`** file, containing the config for `gradlefx`.

To run the container you need to mount your project's folder into `/app` inside the container. Do this by running the following command:

> `docker run -v <path/to/your/project>:/app dubit/flex-gradle`

By default the container will run `gradle build publish` inside the project directory and output your gradlefx build to `/build` and output the final artifact to `/publish`.
