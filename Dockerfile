#use this small ubuntu image
FROM alpine:3.21

#create this working directory. The following instructions will be exectued here
WORKDIR /usr/src/app

#copy hello.sh from the current directory where dockerfile is there to the working directory created above
COPY hello.sh . 

#make it exeutable-optional- if we haven't already done
RUN chmod +x hello.sh 

#when running docker, run the below commands
CMD ["./hello.sh"]
