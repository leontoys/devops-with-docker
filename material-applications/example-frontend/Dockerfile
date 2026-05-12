FROM node:16-alpine3.18 AS build-stage
WORKDIR /usr/src/app
COPY . . 
RUN  npm install && \
    REACT_APP_BACKEND_URL=http://localhost:8080 npm run build && \
    # remove the js source files
    rm -rf src    

FROM node:16-alpine3.18   
EXPOSE 5001
WORKDIR /usr/src/app
COPY --from=build-stage /usr/src/app/build/ ./build
RUN  npm install -g serve && adduser -D appuser
USER appuser
CMD ["serve", "-s", "-l", "5001", "build"]
