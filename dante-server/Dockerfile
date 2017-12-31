FROM alpine:3.7

RUN set -ex \
	\
	&& echo "@testing http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
	&& apk --no-cache add dante-server@testing

COPY sockd.conf /etc/sockd.conf

EXPOSE 1080

CMD ["/usr/sbin/sockd"]
