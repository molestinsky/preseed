#!/bin/bash
dpkg -i /root/bonding/ethtool_4.5-1_amd64.deb
dpkg -i /root/bonding/ifenslave_2.7ubuntu1_all.deb
dpkg -i /root/bonding/iproute_4.3.0-1ubuntu3_all.deb
cp -f /root/bonding/interfaces /etc/network/interfaces
sed -ie 's/^PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
cp -f /root/bonding/udev_rules /etc/udev/rules.d/70-persistent-net.rules
sed -ie "s/^GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"/GRUB_CMDLINE_LINUX_DEFAULT=\"net.ifnames=1 biosdevname=0\"/g" /etc/default/grub
echo -e "options rotate timeout:1\nnameserver 192.168.8.8\nnameserver 192.168.8.88\n" > /etc/resolvconf/resolv.conf.d/head
update-grub