{ config, dotfiles, ... }:

{
  services.flatpak.packages = [ "com.usebottles.bottles" ];

  services.flatpak.overrides."com.usebottles.bottles".Context = {
    filesystems = [
      "/nix/store:ro"
      "~/Games/PC:ro"
      "${dotfiles}/bottles:rw"
      "/mnt/bazzite/bazzite/Games/PC:ro"
    ];
  };

  home.file.".var/app/com.usebottles.bottles/data/bottles/bottles/Games-Exe-Runner-Proton/bottle.yml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/bottles/bottle.yml";
}
