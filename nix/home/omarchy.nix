{ omarchy, lib, ... }:

{
  # Make all omarchy-* scripts available and set OMARCHY_PATH
  home.sessionPath = [ "${omarchy}/bin" ];
  home.sessionVariables.OMARCHY_PATH = "${omarchy}";

  # ~/.local/share/omarchy -> nix store so scripts referencing this path work
  home.file.".local/share/omarchy".source = omarchy;

  # User themes linked into omarchy's themes directory
  xdg.configFile = {
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
  '';
}
