FROM  alpine:3.2

RUN apk add --update openjdk7-jre-base=7.79.2.5.6-r0 ca-certificates=20141019-r2 && \
    rm -rf /var/cache/apk/* && \
    find /usr/share/ca-certificates/mozilla/ -name "*.crt" -exec keytool -import -trustcacerts \
        -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts -storepass changeit -noprompt \
        -file {} -alias {} \; > /dev/null && \
    apk del ca-certificates && \
    keytool -list -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts --storepass changeit

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV JAVA=$JAVA_HOME/bin

CMD ["java", "-version"]
