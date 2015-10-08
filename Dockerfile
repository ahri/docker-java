FROM  alpine:3.2

RUN apk add --update openjdk7-jre-base=7.79.2.5.6-r0 && \
    rm -rf /var/cache/apk/*
