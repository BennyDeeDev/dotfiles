#!/usr/bin/bash

# Look up the boot number for Arch (systemd-boot) in the EFI records
boot_number=$(echo $(efibootmgr) | grep -Po "(?<=Boot)\S{4}(?=( |\* )Linux Boot Manager)" | head -n1)

# Check that Arch EFI entry was found
if [ -z "$boot_number" ]; then
    echo "Cannot find Arch boot in EFI, exiting"
    exit 1
fi

# Set next boot to be Arch and reboot the machine
sudo efibootmgr -n "${boot_number}" && reboot
