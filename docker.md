# Docker
- Devops means Ops ( ie, release, config, monitoring) of s/w is in the hands of Dev
- Platform as a Service that delivers s/w in packages ( containers ) with o/s level virtualization
- Docker solves the following problems : 
    - works in my m/c. 
    - isolated env - if we have 5 apps running on the server with python 3 and we have a new s/w that needs 2.7
    - development speed up - instead of a new dev to install all dependencies, they can just pull the container and start working
    - scaling - Container orchestration can spin up new contianers if required
- VMs virtualize machines - have separate o/s, heavy 
- Dockerfile - instructions to build images looks like
    - FROM < image>:< tag>
    - RUN < install some dependencies>
    - CMD < command that is executed on `docker container run`>
- Image - recipe and ingredentials. This never changes. This inturn is made from Dockerfile
- Containers - ready to eat meal 
- Docker Engine
    - CLI client
    - REST API
    - Docker daemon
    - ie, when we run a docker command, the CLI client - sends the command to docker daeomon via REST API
- TTY is shorthand for Teletypewriter.when we launch terminal we interact with the virtual TTY in linux


## most used commands
command	explain	shorthand
- docker image ls	Lists all images	docker images
- docker image rm <image>	Removes an image	docker rmi
- docker image pull <image>	Pulls image from a docker registry	docker pull
- docker container ls -a	Lists all containers	docker ps -a
- docker container run <image>	Runs a container from an image	docker run
- docker container rm <container>	Removes a container	docker rm
- docker container stop <container>	Stops a container	docker stop
- docker container exec <container>	Executes a command inside the container 	docker exec

# other commands and flags
- d -> detached mode ie, it runs in the background
- t -> tty to interact with the docker container
- i -> interactive, for standard input stream
- f -> logs -f for output logs
- attach - to attach to the container from another terminal
- exec - go inside and run commands
- rm -> to remove



## Running script
- docker run -d -it --name looper ubuntu sh -c 'while true; do date; sleep 1; done'
- docker exec looper ls -la
- docker exec -it looper bash

## Images
- we can pull from other registries like below. if we omit that, it will pull from default docker hub
docker pull quay.io/podman/hello
- we can pull a specific version or tag like below. if we omit that, it will pull the latest
docker pull ubuntu:25.10
- registry/organisation/image:tag
- we build an app, then containarize -> we are creating images
- Images are made of layers
- All instructions in a Dockerfile except CMD are executed during build time. CMD is executed when we call docker run.

# ENTRYPOINT vs CMD can be confusing 
- In an image, such as our yt-dlp, the command represents an argument list for the entrypoint. 
- By default, the entrypoint in Docker is set as /bin/sh -c -> starts the shell
- This is passed if no entrypoint is set. 
- This is why giving the path to a script file as CMD works : you're giving the file as a parameter to /bin/sh -c.
- If an image defines both, then the CMD is used to give default arguments (opens in a new tab) to the entrypoint.
- There are two ways to set the ENTRYPOINT and CMD: exec form and shell form. We have been using the exec form, in which the command itself is executed. The exec form is generally preferred over the shell form, because in the shell form the command that is executed is wrapped with /bin/sh -c, which can result in unexpected behaviour.
- Dockerfile	Resulting command
- ENTRYPOINT /bin/ping -c 3
CMD localhost	/bin/sh -c -> '/bin/ping -c 3' /bin/sh -c localhost
- ENTRYPOINT ["/bin/ping","-c","3"]
CMD localhost	-> /bin/ping -c 3 /bin/sh -c localhost
- ENTRYPOINT /bin/ping -c 3
CMD ["localhost"]	-> /bin/sh -c '/bin/ping -c 3' localhost
- ENTRYPOINT ["/bin/ping","-c","3"]
CMD ["localhost"]	-> /bin/ping -c 3 localhost