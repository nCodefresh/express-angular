FROM node:latest

ARG arg

RUN echo $arg

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install --silent
COPY . /usr/src/app

COPY files/credimiworkflows_2.11-*.test /usr/src/app/credimiworkflows.test

RUN ls -l


EXPOSE 9000

CMD [ "npm", "start" ]