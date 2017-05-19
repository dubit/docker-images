# Cassandra Docker image
### `dubit/cassandra`
This image is an extension of the [official Cassandra](https://hub.docker.com/_/cassandra/) image in the docker library. inspired by [this](http://rancher.com/running-cassandra-on-rancher/) blogpost, it allows for a scaling cluster to be created and managed by Rancher.

## Tools, compilers and utilities inside:
* Cassandra versions: 3.9 | 3.10
* Original Cassandra utilities: [Dockerfile](https://github.com/docker-library/cassandra)

## How to use the image:

This image is just an extension over the official Cassandra image. All usage patterns apply to this image as well. The extension allows this image to run under a Rancher configuration, automatically detecting the current IP address of the container and start Cassandra's internal networking structure with it. It also allows additional nodes in the cluster to automatically detect and connect to the initial seed, giving you a scalable distributed cluster. The cluster can also be configured to be rack and datacenter aware for more complex and durable deployments.

To enable the Rancher configuration, pass the `RANCHER_ENABLE=true` environment variable when running the container.

## Link to DockerHub:

You can find this image on Dubit's Docker Hub: <https://hub.docker.com/r/dubit/cassandra/>
