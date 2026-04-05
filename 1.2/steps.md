Instructions

Since we already did "Hello, World!" in the material let's do something else.

Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.

Stop two of the containers and leave one container running.

As an answer:

i) Write the commands you used to start and stop the containers.
ii) Write the output for docker ps -a which shows 2 stopped containers and one running.

---
i)docker container stop fervent_golick #stopped the 3rd container
docker container rm 2e65 8e82 b91c #removing 3 containers
docker image rm nginx #removing image
ii)docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
docker image ls                                                                                                                                                            IMAGE   ID             DISK USAGE   CONTENT SIZE   EXTRA

Word count: 
44