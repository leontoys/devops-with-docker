FROM node:16-alpine3.18
EXPOSE 5001
WORKDIR /usr/src/app
COPY . . 
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN  npm install && \
    npm install -g serve && \
    adduser -D appuser && \
    npm run build && \
    # remove the js source files
    rm -rf src         
USER appuser
CMD ["serve", "-s", "-l", "5001", "build"]
