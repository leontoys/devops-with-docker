#Install golang 1.16
FROM golang:1.16

#choose which port for the application. Default: 8080
EXPOSE 8080 

#convention
WORKDIR /usr/src/app

# create app user
RUN useradd -m appuser

# change owner of the directory to app user
RUN chown appuser .

# now change the user
USER appuser

#copy all of the source code
COPY . .

#Run go build. It will generate a binary named "server"
#ENV REQUEST_ORIGIN=http://localhost:5001
RUN go build

#Execute the file e.g. ./server.
CMD ["./server"]