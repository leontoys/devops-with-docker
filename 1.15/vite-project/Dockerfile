#ubuntu base image
FROM ubuntu:latest

#project in port 5001
EXPOSE 5001

#install curl
RUN apt update
RUN apt install curl -y

#working directory
WORKDIR /usr/src/app

#install nodejs
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash
RUN apt install -y nodejs

# copy package.json and lock
COPY package* ./

# Install all packages with npm install
RUN npm install 

# copy all of the source code
COPY . . 

# Use npm package called serve to serve the project in port 5001:
RUN npm install -g serve

# serve: serve -s -l 5001 build
CMD ["serve", "-s", "-l", "5001", "dist"]