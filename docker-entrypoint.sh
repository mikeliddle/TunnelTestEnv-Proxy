#!/bin/bash

cat /etc/squid/squid.conf

exec tail -f /var/log/squid/access.log