# Desktop NixOS Install

Installs NixOS on the Samsung SSD 990 PRO with Heatsink (serial
`S7HFNJ0Y704719Z`) with a Btrfs layout matching the previous Arch setup.

## Partition layout

| Partition | Size      | Filesystem | Mount   |
| --------- | --------- | ---------- | ------- |
| ESP       | 1G        | vfat       | `/boot` |
| root      | remainder | btrfs      | —       |

Btrfs subvolumes: `/rootfs` → `/`, `/home` → `/home`, `/log` → `/var/log`,
`/nix` → `/nix`

## Install steps

Boot from the NixOS graphical ISO (F11 on MSI boards for the boot menu).

**1. Open a terminal and clone dotfiles**

```bash
nix-shell -p git
git clone https://github.com/BennyDeeDev/dotfiles /tmp/dotfiles
```

**2. Partition, format, and mount with disko**

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
  --mode destroy,format,mount /tmp/dotfiles/nix/hosts/desktop/disko.nix
```

**3. Generate hardware configuration**

```bash
sudo nixos-generate-config --no-filesystems --root /mnt
sudo cp /mnt/etc/nixos/hardware-configuration.nix /tmp/dotfiles/nix/hosts/desktop/
```

**4. Set `neededForBoot` on `/var/log`**

Open the copied `hardware-configuration.nix` and add `neededForBoot = true;` to
the `/var/log` filesystem entry:

```nix
fileSystems."/var/log" = {
  # ... existing generated content ...
  neededForBoot = true;
};
```

This ensures `/var/log` is mounted before the systemd journal starts, so no
early boot logs are lost.

**5. Set password**

```bash
sudo mkdir -p /mnt/etc/nixos
echo -n "yourpassword" | mkpasswd -m sha-512 -s | sudo tee /mnt/etc/nixos/password-hash
```

**5a. Set NAS credentials**

```bash
sudo tee /mnt/etc/nixos/smb-secrets <<EOF
username=Benjamin
password=YOUR_NAS_PASSWORD
domain=WORKGROUP
EOF
sudo chmod 600 /mnt/etc/nixos/smb-secrets
```

**6. Install**

```bash
sudo nixos-install --flake /tmp/dotfiles/nix#desktop --root /mnt
```

**7. Reboot**

```bash
sudo reboot
```

After first boot, commit the generated `hardware-configuration.nix` to the repo.

## Identifying the correct drive

Use the serial number `S7HFNJ0Y704719Z` to confirm the drive in case NVMe
enumeration order changes:

```bash
lsblk -o NAME,SIZE,SERIAL
```
