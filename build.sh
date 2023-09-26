#!/bin/bash

download(){
    wget -O squid.tar.gz http://www.squid-cache.org/Versions/v6/squid-6.3.tar.gz
    tar -xzf squid.tar.gz
    rm squid.tar.gz
    cd squid-6.3
 }

#configure squid with customized flags
build(){
    ./configure --prefix=/usr --datadir=/usr/share/squid --sysconfdir=/etc/squid \
    --libexecdir=/usr/lib/squid --localstatedir=/var --with-logdir=/var/log/squid \
    --disable-strict-error-checking --enable-ssl --enable-ssl-crtd --with-openssl \
    --enable-auth-basic="DB,fake,getpwnam,LDAP,NCSA,PAM,POP3,RADIUS,SASL,SMB" \
    --enable-auth-ntlm="fake,SMB_LM" --enable-auth-negotiate="kerberos,wrapper" \
    && make \
    && make install \
    && echo "installation complete" \
    && mkdir -p /etc/squid/cert \
    && mkdir -p /var/cache/squid \
    && touch /var/log/squid/access.log \
    && touch /var/log/squid/cache.log  \
    && chmod -R 1777 /var/log/squid \
    && chown -R squid:squid /var/log/squid/
}

clear_certs_db() {
    /usr/lib/squid/security_file_certgen -c -s "/var/cache/squid/ssl_db" -M 4MB
    chown -R squid /var/cache/squid/ssl_db
}

useradd -r -s /usr/sbin/nologin squid
download
build
clear_certs_db