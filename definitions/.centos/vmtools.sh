#!/bin/bash -eux

if test -f .vmfusion_version ; then
    if grep -q -i "release 6" /etc/redhat-release ; then
        # Uninstall fuse to fake out the vmware install so it won't try to
        # enable the VMware blocking filesystem
        yum erase -y fuse
    fi
    # Assume that we've installed all the prerequisites:
M
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perls
    # from the install media via ks.cfg

    cd /tmp
    mkdir -p /mnt/cdrom
    mount -o loop /home/veewee/linux.iso /mnt/cdrom
    tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    /tmp/vmware-tools-distrib/vmware-install.pl -d
    rm /home/veewee/linux.iso
    umount /mnt/cdrom
    rmdir /mnt/cdrom
elif test -f .vbox_version ; then
    echo "Installing VirtualBox guest additions"

    # Assume that we've installed all the prerequisites:
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    # from the install media via ks.cfg

    VBOX_VERSION=$(cat /home/veewee/.vbox_version)
    cd /tmp
    mount -o loop /home/veewee/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm -rf /home/veewee/VBoxGuestAdditions_*.iso
fi
