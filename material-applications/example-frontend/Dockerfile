# ubuntu base image
FROM ubuntu:latest

# project in port 5001
EXPOSE 5001

# install curl
# RUN apt update
# RUN apt install curl -y

# directory by convention
WORKDIR /usr/src/app

# install nodejs
# RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
# RUN apt install -y nodejs

# copy package.json and lock
#COPY package* ./

# Install all packages with npm install
# RUN npm install 

# copy all of the source code
COPY . . 

# First, you need to build the static files with npm run build
RUN apt update && apt install curl -y && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && apt install -y nodejs && \
    npm install  && npm run build && npm install -g serve && useradd -m appuser && chown appuser . && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

# now change the user
USER appuser

# serve: serve -s -l 5001 build
CMD ["serve", "-s", "-l", "5001", "build"]
