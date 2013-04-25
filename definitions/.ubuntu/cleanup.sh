#!/bin/bash -eux
# Remove items used for building, since they aren't needed anymore

#Clean up tmp
rm -rf /tmp/*

if [ -d "/var/lib/dhcp" ]; then
    # Removing leftover leases and persistent rules
    echo "cleaning up dhcp leases"
    rm /var/lib/dhcp/*
fi
