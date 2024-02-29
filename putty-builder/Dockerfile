FROM debian:bookworm-slim

RUN set -ex \
	\
	&& apt-get update \
	&& apt-get install -y \
		cmake \
		curl \
		gcc-mingw-w64-x86-64 \
		patch \
		unzip \
	\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& mkdir -p /build /dist

WORKDIR /build

COPY build.sh /build/
COPY patches/* /build/patches/

RUN set -ex \
	\
	&& chmod +x build.sh

CMD ["./build.sh"]

