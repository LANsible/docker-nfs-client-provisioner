# NFS Client provisioner
[![Build Status](https://cloud.drone.io/api/badges/LANsible/docker-nfs-client-provisioner/status.svg)](https://cloud.drone.io/LANsible/docker-nfs-client-provisioner)
[![Docker Pulls](https://img.shields.io/docker/pulls/lansible/nfs-client-provisioner.svg)](https://hub.docker.com/r/lansible/nfs-client-provisioner)
[![Docker Version](https://images.microbadger.com/badges/version/lansible/nfs-client-provisioner:latest.svg)](https://microbadger.com/images/lansible/nfs-client-provisioner:latest)
[![Docker Size/Layers](https://images.microbadger.com/badges/image/lansible/nfs-client-provisioner:latest.svg)](https://microbadger.com/images/lansible/nfs-client-provisioner:latest)

## Why not use the official container?

It has no arm64 support :)

## Test container with docker-compose

```
cd examples/compose
docker-compose up
```

### Building the container locally

You could build the container locally to add plugins. It works like this:

```bash
docker build . \
      --build-arg ARCHITECTURE=amd64
      --tag lansible/nfs-client-provisioner:latest
```

## Credits

* [kubernetes-incubator/external-storage](https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client)