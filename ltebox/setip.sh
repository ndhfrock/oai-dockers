#!/bin/bash

INTFC=eth0
IP="$(/sbin/ifconfig $INTFC | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')"

sudo iptables -t nat -A POSTROUTING -o $INTFC -j SNAT --src 192.178.0.0/16 --to $IP

