#Install golang 1.16
FROM golang:1.16
#choose which port for the application. Default: 8080
EXPOSE 8080 
#convention
WORKDIR /usr/src/app
#copy all of the source code
COPY . .
# create app user
RUN useradd -m appuser && chown appuser . && go build
# now change the user
USER appuser
#Execute the file e.g. ./server.
CMD ["./server"]