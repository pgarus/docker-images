#!/bin/bash -eu

DOMAIN="$1"
EMAIL="$2"

certbot certonly --webroot -w . -d "$DOMAIN" --text --verbose --agree-tos --email "$EMAIL" --renew-by-default
