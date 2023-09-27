#!/bin/bash

cat /etc/squid/squid.conf
squid
exec tail -f /var/log/squid/access.log