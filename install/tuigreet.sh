#!/bin/bash

set -euo pipefail

sudo tee /etc/greetd/config.toml >/dev/null <<'EOF'
[terminal]
vt = 1

[default_session]
command = "tuigreet --sessions /usr/share/wayland-sessions --remember --remember-user-session --time --asterisks"
user = "greeter"
EOF

sudo mkdir -p /var/cache/tuigreet
sudo chown greeter:greeter /var/cache/tuigreet
sudo chmod 0755 /var/cache/tuigreet

# 5k fix
sudo sed -i 's/^FONT=.*/FONT=latarcyrheb-sun32/' /etc/vconsole.conf

sudo systemctl disable cosmic-greeter
sudo systemctl enable greetd
