{ omarchy, lib, ... }:

{
  # Make all omarchy-* scripts available and set OMARCHY_PATH
  home.sessionPath = [ "${omarchy}/bin" ];
  home.sessionVariables.OMARCHY_PATH = "${omarchy}";

  # ~/.local/share/omarchy -> nix store so scripts referencing this path work
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
      export OMARCHY_PATH="${omarchy}"
      export PATH="${omarchy}/bin:$PATH"
      $DRY_RUN_CMD ${omarchy}/bin/omarchy-theme-set catppuccin
    fi
    # nix store files are read-only; make current theme writable so theme switching works
    $DRY_RUN_CMD chmod -R u+w "$HOME/.config/omarchy/current/theme" 2>/dev/null || true
  '';
}
