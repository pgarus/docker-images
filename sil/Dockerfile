FROM alpine:3.6

RUN set -ex \
	\
	&& apk add --no-cache \
		ncurses \
	\
	&& apk add --no-cache --virtual .builddeps \
		gcc \
		make \
		musl-dev \
		ncurses-dev \
	\
	&& mkdir /sil \
	&& cd /sil \
	\
	&& wget http://www.amirrorclear.net/flowers/game/sil/Sil-130-src.zip \
	&& unzip Sil-130-src.zip \
	&& rm Sil-130-src.zip \
	\
	&& cd Sil/src \
	&& sed -ri 's/^CFLAGS/#CFLAGS/' Makefile.std \
	&& sed -ri 's/^LIBS/#LIBS/' Makefile.std \
	&& sed -ri '/Variation -- compile for Linux/,/^#LIBS/{/Allows the use of Sil in the console using curses./,/^#LIBS/s/^#([CL])/\1/g}' Makefile.std \
	&& make -f Makefile.std install \
	\
	&& apk del .builddeps \
	&& rm -rf /tmp/* /var/tmp/*

WORKDIR /sil/Sil

CMD ["./sil"]
