#run ubuntu 24.04
FROM ubuntu:24.04

#execute commands with '/bin/sh -c' prefix
RUN apt update
RUN apt install curl -y

#create working directory
WORKDIR /usr/src/app

#copy script file to the working directory
COPY script.sh .

#make it executable
RUN chmod +x script.sh

#when running docker, run the following command
CMD ["./script.sh"]
