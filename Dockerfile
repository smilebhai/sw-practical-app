## This tells us what to use as a base.
FROM node:10.12.0-alpine

# add bash
RUN apk update
RUN apk upgrade
RUN apk add bash

## Make a directory for our app
RUN mkdir -p /opt/app

## Set the default directory we're using on our container
WORKDIR /opt/app

## Add our code
COPY package*.json /opt/app/

## Run npm install
# If you are building your code for production
# RUN npm install --only=production

RUN npm install

COPY . /opt/app

## Expose a port that we can access our web app on
EXPOSE 3000

## Tell our app how to start when we run the docker container. This has to be an array of a command and its arguments
CMD ["npm", "start"]
