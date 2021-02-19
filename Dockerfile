FROM nodered/node-red

USER root

RUN apk add --update nodejs
RUN apk add npm
RUN apk add bash

COPY ./sensors/ /root/sensors/
COPY ./setup-container.sh /usr/

RUN /usr/setup-container.sh