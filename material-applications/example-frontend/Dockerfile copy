# ubuntu base image
FROM ubuntu:latest

# project in port 5001
EXPOSE 5001

# install curl
RUN apt update
RUN apt install curl -y

# directory by convention
WORKDIR /usr/src/app

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install -y nodejs

# copy package.json and lock
COPY package* ./

# Install all packages with npm install
RUN npm install 

# copy all of the source code
COPY . . 

# First, you need to build the static files with npm run build
RUN npm run build 
#RUN REACT_APP_BACKEND_URL=http://localhost:8080/ npm run build

# Use npm package called serve to serve the project in port 5001:
RUN npm install -g serve

# create app user
RUN useradd -m appuser

# change owner of the directory to app user
RUN chown appuser .

# now change the user
USER appuser

# serve: serve -s -l 5001 build
CMD ["serve", "-s", "-l", "5001", "build"]
