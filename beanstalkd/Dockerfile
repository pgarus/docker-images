FROM alpine:3.9

RUN set -ex \
	\
	&& apk add --no-cache \
		beanstalkd

EXPOSE 11300
STOPSIGNAL 9

CMD ["beanstalkd", "-p", "11300", "-u", "nobody"]
