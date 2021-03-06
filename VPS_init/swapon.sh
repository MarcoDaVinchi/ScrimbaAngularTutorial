#!/bin/bash
swapon -s

cd /var
touch swap.img
chmod 0600 swap.img
dd if=/dev/zero of=/var/swap.img bs=1024k count=1000
mkswap /var/swap.img
swapon /var/swap.img

swapon -s

echo "/var/swap.img    none    swap    sw    0    0" >> /etc/fstab
sysctl -w vm.swappiness=30