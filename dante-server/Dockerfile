FROM alpine:3.12

RUN set -ex \
	\
	&& apk --no-cache add dante-server

COPY sockd.conf /etc/sockd.conf

EXPOSE 1080

CMD ["/usr/sbin/sockd"]
