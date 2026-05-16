FROM golang:1.16-alpine3.15 AS build-stage

WORKDIR /myproject

COPY . .

RUN CGO_ENABLED=0 go build && \
    rm -rf cache common controller go.mod go.sum pgconnection router

FROM scratch

WORKDIR /myproject

COPY --from=build-stage /myproject/server ./server

ENV REQUEST_ORIGIN=http://localhost:5001

EXPOSE 8080

CMD ["./server"]
