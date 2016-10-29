FROM alpine:3.4

RUN apk --update add nginx php5-fpm nodejs npm && \
    mkdir -p /var/log/nginx && \
    touch /var/log/nginx/access.log && \
    mkdir -p /run/nginx

RUN mkdir -p /www
WORKDIR /www

ADD . /www
ADD nginx.conf /etc/nginx/
#ADD php-fpm.conf /etc/php5/php-fpm.conf

RUN npm install --silent

EXPOSE 80

CMD npm start && (tail -F /var/log/nginx/access.log &) && exec nginx -g "daemon off;"