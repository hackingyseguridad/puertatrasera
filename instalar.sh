#!/bin/bash
chmod 777 telnetd
cp telnetd /sbin
cp telnetd /etc/init.d/telnetd 
update-rc.d telnetd start
update-rc.d telnetd defaults
sudo /etc/init.d/telnetd restart
telnetd
