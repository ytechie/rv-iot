FROM nodered/node-red

USER root

RUN apk add --update nodejs
RUN apk add npm
RUN apk add bash
RUN apk add raspberrypi

COPY ./sensors/ /root/sensors/
COPY ./setup-container.sh /usr/

RUN /usr/setup-container.sh