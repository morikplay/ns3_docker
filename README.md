# ns3_docker
Docker container for ns3

# Pre-requisites
- `make`
- `docker`

# Specifics
This project provides both `Dockerfile` and `Makefile` for allowing [ns3 3.36.1](https://www.nsnam.org/releases/ns-3-36/) to be deployed using a docker container built using _Ubuntu 20.04 LTS_ as base image.

Docker image is created and run using the user `nrphy`.

The path `/usr/ns3` can be used as launching pad for any user-developed (i.e. _yours_) code to run. It is a symbolic link to actual ns3 versioned source code. This mechanism is chosen so as to allow forward compatibility in case of changes to base ns3 version you may wish to do do.

Contributions to the project are welcome.

_Networking funtionailty outside of docker container is not yet verified._


# Public Docker Repository
https://hub.docker.com/repository/docker/morik/ns3_3.36.1/general

# But, does it work?
If the docker container launches correctly, then you should be able to run a few sample programs which come default with `ns3`.

```
nrphy@:~/nr-v2.2/ns-3.36.1$ ./ns3 run hello-simulator
Hello Simulator
```

```
nrphy:~/nr-v2.2/ns-3.36.1$ ./ns3 run first
At time +2s client sent 1024 bytes to 10.1.1.2 port 9
At time +2.00369s server received 1024 bytes from 10.1.1.1 port 49153
At time +2.00369s server sent 1024 bytes to 10.1.1.1 port 49153
At time +2.00737s client received 1024 bytes from 10.1.1.2 port 9
```

```
nrphy:~/nr-v2.2/ns-3.36.1$ ./ns3 run second
At time +2s client sent 1024 bytes to 10.1.2.4 port 9
At time +2.0118s server received 1024 bytes from 10.1.1.1 port 49153
At time +2.0118s server sent 1024 bytes to 10.1.1.1 port 49153
At time +2.02161s client received 1024 bytes from 10.1.2.4 port 9
```