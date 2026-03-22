{
  pkgs,
  omarchy,
  lib,
  ...
}:

{
  home.sessionPath = [ "$HOME/.local/share/omarchy/bin" ];
  home.sessionVariables.OMARCHY_PATH = "$HOME/.local/share/omarchy";

  xdg.configFile = {
    "btop/btop.conf".source = "${omarchy}/config/btop/btop.conf";
    "swayosd/config.toml".source = "${omarchy}/config/swayosd/config.toml";
    "swayosd/style.css".source = "${omarchy}/config/swayosd/style.css";
    "walker/config.toml".source = "${omarchy}/config/walker/config.toml";
    "hypr/xdph.conf".source = "${omarchy}/config/hypr/xdph.conf";
    "hypr/hyprlock.conf".source = "${omarchy}/config/hypr/hyprlock.conf";
    "omarchy/hooks/theme-set".source = ../../../omarchy/hooks/theme-set;
  };

  # Copy omarchy from the nix store with normal permissions so omarchy's own cp calls don't inherit 444
  home.activation.omarchyInstall = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    dest="$HOME/.local/share/omarchy"
    if [[ ! -d "$dest" ]] || [[ "${omarchy}" != "$(cat "$dest/.nix-source" 2>/dev/null)" ]]; then
      rm -rf "$dest"
      mkdir -p "$HOME/.local/share"
      cp -r --no-preserve=mode "${omarchy}" "$dest"
      echo "${omarchy}" > "$dest/.nix-source"
    fi
    chmod +x "$dest/bin/"*
  '';

  # Set default theme on first boot, skipped if already set
  home.activation.omarchyThemeInit = lib.hm.dag.entryAfter [ "omarchyInstall" ] ''
    if [[ ! -d "$HOME/.config/omarchy/current/theme" ]]; then
      export OMARCHY_PATH="$HOME/.local/share/omarchy"
      export PATH="${omarchy}/bin:$PATH"
      $DRY_RUN_CMD ${omarchy}/bin/omarchy-theme-set catppuccin
    fi
  '';

  # Copy dotfiles themes so omarchy-theme-set can overwrite backgrounds (no-preserve avoids Nix store 444 permissions)
  home.activation.omarchyThemes = lib.hm.dag.entryAfter [ "omarchyInstall" ] ''
    mkdir -p "$HOME/.config/omarchy/themes"
    cp -r --no-preserve=mode ${../../../themes}/* "$HOME/.config/omarchy/themes/"
  '';

  # Copy dotfiles templates into omarchy's themed directory so theme-set renders them
  home.activation.omarchyTemplates = lib.hm.dag.entryAfter [ "omarchyInstall" ] ''
    cp -r --no-preserve=mode ${../../../templates}/* "$HOME/.local/share/omarchy/default/themed/"
  '';

  # btop loads themes from its own themes/ directory; create the symlink that
  # omarchy's install script normally sets up (btop has no include/path support)
  home.activation.btopThemeLink = lib.hm.dag.entryAfter [ "omarchyThemeInit" ] ''
    $DRY_RUN_CMD mkdir -p "$HOME/.config/btop/themes"
    $DRY_RUN_CMD ln -snf "$HOME/.config/omarchy/current/theme/btop.theme" "$HOME/.config/btop/themes/current.theme"
  '';
}
