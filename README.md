# TunnelTestEnv-Proxy

Proxy Docker container for TunnelTestEnv scripts

## Build and Publish instructions

`docker build -t tunnelproxy .`

`docker image tag tunnelproxy <user>/tunnelproxy:latest`

`docker image push <user>/tunnelproxy:latest`

## References

Squid official docs: http://www.squid-cache.org

Squid container example: https://github.com/egirna/squid/
