#!/bin/bash -eux

if test -f .vmfusion_version ; then
    echo "Installing VMware tools"
    apt-get install -y linux-headers-$(uname -r) build-essential perl

    cd /tmp
    mkdir -p /mnt/cdrom
    mount -o loop /home/veewee/linux.iso /mnt/cdrom
    tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    /tmp/vmware-tools-distrib/vmware-install.pl -d
    rm /home/veewee/linux.iso
    umount /mnt/cdrom
    rmdir /mnt/cdrom

    apt-get -y remove linux-headers-$(uname -r) build-essential perl
    apt-get -y autoremove
elif test -f .vbox_version ; then
    echo "Installing VirtualBox guest additions"

    apt-get install -y linux-headers-$(uname -r) build-essential perl
    apt-get install -y dkms

    VBOX_VERSION=$(cat /home/veewee/.vbox_version)
    cd /tmp
    wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
    mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt

    rm VBoxGuestAdditions_$VBOX_VERSION.iso
fi
