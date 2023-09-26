# TunnelTestEnv-Proxy

Proxy Docker container for TunnelTestEnv scripts

## Build and Publish instructions

`docker build -t tunnelproxy .`

`docker image tag tunnelproxy <user>/tunnelproxy:latest`

`docker image push <user>/tunnelproxy:latest`

## References

http://www.squid-cache.org
https://github.com/egirna/squid/
