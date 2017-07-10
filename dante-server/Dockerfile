FROM gx/alpine:latest

RUN set -ex \
	\
	&& echo "@testing http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
	&& apk --no-cache add dante-server@testing

COPY conf-danted/sockd.conf /etc/sockd.conf

EXPOSE 1080

CMD ["/usr/sbin/sockd"]
