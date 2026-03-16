{ omarchy, lib, ... }:

{
  home.sessionPath = [ "$HOME/.local/share/omarchy/bin" ];
  home.sessionVariables.OMARCHY_PATH = "$HOME/.local/share/omarchy";

  home.file.".local/share/omarchy".source = omarchy;

  xdg.configFile = {
    "btop/btop.conf".source = "${omarchy}/config/btop/btop.conf";
    "swayosd/config.toml".source = "${omarchy}/config/swayosd/config.toml";
    "swayosd/style.css".source = "${omarchy}/config/swayosd/style.css";
    "walker/config.toml".source = "${omarchy}/config/walker/config.toml";
    "omarchy/themes/catppuccin-extended".source = ../../themes/catppuccin-extended;
    "omarchy/themes/catppuccin-latte-extended".source = ../../themes/catppuccin-latte-extended;
  };

  # Apply default theme on first boot (skipped if theme already set)
  home.activation.omarchyThemeInit = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -d "$HOME/.config/omarchy/current/theme" ]]; then
      export OMARCHY_PATH="$HOME/.local/share/omarchy"
      export PATH="${omarchy}/bin:$PATH"
      $DRY_RUN_CMD ${omarchy}/bin/omarchy-theme-set catppuccin
    fi
  '';
}
