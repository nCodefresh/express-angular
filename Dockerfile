FROM node:5-onbuild

RUN npm install -g pm2

EXPOSE 9000
