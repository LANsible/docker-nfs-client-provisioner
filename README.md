# NFS Client provisioner
[![pipeline status](https://gitlab.com/lansible1/docker-nfs-client-provisioner/badges/master/pipeline.svg)](https://gitlab.com/lansible1/docker-nfs-client-provisioner/-/commits/master)
[![Docker Pulls](https://img.shields.io/docker/pulls/lansible/nfs-client-provisioner.svg)](https://hub.docker.com/r/lansible/nfs-client-provisioner)
[![Docker Version](https://images.microbadger.com/badges/version/lansible/nfs-client-provisioner:latest.svg)](https://microbadger.com/images/lansible/nfs-client-provisioner:latest)
[![Docker Size/Layers](https://images.microbadger.com/badges/image/lansible/nfs-client-provisioner:latest.svg)](https://microbadger.com/images/lansible/nfs-client-provisioner:latest)

## Why not use the official container?

It has no arm64 support :)

### Building the container locally

You could build the container locally to add plugins. It works like this:

```bash
docker build . \
      --build-arg ARCHITECTURE=amd64
      --tag lansible/nfs-client-provisioner:latest
```

## Credits

All credits to the original authors of this client over at [kubernetes-incubator/external-storage](https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client)
