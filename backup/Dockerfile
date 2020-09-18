FROM alpine:3.12

RUN apk add --update-cache --no-cache \
    postgresql

RUN mkdir /scripts

WORKDIR /scripts

COPY ./scripts/ .

CMD sh run.sh