FROM alpine:3.7

RUN set -ex \
	\
	&& apk --no-cache add bind \
	\
	&& cp /etc/bind/named.conf.authoritative /etc/bind/named.conf \
	\
	&& sed -ri 's/listen-on\s+.*/listen-on { any; };/' /etc/bind/named.conf \
	&& echo 'include "/etc/bind/named.conf.custom";' >> /etc/bind/named.conf \
	&& echo 'include "/etc/bind/named.conf.zones";' >> /etc/bind/named.conf \
	\
	&& mkdir -m 0755 -p /etc/bind/zones

EXPOSE 53 53/udp

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
