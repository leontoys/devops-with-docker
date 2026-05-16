FROM node:16-alpine3.18 AS build-stage
    
WORKDIR /myapp    

COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost:8080/ 

RUN  npm install && \
    npm run build && \
    rm -rf src

FROM node:16-alpine3.18  

WORKDIR /myapp    

COPY --from=build-stage /myapp/build/ ./build

RUN  npm install -g serve && adduser -D appuser

USER appuser


CMD ["serve", "-s", "-l", "5001", "build"]
