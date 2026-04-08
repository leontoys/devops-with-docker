#Install golang 1.16
FROM golang:1.16

#choose which port for the application. Default: 8080
EXPOSE 8080

#convention
WORKDIR /usr/src/app

#copy all of the source code
COPY . .

#Run go build. It will generate a binary named "server"
RUN go build

#Execute the file e.g. ./server.
CMD ["./server"]