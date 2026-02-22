#!/bin/bash

set -euo pipefail

sudo mkdir -p /usr/bin/steamos-polkit-helpers
sudo mkdir -p /usr/share/wayland-sessions

sudo tee /usr/bin/gamescope-session >/dev/null <<'EOF'
#!/bin/bash

# If required, setting this variable will enable additional
# options under settings in SteamOS mode, including the option 
# to 'Automatically Set Resolution' option, which can be turned
# off to set the resolution manually.
#export GAMESCOPE_MODE_SAVE_FILE="$HOME/.config/gamescope/modes.cfg"

# Assume that MangoHud is not installed
MANGOAPP_FLAG=""

# Check that mangoapp is available. Set the flag if it exists,
# otherwise inform to check that MangoHud is installed and
# proceed without the flag.
if command -v mangoapp &> /dev/null;
then
    MANGOAPP_FLAG="--mangoapp"
else
    printf "[%s] [Info] 'mangoapp' is not available on your system. Check to see that MangoHud is installed.\n" "$0"
    printf "[%s] [Info] Continuing without the '--mangoapp' flag.\n" "$0"
fi

gamescope \
    $MANGOAPP_FLAG \
    --mouse-sensitivity 2.0 \
    -e -- steam -steamdeck -steamos3
EOF
sudo chmod 755 /usr/bin/gamescope-session

sudo tee /usr/bin/jupiter-biosupdate >/dev/null <<'EOF'
#!/bin/bash

# As this is running on a standard Linux install
# state that no updates configured for this bios
# and exit
echo "No updates configured for this bios"
exit 0;
EOF
sudo chmod 755 /usr/bin/jupiter-biosupdate

sudo tee /usr/bin/steamos-polkit-helpers/jupiter-biosupdate >/dev/null <<'EOF'
#!/bin/bash

# Exit immediately on error and throw an error
# when using undefined variables
set -eu

# Run the jupiter-biosupdate script
exec /usr/bin/jupiter-biosupdate "$0"
EOF
sudo chmod 755 /usr/bin/steamos-polkit-helpers/jupiter-biosupdate

sudo tee /usr/bin/steamos-update >/dev/null <<'EOF'
#!/bin/bash

# Steam client updates are managed separately,
# so in this case return exit code 7 stating 
# no system updates.
exit 7;
EOF
sudo chmod 755 /usr/bin/steamos-update

sudo tee /usr/bin/steamos-polkit-helpers/steamos-update >/dev/null <<'EOF'
#!/bin/bash

# Exit immediately on error and throw an error
# when using undefined variables
set -eu

# Run the steamos-update script
exec /usr/bin/steamos-update "$0"
EOF
sudo chmod 755 /usr/bin/steamos-polkit-helpers/steamos-update

sudo tee /usr/bin/steamos-polkit-helpers/steamos-set-timezone >/dev/null <<'EOF'
#!/bin/bash

# Do nothing, assuming that the timezone will be set
# when installing Linux or configured separately
# from the terminal or desktop environment
exit 0;
EOF
sudo chmod 755 /usr/bin/steamos-polkit-helpers/steamos-set-timezone

sudo tee /usr/bin/steamos-select-branch >/dev/null <<'EOF'
#!/bin/bash

# As this is running on a standard Linux install
# state this is not applicable
echo "Not applicable for this OS"
EOF
sudo chmod 755 /usr/bin/steamos-select-branch

sudo tee /usr/bin/steamos-session-select >/dev/null <<'EOF'
#!/bin/bash

# Shutting down Steam will return to the terminal, 
# desktop environment or the login screen (display manager)
# depending on where Steam was launched.
steam -shutdown
EOF
sudo chmod 755 /usr/bin/steamos-session-select

sudo tee /usr/share/wayland-sessions/steam.desktop >/dev/null <<'EOF'
[Desktop Entry]
Encoding=UTF-8
Name=Steam (Gamescope)
Comment=Run Steam directly in Gamescope
Exec=gamescope-session
Type=Application
DesktopNames=gamescope
EOF
sudo chmod 644 /usr/share/wayland-sessions/steam.desktop

echo "Gamescope session installed. Select 'Steam (Gamescope)' from the display manager to launch."
