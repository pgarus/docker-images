# bind

Dockerfile to create a container image for BIND DNS server.

### Running the container

Image requires two additional config files: `/etc/bind/named.conf.custom`,
`/etc/bind/named.conf.zones` and one additional directory: `/etc/bind/zones`.

```shell
$ docker run -p 53:53 \
	-v $PWD/named.conf.custom:/etc/bind/named.conf.custom:ro \
	-v $PWD/named.conf.zones:/etc/bind/named.conf.zones:ro \
	-v $PWD/zones:/etc/bind/zones:ro \
	pgarus/bind:latest
```

##### named.conf.custom example:

```
logging {
	category lame-servers { null; };
	category edns-disabled { null; };
};
```

##### named.conf.zones example:

```
zone "example.com" IN {
	type master;
	file "/etc/bind/zones/example.com";
};
```

### Credits

BIND DNS Server: Internet Systems Consortium, Inc. (https://www.isc.org/downloads/bind/)
