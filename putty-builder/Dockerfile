FROM debian:jessie-slim

RUN set -ex \
	\
	&& apt-get update \
	&& apt-get install -y \
		curl \
		gcc-mingw-w64-i686 \
		libdigest-sha-perl \
		make \
		patch \
		perl \
		unzip \
	\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& ln -s /usr/bin/i686-w64-mingw32-gcc /usr/bin/gcc \
	&& ln -s /usr/bin/i686-w64-mingw32-windres /usr/bin/windres \
	\
	&& mkdir -p /build /dist

WORKDIR /build

COPY build.sh /build/
COPY patches/* /build/patches/

RUN set -ex \
	\
	&& chmod +x build.sh

CMD ["./build.sh"]

