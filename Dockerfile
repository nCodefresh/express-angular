FROM node:5-onbuild
RUN apt-get update && apt-get -y install libnotify-bin
RUN npm install -g pm2

EXPOSE 9000
