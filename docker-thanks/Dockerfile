#Build stage
FROM node:alpine AS build-stage

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build && \
    rm -rf src 


#Production stage
FROM node:alpine

WORKDIR /usr/src/app

RUN npm install -g serve && \
    adduser -D appuser

COPY --from=build-stage /usr/src/app/dist ./dist

EXPOSE 5001

USER appuser

CMD ["serve","-s","-l","5001","dist"]