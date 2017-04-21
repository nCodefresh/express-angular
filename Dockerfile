FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm install --silent

RUN ls -a && pwd

COPY . /usr/src/app

RUN test execute

EXPOSE 9000

CMD [ "npm", "start" ]
