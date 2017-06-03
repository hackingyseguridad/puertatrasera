#!/bin/bash
chmod 777 telnetd
cp telnetd /sbin
cp telnetd /etc/init.d/telnetd 
update-rc.d /sbin/telnetd start
update-rc.d /sbin/telnetd defaults
sudo /etc/init.d/telnetd restart
telnetd
