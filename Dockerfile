FROM node:7.2.1

# Copy application files
COPY ./build /app
RUN mkdir app/node_modules

RUN echo "whats in app: " && ls -a app && pwd

COPY ./node_modules /app/node_modules

RUN echo "whats in app: " && ls -a app && pwd


