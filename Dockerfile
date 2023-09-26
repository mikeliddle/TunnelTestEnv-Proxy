FROM ubuntu:latest
WORKDIR /squid
COPY . .
RUN apt update
RUN apt install -y wget build-essential libssl-dev libldap-dev libkrb5-dev libfreeradius-dev libpam0g-dev libsasl2-dev
RUN chmod +x /squid/build.sh /squid/docker-entrypoint.sh
RUN /squid/build.sh

VOLUME /etc/squid

ENTRYPOINT [ "/squid/docker-entrypoint.sh" ]