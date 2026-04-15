# Docker
- Devops means Ops ( ie, release, config, monitoring) of s/w is in the hands of Dev
- Platform as a Service that delivers s/w in packages ( containers ) with o/s level virtualization
- Think of it like a lunchbox: everything you need is inside, ready to go anywhere
- Docker solves the following problems : 
    - works in my m/c. 
    - isolated env - if we have 5 apps running on the server with python 3 and we have a new s/w that needs 2.7
    - development speed up - instead of a new dev to install all dependencies, they can just pull the container and start working
    - scaling - Container orchestration can spin up new contianers if required
- VMs virtualize machines - have separate o/s, heavy 
- Simple analogy: VMs are like buying separate houses for each family. Containers are like apartments in the same building — shared infrastructure, but private spaces.
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
- i -> Keep the connection open (interactive).
- t -> Give you a proper terminal (TTY) to type in.
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

# How to build a Dockerfile?
-    Start a temporary, interactive container (like a test kitchen).
-    Install things, run commands, break things, fix them.
-    Once it works perfectly, copy those exact steps into your Dockerfile.
- docker build -t yt-dlp .
- docker run yt-dlp

# Volume - Build mounts
- Docker gives us a flag: -v (for volume). This flag lets us say: "Connect this folder on the left side which is on my computer to the one on the right side the container."


# Ports
- docker run -p 3456:8080 web-server 
- This maps the port 3456 on local machine to 8080 on the container
- To expose a port, add the line EXPOSE <port> in your Dockerfile
- To publish a port, run the container with -p <host-port>:<container-port>

# To publish
- $ docker login
- Next, you will need to rename the image to include your username, and then you can push it:
- $ docker tag yt-dlp <username>/<repository>
- $ docker push <username>/<repository>

# Docker Compose 
- tool to simplify multi step docker workflows, for orchestration
- $ docker compose up - to start all services defined docker-compose.yaml
- $ docker compose down - to stop and remove the running services
- $ docker compose logs - to monitor the logs
- $ docker compose ps - to list all running services
- docker-compose.yaml - one file all services 

# Docker Networking
- how does frontend know the backend? how backend knows the d/b? when we do docker-compose? this is how
- when we do docker compose up it starts a network project_default with the services and sets up internal DNS server
- Inside this DNS network, every service name becomes a hostname, backend can reach db via http://db:someport and frontend can reach backend via http://backend:someport . No ip address or mapping needed
- dynamic - if db crashes and restarts no need to make changes to read from the new ip we access via service name
- security - its a private club, so no need to open the port to the outside world
- scaling while doing docker compose if we need additional ports
- manual network
- services:
  db:
    image: postgres:18.1-alpine
    networks:
      - database-network <em># Name in this Docker Compose file</em>

networks:
  database-network: <em># Name in this Docker Compose file</em>
    name: the-database-network <em># Name that will be the actual name of the network</em>

services:
  db:
    image: backend-image
    networks:
      - database-network

networks:
  database-network:
    external:
      name: the-database-network <em># Must match the actual name of the network</em>


# Scaling
- earlier in whoami we had ports mapped as 8000:8000 which means container will map to 8000 of host. so if we start say 3 instance then all will try to access 8000 and it will fail
- $ docker compose up --scale whoami=3
- so we only keep the ports as 8000, so it randomly allocates ports in host machine
- in server environment we will have a load balancer for example jwilder/nginx-proxy
- we also mount socket that is used to communicate with docker daemon as below
  - proxy:
    - image: jwilder/nginx-proxy
    - volumes:
      - - /var/run/docker.sock:/tmp/docker.sock:ro
- we can also use something like colasloth so that instead of random port numbers we can use subdomains
- ex 2.5 worked with disabling https only mode in firefox