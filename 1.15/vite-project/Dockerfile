#ubuntu base image - 649 MB
FROM node:alpine AS build-stage
WORKDIR /usr/src/app
COPY . . 
RUN npm install && \
    npm run build && \
    rm -rf src

FROM node:alpine 
WORKDIR /usr/src/app
COPY --from=build-stage /usr/src/app/dist/ ./dist
EXPOSE 5001
RUN npm install -g serve && \
    adduser -D appuser
USER appuser
CMD ["serve", "-s", "-l", "5001", "dist"]