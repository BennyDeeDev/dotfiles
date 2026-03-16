{ omarchy, lib, ... }:

{
  home.sessionPath = [ "$HOME/.local/share/omarchy/bin" ];
  home.sessionVariables.OMARCHY_PATH = "$HOME/.local/share/omarchy";

  xdg.configFile = {
    "btop/btop.conf".source = "${omarchy}/config/btop/btop.conf";
    "swayosd/config.toml".source = "${omarchy}/config/swayosd/config.toml";
    "swayosd/style.css".source = "${omarchy}/config/swayosd/style.css";
    "walker/config.toml".source = "${omarchy}/config/walker/config.toml";
    "omarchy/themes/catppuccin-extended".source = ../../themes/catppuccin-extended;
    "omarchy/themes/catppuccin-latte-extended".source = ../../themes/catppuccin-latte-extended;
  };

  # Copy omarchy from the nix store with normal permissions so omarchy's own cp calls don't inherit 444
  home.activation.omarchyInstall = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    dest="$HOME/.local/share/omarchy"
    if [[ ! -d "$dest" ]] || [[ "${omarchy}" != "$(cat "$dest/.nix-source" 2>/dev/null)" ]]; then
      rm -rf "$dest"
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
}
