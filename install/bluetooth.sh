#!/bin/bash

set -euo pipefail

sudo sed -i 's/^#AutoEnable=true/AutoEnable=true/' /etc/bluetooth/main.conf
sudo systemctl restart bluetooth

sudo tee /etc/pacman.d/hooks/bluetooth-autoenable.hook >/dev/null <<'EOF'
[Trigger]
Type = Package
Operation = Upgrade
Target = bluez

[Action]
Description = Re-applying AutoEnable after bluez upgrade
When = PostTransaction
Exec = /usr/bin/sed -i s/^#AutoEnable=true/AutoEnable=true/ /etc/bluetooth/main.conf
EOF
