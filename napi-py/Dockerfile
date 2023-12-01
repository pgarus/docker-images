FROM python:3-slim

RUN set -e \
	\
	&& apt-get update \
	&& apt-get install -y \
		gcc \
		python3-dev \
	\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN set -e \
	\
	&& pip install --no-cache-dir \
		napi-py

ENTRYPOINT ["/bin/bash"]

