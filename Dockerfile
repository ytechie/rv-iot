FROM nodered/node-red

USER root

RUN apk add --update nodejs
RUN apk add npm
RUN apk add bash

COPY ./setup-container.sh /usr/

RUN /usr/setup-container.sh