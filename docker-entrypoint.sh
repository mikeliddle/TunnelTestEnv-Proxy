#!/bin/bash

cat /etc/squid/squid.conf
squid -z
squid -NCd1