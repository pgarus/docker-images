FROM alpine:3.9

ENV version 0.7.0

RUN set -ex \
	\
        && apk add --no-cache --virtual .builddeps \
		ca-certificates \
                wget \
        \
        && mkdir /influx-protector \
        && cd /influx-protector \
        \
        && wget https://github.com/ve-interactive/influx-protector/releases/download/$version/linux_386.zip \
        && unzip linux_386.zip \
	&& rm linux_386.zip \
	\
	&& adduser -D protector \
	&& chown -R protector:protector /influx-protector \
        \
	&& apk del .builddeps

WORKDIR /influx-protector
USER protector

ENTRYPOINT ["/influx-protector/influx-protector"]

