#!/bin/bash -eux

if test -f .vmfusion_version ; then
    yum install -y gcc make kernel-devel-$(uname -r) perl

    cd /tmp
    mkdir -p /mnt/cdrom
    mount -o loop /home/veewee/linux.iso /mnt/cdrom
    tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    /tmp/vmware-tools-distrib/vmware-install.pl -d
    rm /home/veewee/linux.iso
    umount /mnt/cdrom
    rmdir /mnt/cdrom

    yum erase -y gcc make kernel-devel-$(uname -r) perl
fi
