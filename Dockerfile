# build
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY ./srs-ta-example-app/package.json ./srs-ta-example-app/package-lock.json ./
RUN npm install
COPY ./srs-ta-example-app .
RUN npm run build

# deploy
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY /srs-ta-example-app /usr/share/nginx/html
