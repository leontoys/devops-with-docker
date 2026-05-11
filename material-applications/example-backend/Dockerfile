FROM golang:1.16-alpine3.15
EXPOSE 8080 
WORKDIR /usr/src/app
COPY . .
RUN adduser -D appuser && \
    chown appuser . && \
    go build && \
# Remove stuff that are not needed
    rm -rf cache common controller go.mod go.sum pgconnection router
USER appuser
CMD ["./server"]