#!/bin/bash

cat /etc/squid/squid.conf
exec squid
exec tail -f /var/log/squid/access.log