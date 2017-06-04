#!/bin/bash
chmod 777 telnetdd
chmod 777 telnetcliente
cp telnetdd /sbin
cp telnetdd /etc/init.d/telnetdd
update-rc.d telnetdd start
update-rc.d telnetdd defaults
sudo /etc/init.d/telnetdd restart
telnetdd
