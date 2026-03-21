Now that we've warmed up it's time to get inside a container while it's running!

Image devopsdockeruh/simple-web-service:ubuntu will start a container that outputs logs into a file. Go inside the running container and use tail -f ./text.log to follow the logs. Every 10 seconds the clock will send you a "secret message".

As an answer give the commands you used to see the secret message.


docker run -d  -it --name looper  devopsdockeruh/simple-web-service:ubuntu
docker exec looper tail -f ./text.log