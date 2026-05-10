# ubuntu base image
FROM ubuntu:latest
# project in port 5001
EXPOSE 5001
# directory by convention
WORKDIR /usr/src/app
# copy all of the source code
COPY . . 
# RUN
RUN apt update && apt install curl -y && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && apt install -y nodejs && \
    npm install  && npm run build && npm install -g serve && useradd -m appuser && chown appuser . && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*
# now change the user
USER appuser
# serve: serve -s -l 5001 build
CMD ["serve", "-s", "-l", "5001", "build"]
