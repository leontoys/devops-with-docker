FROM golang:1.16-alpine3.15 AS build-stage
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build && \
# Remove stuff that are not needed
    rm -rf cache common controller go.mod go.sum pgconnection router

FROM scratch
WORKDIR /usr/src/app 
EXPOSE 8080  
COPY --from=build-stage /usr/src/app/server ./server
ENV REQUEST_ORIGIN=http://localhost:5001
CMD ["./server"]