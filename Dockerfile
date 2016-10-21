FROM node:5-onbuild

RUN apt-get update && apt-get -y install libnotify-bin

RUN npm install -g pm2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN npm install --g gulp-cli
RUN npm install -g bower
RUN bower install --allow-root
RUN npm install --allow-root
RUN export DISABLE_NOTIFIER=true

CMD gulp build --prod && pm2 start server.js --no-daemon