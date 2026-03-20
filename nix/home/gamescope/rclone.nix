{ pkgs, lib, dotfiles, ... }:

{
  home.packages = [ pkgs.rclone ];

  # TODO: Should use SOPS at some point
  home.activation.rcloneConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -f $HOME/.config/rclone/rclone.conf ]]; then
      password=$(grep -oP 'password=\K.*' /etc/nixos/smb-secrets)
      obscured=$(${pkgs.rclone}/bin/rclone obscure "$password")
      mkdir -p "$HOME/.config/rclone"
      sed "s/^pass =$/pass = $obscured/" \
        "${dotfiles}/rclone/rclone.conf" \
        > "$HOME/.config/rclone/rclone.conf"
    fi
  '';
}
