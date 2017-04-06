# Cassandra Docker image

This image is an extension of the [official Cassandra](https://hub.docker.com/_/cassandra/) image in the docker library. inspired by [this](http://rancher.com/running-cassandra-on-rancher/) blogpost, it allows for a scaling cluster to be created and managed by Rancher.

## Usage:

The main image itself extends from the official Cassndra image. You can see the Dockerfile [here](https://github.com/docker-library/cassandra)

Similar to the `pboos/rancher-cassandra` image and `usman/docker-rancher-cassandra` it detects if you run it with an environment variable of `RANCHER_ENABLE`. This will trigger the entrypoint to automatically detect the current ip of the container and start Cassandra's internal networking structure with it. It will also allow additional nodes in the cluster to automatically detect and connect to the initial seed, giving you a scalable distributed cluster. The cluster can also be configured to be rack and datacenter aware for more complex and durable deployments.

## TODO list

 - [ ] Support Cassandra version 3.10 (currently latest)
 - [ ] Better README documenting a guided setup for Rancher deployment.
 - [ ] Setup automated build and deployments on Docker cloud.
