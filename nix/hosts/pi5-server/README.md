# NixOS on Raspberry Pi 5

Build the bootstrap SD image, flash it, boot the Pi, then deploy a role
(`pi5-server` or `pi5-kiosk`) remotely with `nixos-rebuild`.

## Prerequisites (build box)

The build machine must register binfmt for aarch64 so it can cross-compile.
On the desktop host in this repo this is already set via
`boot.binfmt.emulatedSystems = [ "aarch64-linux" ]` in
`nix/hosts/desktop/default.nix`.

## Build the bootstrap SD image

From the cross-compile build box (your desktop):

```bash
nix build .#images.pi5-bootstrap
zstd -d result/sd-image/*.img.zst -o pi5-bootstrap.img
sudo dd if=pi5-bootstrap.img of=/dev/sdX bs=4M status=progress conv=fsync
```

Replace `/dev/sdX` with the SD card device — verify with `lsblk` first.

## First boot

The bootstrap image sets `hostName = "pi5"`, runs sshd with password
authentication disabled, and provisions the SSH public key from
`nix/modules/pi5.nix` into the `benjamin` user's `authorized_keys`. SSH in
from any host holding the matching private key:

```bash
ssh benjamin@<pi-ip>
```

`benjamin` is in `wheel`; sudo prompts for the user password (set via
`/etc/nixos/password-hash` on the host).

## Deploy a role configuration

```bash
nixos-rebuild switch \
  --flake .#pi5-server \
  --target-host benjamin@<pi-ip> \
  --use-remote-sudo
```

Swap `pi5-server` for `pi5-kiosk` to deploy the kiosk role.
