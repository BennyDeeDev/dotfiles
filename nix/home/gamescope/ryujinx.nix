{ pkgs, lib, config, dotfiles, ... }:

{
  services.flatpak.packages = [ "io.github.ryubing.Ryujinx" ];

  xdg.desktopEntries."io.github.ryubing.Ryujinx" = {
    name = "Ryujinx";
    exec = "flatpak run --branch=stable --arch=x86_64 --command=ryujinx-wrapper --env=AVALONIA_GLOBAL_SCALE_FACTOR=2 --file-forwarding io.github.ryubing.Ryujinx @@ %f @@";
    icon = "io.github.ryubing.Ryujinx";
    terminal = false;
    type = "Application";
    comment = "A Nintendo Switch Emulator";
    genericName = "Nintendo Switch Emulator";
    categories = [ "Game" "Emulator" ];
    mimeType = [
      "application/x-nx-nca"
      "application/x-nx-nro"
      "application/x-nx-nso"
      "application/x-nx-nsp"
      "application/x-nx-xci"
    ];
    settings = {
      Keywords = "Switch;Nintendo;Emulator;";
      StartupWMClass = "Ryujinx";
      PrefersNonDefaultGPU = "true";
    };
  };

  services.flatpak.overrides."io.github.ryubing.Ryujinx".Context = {
    filesystems = [ "/nix/store:ro" "~/Games/Switch:ro" "${dotfiles}/ryujinx:rw" "/mnt/bazzite/bazzite/Games/Switch:ro" ];
    shared = [ "!network" ];
  };

  home.file.".var/app/io.github.ryubing.Ryujinx/config/Ryujinx/Config.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/ryujinx/Config.json";

  # TODO: Restore Games from NAS
  home.activation.ryujinxKeys = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    keys_dir="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/system"
    if [[ ! -f $keys_dir/prod.keys ]]; then
      mkdir -p "$keys_dir"
      ${pkgs.unzip}/bin/unzip -oj \
        '/mnt/nas/homelab/data/media/games/Switch/Firmware/ProdKeys.net-v20.3.0.zip' \
        -d "$keys_dir"
    fi
  '';

  home.activation.ryujinxFirmware = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    registered="$HOME/.var/app/io.github.ryubing.Ryujinx/config/Ryujinx/bis/system/Contents/registered"
    sentinel="$registered/.installed"
    if [[ ! -f $sentinel ]]; then
      mkdir -p "$registered"
      tmp=$(mktemp -d)
      ${pkgs.unzip}/bin/unzip -oj \
        '/mnt/nas/homelab/data/media/games/Switch/Firmware/Firmware.20.3.0.zip' \
        -d "$tmp"
      for nca in "$tmp"/*.nca; do
        dir="$registered/$(basename "$nca")"
        mkdir -p "$dir"
        mv "$nca" "$dir/00"
      done
      rm -rf "$tmp"
      touch "$sentinel"
    fi
  '';
}
