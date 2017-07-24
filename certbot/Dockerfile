FROM debian:jessie-slim

RUN set -ex \
	\
	&& echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
	&& apt-get update \
	&& apt-get install -y -t jessie-backports certbot \
	&& apt-get install -y --no-install-recommends cron \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& mkdir -p /webroot/.well-known/acme-challenge

COPY bin /
COPY crontabs /var/spool/cron/crontabs

VOLUME ["/webroot", "/etc/letsencrypt"]

STOPSIGNAL SIGKILL

WORKDIR /webroot
CMD ["cron", "-f", "-L0"]

