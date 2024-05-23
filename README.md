# docker-nfs-server

Inspired by https://github.com/cpuguy83/docker-nfs-server

Build
=====

nano ./docker/password.txt
nano ./docker/username.txt

./docker/login.sh

./docker/build/develop/execute.sh

./docker/build/main/execute.sh

Docker NFS Server
=================

Usage
=====

```bash
docker run -d --name nfs --privileged cpuguy83/nfs-server /path/to/share /path/to/share2 /path/to/shareN
```

```bash
docker run -d --name nfs-client --privileged --link nfs:nfs cpuguy83/nfs-client /path/on/nfs/server:/path/on/client
``` 

More Info
=========

Docker Quicktip #4 - Remote volumes
https://container42.com/2014/03/29/docker-quicktip-4-remote-volumes/
