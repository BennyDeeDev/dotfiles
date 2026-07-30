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
ssh ssh benjamin@pi5.fritz.box
```

`benjamin` is in `wheel`; sudo prompts for the user password (set via
`/etc/nixos/password-hash` on the host).

## Sops age key enrollment

On first boot, `sops.age.generateKey = true` writes
`/var/lib/sops-nix/key.txt` on the SD card, but decryption of
`benjamin-password` fails because the Pi's age pubkey isn't listed in
`.sops.yaml` yet. The bootstrap image sets
`security.sudo.wheelNeedsPassword = false` so you can still run `sudo` to
extract the pubkey even though the real password isn't usable yet
(`hashedPasswordFile` can't decrypt, so the password login path is broken
until enrollment completes).

After SSH'ing in via your authorized key, print the Pi's age pubkey:

```sh
sudo nix shell nixpkgs#age -c age-keygen -y /var/lib/sops-nix/key.txt
```

Back on your desktop, add the printed `age1...` string to `.sops.yaml` as
a new anchor (e.g. `- &pi5 age1...`) and append `*pi5` to the `age:`
recipients under `nix/secrets/common.yaml`'s `creation_rules`. Then
re-encrypt the file to the expanded recipient set and commit:

```sh
sops updatekeys nix/secrets/common.yaml
git add .sops.yaml nix/secrets/common.yaml
git commit
```

## Deploy a role configuration

First-time role switch (bootstrap still running):

```bash
nixos-rebuild switch --flake .#pi5-server \
  --target-host benjamin@pi5.fritz.box \
  --build-host benjamin@pi5.fritz.box \
  --sudo
```

Subsequent rebuilds (role config now running):

```bash
nixos-rebuild switch --flake .#pi5-server \
  --target-host benjamin@pi5.fritz.box \
  --build-host benjamin@pi5.fritz.box \
  --sudo --ask-sudo-password
```
